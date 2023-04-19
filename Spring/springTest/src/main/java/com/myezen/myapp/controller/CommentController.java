package com.myezen.myapp.controller;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.myezen.myapp.domain.CommentVo;
import com.myezen.myapp.service.CommentService;

@RestController  //ResponseBody 모든 컨트롤러에 적용됨
@RequestMapping(value="/comment")
public class CommentController {
	
	@Autowired
	CommentService cs;
	
	
	@RequestMapping(value="/commentWrite.do", method=RequestMethod.POST)
	
	public JSONObject commentWrite(
			CommentVo cv
			) throws Exception{

		
		String ip = InetAddress.getLocalHost().getHostAddress();
		cv.setIp(ip);
		
		JSONObject js = new JSONObject();
		int value = cs.commentInsert(cv);
		js.put("value", value);
	
		return js;
	}
	
	@RequestMapping(value="/{bidx}/commentList.do")
	public JSONObject commentList(@PathVariable("bidx") int bidx) {
		JSONObject jsArray = new JSONObject();
		ArrayList<CommentVo> alist =  cs.commentSelectAll(bidx);

		jsArray.put("alist", alist);
		
		return jsArray;
	}
	
	
	
}
