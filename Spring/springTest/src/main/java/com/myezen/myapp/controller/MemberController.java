package com.myezen.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@RequestMapping(value="/memberJoin.do")
	public String memberJoin() {
		
		
		return "member/memberJoin";
	}
	
	@RequestMapping(value="/memberLogin.do")
	public String memberLogin() {
		
		
		return "member/memberLogin";
	}
}
