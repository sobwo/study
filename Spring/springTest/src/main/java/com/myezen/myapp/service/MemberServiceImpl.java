package com.myezen.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.persistance.MemberService_Mapper;

@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	private MemberService_Mapper msm;
	
	//mybatis¿Í ¿¬µ¿
	@Autowired
	public MemberServiceImpl(SqlSession sqlSession) {
		this.msm = sqlSession.getMapper(MemberService_Mapper.class);
	}
	
	@Override
	public int memberInsert(String memberId, String memberPw, String memberName, String memberPhone,
			String memberEmail, String memberGender, String memberAddr, String memberBirth) {
		
		MemberVo mv = new MemberVo();
		mv.setMemberId(memberId);
		mv.setMemberPw(memberPw);
		mv.setMemberName(memberName);
		mv.setMemberPhone(memberPhone);
		mv.setMemberEmail(memberEmail);
		mv.setMemberGender(memberGender);
		mv.setMemberAddr(memberAddr);
		mv.setMemberBirth(memberBirth);
		
		int value = msm.memberInsert(mv);
		
		return value;
	}


	@Override
	public ArrayList<MemberVo> memberList() {
		ArrayList<MemberVo> alist = msm.memberList();
		
		return alist;
	}


	@Override
	public int memberIdCheck(String memberId) {
		int value = msm.memberIdCheck(memberId);
		
		return value;
	}
	
	@Override
	public MemberVo memberLogin(String memberId) {
		MemberVo mv = msm.memberLogin(memberId);
		
		return mv;
	}
	

}
