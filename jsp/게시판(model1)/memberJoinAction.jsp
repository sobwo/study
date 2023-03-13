<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import = "java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%@ include file="function.jsp" %>

<%	
	request.setCharacterEncoding("utf-8");
	
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
	
	out.println("Id : "+memberId+"<br/>");
	out.println("Pw : "+memberPw+"<br/>");
	out.println("Name : "+memberName+"<br/>");
	out.println("Email : "+memberEmail+"<br/>");
	out.println("Gender : "+memberGender+"<br/>");
	out.println("Addr : "+memberAddr+"<br/>");
	out.println("Birth : "+memberBirth+"<br/>");
	
	// 	String sql = "INSERT INTO member1230 (midx,memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip) " 
	// 				+"VALUES(midx_seq.nextval,'"+memberId+"','"+memberPw+"','"+memberName+"','"+memberEmail+"','"+memberGender+"','"+memberAddr+"','"+memberBirth+"',null)";
		
	// 	//구문 쿼리 클래스
	// 	Statement stmt = conn.createStatement();
	// 	stmt.execute(sql);
	// 	stmt.close();
	
	memberInsert(conn,memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth);
	
 %>
