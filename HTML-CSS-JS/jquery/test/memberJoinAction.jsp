<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//자바영역
	//자바request객체로 파라미터 메소드 호출해서 memberID객체의 담긴값을 받는다.
	String memberId = request.getParameter("memberId"); out.println("ID : "+memberId+"<br/>");
	String memberPw = request.getParameter("memberPw"); out.println("PassWord : "+memberPw+"<br/>");
	String memberPw2 = request.getParameter("memberPw2"); 
	String name = request.getParameter("name"); out.println("이름 : "+name+"<br/>");
	String gen = request.getParameter("gen"); out.println("성별 : "+gen+"<br/>");
	String region = request.getParameter("region"); out.println("지역 : "+region+"<br/>");
	String birth = request.getParameter("birth"); out.println("생년월일 : "+birth+"<br/>");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	이곳으로 데이터가 넘어옵니다.
</body>
</html>