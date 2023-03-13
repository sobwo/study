<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "Example1230.MemberDao" %>
<%	
	request.setCharacterEncoding("utf-8");
	
	MemberDao md = new MemberDao();
	
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	String memberPhone = request.getParameter("memberPhone");
	String memberEmail = request.getParameter("memberEmail");
	String memberGender = request.getParameter("memberGender");
	String memberAddr = request.getParameter("memberAddr");
	String birth_yy = request.getParameter("birth_yy");
	String birth_mm = request.getParameter("birth_mm");
	String birth_dd = request.getParameter("birth_dd");
	
	String memberBirth = birth_yy+birth_mm+birth_dd;

	// 	String sql = "INSERT INTO member1230 (midx,memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip) " 
	// 				+"VALUES(midx_seq.nextval,'"+memberId+"','"+memberPw+"','"+memberName+"','"+memberEmail+"','"+memberGender+"','"+memberAddr+"','"+memberBirth+"',null)";
		
	// 	//구문 쿼리 클래스
	// 	Statement stmt = conn.createStatement();
	// 	stmt.execute(sql);
	// 	stmt.close();

 	md.memberInsert(memberId, memberPw, memberName, memberEmail, memberGender, memberAddr, memberBirth);
 	
 	String path = request.getContextPath()+"/memberList.jsp"; // request.getContextPaht() = Exam1230 (루트 경로)
 	response.sendRedirect(path);
 %>