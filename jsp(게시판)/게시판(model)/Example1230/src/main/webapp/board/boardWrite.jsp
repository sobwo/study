<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("midx") == null){	
		out.println("<script>alert('로그인 하셔야 합니다.'); history.back(-1);</script>");
}
%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 작성 페이지</title>
		<style>
			* {
			  padding: 0;
			  border: 0;
			  font-size: 13px;
			  font-family: "맑은 고딕";
			}
			
			body {
			  display: flex;
			  justify-content: center;
			  flex-direction: column;
			  align-items: center;
			}
			
			h1 {
			  font-size: 30px;
			}
			
			h1 a{
				font-size:30px;
			}
			
			table {
			  border: 0;
			  border-top: 2px solid black;
			}
			th,td{
				border: 1px solid #e4e4e4;
			}
			 th > input, td > input{
			  width: 862px;
			  height: 50px;
			  text-indent:10px;
			}
			
			td > textarea {
			  width: 862px;
			  height: 410px;
			  text-indent:10px;
			  line-height:40px;
			  resize: none;
			}
			
			#submit {
			  margin-top: 10px;
			}
			
			#submit input {
			  width: 80px;
			  height: 30px;
			}
			
			#submit input[type=file] {
			  width: 300px;
			}
			
			#submit span:nth-child(2),
			#submit span:nth-child(3) {
			  float: right;
			  margin: 0 5px;
			}
			
			#submit input[type=button], #submit input[type=reset]{
				width: 80px;
			  	height: 30px;
			  	border: 1px solid #a4a4a4;
			  	border-radius: 10px;
			  	font-size:14px;
			  	cursor:pointer;
			}

			a:link, a:visited {
				  text-decoration: none;
				  color: black;
				}
		</style>
		
		<script type="text/javascript">
			function check(){	
				var fm = document.frm;	
				var isYN = 1;

				if (fm.subject.value == "" ){
					alert("제목을 입력하세요");
					fm.subject.focus();
					isYN = 0;
				}
				if (fm.writer.value == ""){
					alert("작성자를 입력하세요");
					fm.writer.focus();
					isYN = 0;
				}
				if (fm.contents.value == ""){
					alert("내용을 입력하세요");
					fm.contents.focus();
					isYN = 0;
				}
				if (fm.pwd.value == ""){
					alert("내용을 입력하세요");
					fm.pwd.focus();
					isYN = 0;
				}
				
				if(isYN==1){
					fm.action = "<%=request.getContextPath()%>/board/boardData.do";
					fm.method="post";
					fm.submit();
				}
			}
		</script>
	</head>
	<body>
		<h1><a href="<%=request.getContextPath()%>/index.jsp">홈 바로가기</a></h1>	
		<h1>글 작성</h1>
		<form name="frm">
			<table>
				<thead>
					<tr>
						<th><input type="text" name="subject" placeholder="제목을 입력해 주세요."></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="writer"  placeholder="작성자를 입력하세요"></td>
					</tr>
					<tr>
						<td><textarea style="vertical-align:top;" name="contents" placeholder="내용을 입력하세요."></textarea></td>
					</tr>
					<tr>
						<td><input type="password" style="height:30px;" name="pwd" placeholder="비밀번호를 입력하세요."></td>
					</tr>
				</tbody>
			</table>
			<div id="submit">
				<span><input type="file"></span>
				<span><input type="button" onclick="check()" value="등록"></span>
				<span><input type="reset" value="초기화"></span>
			</div>
		</form>
	</body>
</html>