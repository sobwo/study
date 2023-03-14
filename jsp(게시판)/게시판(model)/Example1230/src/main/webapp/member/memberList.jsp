<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "Example1230.domain.*" %>
<%@ page import = "java.util.*" %>
<%
	ArrayList<MemberVo> memberList = (ArrayList<MemberVo>)request.getAttribute("memberList");
%>      
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 목록 페이지</title>
		<style>
			*{margin:0; padding:0; font-family:'돋움'; font-size:15px;text-align:center;}
			body{display:flex; justify-content:center; flex-direction: column; align-items: center;}
			h1{font-size:50px; font-weight:bold;}
			table{border-collapse:collapse;margin-top:15px;}
			table th{font-weight:bold;font-size:16px;height:40px;}
			table th:nth-child(1){width:80px;}
			table th:nth-child(2){width:100px;}
			table th:nth-child(3){width:150px;}
			table th:nth-child(4){width:100px;}
			table th:nth-child(5){width:150px;}
			table td {border:1px solid #e4e4e4; font-size:14px; height:20px;}
		</style>
	</head>
	<body>
	<h1>회원 목록</h1>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>회원아이디</th>
				<th>회원이름</th>
				<th>탈퇴여부</th>
				<th>가입일</th>
			</tr>
		<thead>
		<% for(MemberVo mv : memberList) {%>
		<tr>
			<td><%= mv.getMidx() %></td>
			<td><%= mv.getMemberId() %></td>
			<td><%= mv.getMemberName() %></td>
			<td><%= mv.getDelyn() %></td>
			<td><%= mv.getWriteDay() %></td>
		<%} %>
		</tr>
	</table>
	
	</body>
</html>