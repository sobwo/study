package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@RequestMapping(value="/boardList.do")
	public String boardList() {
		
		
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
