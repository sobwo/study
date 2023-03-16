<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

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
			
			.links {
			  margin-top: 10px;
			  text-align: center;
			}
			
			.links a {
			  color: #999;
			  margin: 0 10px;
			}
			
			.links a:hover {
			  color: #000;
			}
		</style>
	</head>
	<body>
		<div class="container">
	    <h1>Login</h1>
	    <form>
	    	<label for="memberId">ID</label>
	        <input type="text" id="memberId" name="memberId">
	        <label for="password">Password</label>
	        <input type="password" id="password" name="password">
	        <input type="submit" value="Login" onclick="login()">
	      </form>
	    </div>
	    
	   	<div class="links">
	        <a href="<%=request.getContextPath()%>/member/memberJoin.do">회원 가입</a>
	        <a href="<%=request.getContextPath()%>/board/boardList.do">게시판 목록</a>
	    </div>
	</body>
</html>
