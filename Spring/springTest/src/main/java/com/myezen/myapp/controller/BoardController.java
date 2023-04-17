package com.myezen.myapp.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.net.InetAddress;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.PageMaker;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.service.BoardService;
import com.myezen.myapp.util.MediaUtils;
import com.myezen.myapp.util.UploadFileUtiles;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	BoardService bs;
	
	@Autowired
	PageMaker pm;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value="/boardList.do")
	public String boardList(Model model, 
							@RequestParam(value="dataPerPage", defaultValue="10") int dataPerPage,
							@RequestParam(value="page", defaultValue="1") int page,
							@RequestParam(value="searchOption", defaultValue="제목만") String searchOption,
							@RequestParam(value="searchContext", defaultValue="") String searchContext) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setSearchOption(searchOption);
		scri.setSearchContext(searchContext);
		scri.setPage(page);
		scri.setPagePerNum(dataPerPage);
		
		ArrayList<BoardVo> boardList = bs.boardSelectAll(scri);
	
		int cnt = bs.boardTotal(scri);
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		pm.calData();
		
		model.addAttribute("dataPerPage",dataPerPage);
		model.addAttribute("boardList",boardList);
		model.addAttribute("pm", pm);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value="/boardWriteAction.do")
	public String boardWriteAction(
			@RequestParam("subject") String subject,
			@RequestParam("contents") String contents,
			@RequestParam("writer") String writer,
			@RequestParam("pwd") String pwd,
			@RequestParam("fileName") MultipartFile fileName,
			@SessionAttribute("midx") int midx) throws Exception {
			
		MultipartFile file = fileName;
		System.out.println("원본파일이름"+file.getOriginalFilename());
	
		String uploadedFileName="";
		if (!file.getOriginalFilename().equals("")) {
			uploadedFileName = UploadFileUtiles.uploadFile(
					uploadPath, 
					file.getOriginalFilename(), 
					file.getBytes());				
		}
		System.out.println("uploadedFileName"+uploadedFileName);
		
		String ip = InetAddress.getLocalHost().getHostAddress();
		String pwd2 = bcryptPasswordEncoder.encode(pwd);
		//IP 넣을것
		BoardVo bv = new BoardVo();
		bv.setSubject(subject);
		bv.setContents(contents);
		bv.setWriter(writer);
		bv.setPwd(pwd2);
		bv.setIp(ip);
		bv.setFileName(uploadedFileName);
		bv.setMidx(midx);
		
		int value = bs.boardInsert(bv);
		
		if(value==1)
			return "redirect:/board/boardList.do";
		else
			return "redirect:/";
	}
	
	@RequestMapping(value="/boardContents.do")
	public String boardContents(
			Model model,
			@RequestParam("bidx") int bidx) {
		
		
		BoardVo bv = bs.boardSelectOne(bidx);
		
		model.addAttribute("bv", bv);
		
		return "board/boardContents";
	}
	
	@RequestMapping(value="/boardModify.do")
	public String boardModify(
			Model model,
			@RequestParam("bidx") int bidx) {
		
		BoardVo bv = bs.boardSelectOne(bidx);
		model.addAttribute("bv", bv);
		
		return "board/boardModify";
	}
	
	@RequestMapping(value="/boardModifyAction.do")
	public String boardModifyAction(
			Model model,
			@RequestParam("bidx") int bidx,
			@RequestParam("subject") String subject,
			@RequestParam("contents") String contents) {
		
		BoardVo bv = new BoardVo();
		bv.setBidx(bidx);
		bv.setSubject(subject);
		bv.setContents(contents);
		int value = bs.boardModify(bv);
		
		model.addAttribute("bidx", bidx);
		
		if(value==1)
			return "redirect:/board/boardContents.do";
		else
			return "redirect:/";
	}
	
	@RequestMapping(value="/boardDelete.do")
	public String boardDelet(
			Model model,
			@RequestParam("bidx") int bidx) {
		
		model.addAttribute("bidx", bidx);
		
		return "board/boardDelete";

	}
	
	@RequestMapping(value="/boardDeleteAction.do")
	public String boardDeleteAction(
			@RequestParam("bidx") int bidx,
			@RequestParam("pwd") String pwd,
			RedirectAttributes rttr) {
		
		int value = 0;
		BoardVo bv = bs.boardSelectOne(bidx);
		
		if(bv!=null && bcryptPasswordEncoder.matches(pwd,bv.getPwd())) {
			value = bs.boardDelete(bidx);
			if(value==1) {
				rttr.addFlashAttribute("msg", "글 삭제가 완료되었습니다.");
				return "redirect:/board/boardList.do";
			}
			else {
				rttr.addFlashAttribute("msg", "글 삭제가 실패했습니다.");
				return "redirect:/board/boardContents.do?bidx="+bidx;
			}
		}
		else {
			rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "redirect:/board/boardDelete.do?bidx="+bidx;
		}
	}
		
	
	@RequestMapping(value="/boardReply.do")
	public String boardReply() {
		
		
		return "board/boardReply";
	}
	
	@ResponseBody
	@RequestMapping(value="/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName,@RequestParam(value="down",defaultValue="0" ) int down ) throws Exception{
		
	//	System.out.println("fileName:"+fileName);
		
		InputStream in = null;		
		ResponseEntity<byte[]> entity = null;
		
	//	logger.info("FILE NAME :"+fileName);
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();		
			 
			in = new FileInputStream(uploadPath+fileName);
			
			
			if(mType != null){
				
				if (down==1) {
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");	
					
				}else {
					headers.setContentType(mType);	
				}
				
			}else{
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	} 

}

