<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
			
			.links {
				display: flex;
				justify-content: space-between;
				align-items: center;
				padding: 10px;
				background-color: #fff;
				border-bottom: 1px solid #ccc;
			}
			
			.links a {
				color: #333;
				text-decoration: none;
				font-size: 16px;
				padding: 10px;
				border-radius: 5px;
				background-color: #f2f2f2;
				transition: background-color 0.3s ease;
			}
			
			.links a:hover {
				background-color: #ddd;
			}
			
			.login_info {
				margin: 50px auto;
				max-width: 500px;
				background-color: #fff;
				border-radius: 5px;
				padding: 20px;
				box-shadow: 0px 0px 10px 1px rgba(0,0,0,0.2);
			}
			
			.member-info {
				display: flex;
				margin-bottom: 10px;
			}
			
			.member-info span {
				font-weight: bold;
				margin-right: 10px;
			}
			
			.logout-btn {
				background-color: #333;
				color: #fff;
				padding: 10px;
				border: none;
				border-radius: 5px;
				cursor: pointer;
				transition: background-color 0.3s ease;
			}
			
			.logout-btn:hover {
				background-color: #666;
			}
		</style>
	</head>
	<body>
	   	<div class="links">
	        <a href="<%=request.getContextPath()%>/board/boardList.do?value=0">게시판 목록</a>
			<a href="<%=request.getContextPath()%>/member/memberLogin.do">로그인</a>
			<a href="<%=request.getContextPath()%>/member/memberJoin.do">회원 가입</a>
		</div>
		<div class="login_info">
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
				<button class="logout-btn" onclick="location.href='<%=request.getContextPath()%>/member/memberLogOut.do'">로그아웃</button>	
			<%}%>
	    </div>
	</body>
</html>
