<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	String memberPhone = request.getParameter("memberPhone");
	String memberEmail = request.getParameter("memberEmail");
	String memberGender = request.getParameter("memberGender");
	String memberAddr = request.getParameter("memberAddr");
	String birthyy = request.getParameter("birth_yy");
	String birthmm = request.getParameter("birth_mm");
	String birthdd = request.getParameter("birth_dd");
	
	String memberBirth = birthyy+birthmm+birthdd;
	
	out.println("Id : "+memberId+"<br/>");
	out.println("Pw : "+memberPw+"<br/>");
	out.println("Name : "+memberName+"<br/>");
	out.println("Email : "+memberEmail+"<br/>");
	out.println("Gender : "+memberGender+"<br/>");
	out.println("Addr : "+memberAddr+"<br/>");
	out.println("Birth : "+memberBirth+"<br/>");

	
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user = "system";
	String password = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver"); //동적로딩 - 메모리에 올림
	Connection conn = DriverManager.getConnection(url,user,password); // db와 접속시킴
	
	String sql = "INSERT INTO member1230 (midx,memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip) " 
				+"VALUES(midx_seq.nextval,'"+memberId+"','"+memberPw+"','"+memberName+"','"+memberEmail+"','"+memberGender+"','"+memberAddr+"','"+memberBirth+"',null)";
	//구문 쿼리 클래스
	Statement stmt = conn.createStatement();
	stmt.execute(sql);
	stmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>