<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
		<script type="text/javascript">
			function check(){	
				
				var fm = document.frm;	
				if (fm.memberPw.value == ""){
					alert("비밀번호를 입력하세요");
					fm.password.focus();
				}
				alert("");
				
				fm.action = "<%=request.getContextPath()%>/board/boardDeleteAction.do";
				fm.method="post";
				fm.submit();
			}
	
	</script>
	
	</head>
	<body>
		<form name = "frm">
			<table border=1 style="width:500px;">
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="memberPw"></td>
				</tr>
					<tr><td colspan=2>
					<input type="button" value="확인" onclick="check()">
				</td></tr>
			</table>
		</form>
	</body>
</html>