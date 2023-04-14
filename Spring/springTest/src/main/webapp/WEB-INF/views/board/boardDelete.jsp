<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<title>글 삭제</title>
		<style>
	      body {
	        font-family: Arial, sans-serif;
	        background-color: #f7f7f7;
	      }
	      
	      table {
	        margin: 50px auto;
	        background-color: #fff;
	        border-collapse: collapse;
	        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	      }
	      
	      th,td {
	        padding: 10px;
	        text-align: left;
	        border: 1px solid #ddd;
	      }
	      
	      th {
	        background-color: #eee;
	      }
	      
	      input[type="password"] {
	        padding: 10px;
	        border: 1px solid #ddd;
	        border-radius: 4px;
	        font-size: 16px;
	        width: 100%;
	        box-sizing: border-box;
	      }
	      
	      input[type="button"] {
	        padding: 10px;
	        background-color: #007bff;
	        color: #fff;
	        border: none;
	        border-radius: 4px;
	        font-size: 16px;
	        cursor: pointer;
	      }
	      
	      input[type="button"]:hover {
	        background-color: #0062cc;
	      }
	    </style>
	</head>
	<body>
		<form name = "frm">
			<input type="hidden" name="bidx" value="${param.bidx}">
			<table border=1 style="width:500px;">
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd"></td>
				</tr>
					<tr><td colspan=2>
					<input type="button" value="확인" onclick="check()">
				</td></tr>
			</table>
		</form>
		
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var msg = "<%=msg%>";
				if(msg != "") alert(msg);
			});
			function check(){	
				
				var fm = document.frm;
				if (fm.pwd.value == ""){
					alert("비밀번호를 입력하세요");
					fm.password.focus();
				}
				
				fm.action = "${pageContext.request.contextPath}/board/boardDeleteAction.do";
				fm.method="post";
				fm.submit();
			}
	
		</script>
	</body>
</html>