package com.myezen.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.service.MemberService;

@Controller
@RequestMapping(value="/member")

public class MemberController {
	
	@Autowired
	MemberService ms;
	//memberService�� ���� Ÿ�Ե��� �����ϴ°�(memberservice�� �ִ� �޼ҵ� ���)
	
	//��ȣȭ �ϴ� ��� ����
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value="/memberJoin.do")
	public String memberJoin(){
			
		return "member/memberJoin";
	}

	@RequestMapping(value="/memberJoinAction.do")
	public String memberJoinAction(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			@RequestParam("memberName") String memberName,
			@RequestParam("memberPhone") String memberPhone,
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberGender") String memberGender,
			@RequestParam("memberAddr") String memberAddr,
			@RequestParam("birth_yy") String birth_yy,
			@RequestParam("birth_mm") String birth_mm,
			@RequestParam("birth_dd") String birth_dd
			){
		String memberBirth = birth_yy + birth_mm + birth_dd;
		//���� pwd�� ��ȣȭ
		String memberPw2 = bcryptPasswordEncoder.encode(memberPw);

		int value = ms.memberInsert(memberId, memberPw2, memberName, memberPhone, memberEmail, memberGender, memberAddr, memberBirth);	
		System.out.println(memberPw);
		
		//redirect = java �� sendredirect�� ����	
		return "redirect:/";
	}
	
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model) {
		
		ArrayList<MemberVo> memberList = ms.memberList();
		
		//Model Ŭ������ ����Ͽ� list�� ��´�.
		model.addAttribute("memberList",memberList);
		
		return "member/memberList";
	}
	
	@ResponseBody
	@RequestMapping(value="/memberIdCheck.do")
	public String memberIdCheck(@RequestParam("memberId") String memberId) {
		
		String str = null;
		int value = 0;
		
		
		value = ms.memberIdCheck(memberId);
		
		str = "{\"value\":\""+value+"\"}";
		return str;
	}
	
	@RequestMapping(value="/memberLogin.do")
	public String memberLogin() {
		
		return "member/memberLogin";
	}
	
	@RequestMapping(value="/memberLoginAction.do")
	public String memberLoginAction(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			HttpSession session,
			RedirectAttributes rttr){
		
		String path = "";
		MemberVo mv = ms.memberLogin(memberId);
		
		if(mv != null && bcryptPasswordEncoder.matches(memberPw, mv.getMemberPw())) {
			session.setAttribute("midx", mv.getMidx());
			session.setAttribute("memberName", mv.getMemberName());
			path = "redirect:/";
		}
		else {
			System.out.println("����");
			rttr.addFlashAttribute("msg", "���̵�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			path="redirect:/member/memberLogin.do";
		}
			
		return path;
		
	}
	
	@RequestMapping(value="/memberLogOut.do")
	public String memberLogOutAction(HttpSession session){
		session.removeAttribute("midx");
		session.removeAttribute("memberName");
		session.invalidate();
			
		return "redirect:/";
		
	}
	
}
