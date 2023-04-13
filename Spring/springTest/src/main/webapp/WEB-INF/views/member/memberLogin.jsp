<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String msg = "";
	if(request.getAttribute("msg")!=null) 
		msg = (String)request.getAttribute("msg");
%>    
<!DOCTYPE html>
<html>
	<head>
  		<meta charset="UTF-8">
    	<title>Login</title>
    	<style>
	    	body {
			  background-color: #f2f2f2;
			  font-family: Arial, sans-serif;
			}
			
			.container {
			  background-color: #fff;
			  width: 450px;
			  margin: 0 auto;
			  padding: 20px;
			  border-radius: 5px;
			  box-shadow: 0 2px 5px rgba(0,0,0,0.3);
			}
			
			h1 {
			  text-align: center;
			  margin-bottom: 20px;
			}
			
			label {
			  display: block;
			  margin-bottom: 5px;
			}
			
			input[type="text"],
			input[type="password"] {
			  width: 90%;
			  padding: 10px;
			  border-radius: 3px;
			  border: 1px solid #ccc;
			  margin-bottom: 10px;
			}
			
			input[type="submit"] {
			  background: #A4A4A4;
			  color: white;
			  padding: 10px 20px;
			  border: none;
			  border-radius: 3px;
			  cursor: pointer;
			  margin-top: 10px;
			}
			
			input[type="submit"]:hover {
			  background: #000;
			}
			
		</style>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var msg = "<%=msg%>";
				if(msg != "") alert(msg);
				
			});
			function login(){
				if ($("#memberId").val() == ""){
					alert("아이디를 입력하세요");
					$("#memberId").focus();
					
				}else if ($("#memberPw").val() == ""){
					alert("비밀번호를 입력하세요");
					$("#memberPwd").focus();
				}
				
				var fm = document.frm;
				fm.action="${pageContext.request.contextPath}/member/memberLoginAction.do";
				fm.method="post";
				fm.submit();
			}
			
		</script>
	</head>
	<body>
		<div class="container">
	    <h1>Login</h1>
	    <form name = "frm">
	    	<label for="memberId">ID</label>
	        <input type="text" id="memberId" name="memberId">
	        <label for="memberPw">memberPw</label>
	        <input type="password" id="memberPw" name="memberPw">
	        <input type="submit" value="Login" onclick="login()">
	      </form>
	    </div>
	</body>
</html>
