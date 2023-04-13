package com.myezen.myapp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.PageMaker;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	BoardService bs;
	
	@RequestMapping(value="/boardList.do")
	public String boardList(Model model, 
							@RequestParam(value="dataPerPage", defaultValue="10") int dataPerPage,
							@RequestParam(value="page", defaultValue="1") int page,
							@RequestParam(value="searchOption", defaultValue="Á¦¸ñ¸¸") String searchOption,
							@RequestParam(value="searchContext", defaultValue="") String searchContext) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setSearchOption(searchOption);
		scri.setSearchContext(searchContext);
		scri.setPage(page);
		scri.setPagePerNum(dataPerPage);
		ArrayList<BoardVo> boardList = bs.boardSelectAll(scri);
		
		int cnt = bs.boardTotal(scri);
		
		PageMaker pm = new PageMaker();
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
	
	@RequestMapping(value="/boardModify.do")
	public String boardModify() {
		
		
		return "board/boardModify";
	}
	
	@RequestMapping(value="/boardContents.do")
	public String boardContents() {
		
		
		return "board/boardContents";
	}
	
	@RequestMapping(value="/boardReply.do")
	public String boardReply() {
		
		
		return "board/boardReply";
	}
	
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete() {
		
		
		return "board/boardDelete";
	}
}
