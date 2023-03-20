<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
	<head>
  		<meta charset="UTF-8">
    	<title>Login</title>
		<style>
			/* Reset default styles */
			* {
				box-sizing: border-box;
				margin: 0;
				padding: 0;
			}

			body {
				background-color: #f2f2f2;
				font-family: Arial, sans-serif;
				font-size: 16px;
				line-height: 1.5;
				color: #333;
			}
			
			.links {
				display: flex;
				justify-content: center;
				align-items: center;
				margin-top: 20px;
			}
			
			.links a {
				color: #999;
				margin: 0 20px;
				font-size: 20px;
				font-weight: 400;
				text-decoration: none;
				transition: color 0.3s ease-in-out;
			}
			
			.links a:hover {
				color: #000;
			}
			
			.member-info {
				display: flex;
				align-items: center;
				margin-left: 20px;
			}

			.member-info span {
				margin-right: 10px;
				font-size: 18px;
				font-weight: 400;
				color: #555;
			}

			.member-info a {
				color: #999;
				font-size: 18px;
				font-weight: 400;
				text-decoration: none;
				transition: color 0.3s ease-in-out;
				padding: 10px;
				border-radius: 5px;
				border: 1px solid #999;
				margin-left: 20px;
			}

			.member-info a:hover {
				color: #000;
				background-color: #fff;
				border-color: #000;
			}
		</style>
	</head>
	<body>
	   	<div class="links">
	        <a href="<%=request.getContextPath()%>/board/boardList.do?value=0">게시판 목록</a>
			<a href="<%=request.getContextPath()%>/member/memberLogin.do">로그인</a>
			<a href="<%=request.getContextPath()%>/member/memberJoin.do">회원 가입</a>
			<% if (session.getAttribute("midx") != null){
				int midx = (int)session.getAttribute("midx");
				String memberName = (String)session.getAttribute("memberName"); %>	
				<div class="member-info">
					<span>회원번호:</span>
					<span><%=midx%></span>
				</div>
				<div class="member-info">
					<span>회원이름:</span>
					<span><%=memberName%></span>
				</div>
				<a href="<%=request.getContextPath()%>/member/memberLogOut.do">로그아웃</a>	
			<%}%>
	    </div>
	</body>
</html>
