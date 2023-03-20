<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Example1230.domain.*"%>
<% BoardVo bv = (BoardVo)request.getAttribute("bv"); %>
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
			
			table {
			  border-collapse: collapse;
			  border: 0;
			  border-top: 2px solid black;
			}
			
			th > input {
			  width: 862px;
			  height: 40px;
			}
			
			td > input, td > textarea {
			  width: 862px;
			  height: 410px;
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
			
			#submit span:nth-child(2), #submit span:nth-child(3) {
			  float: right;
			  margin: 0 5px;
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
				alert("비밀번호을 입력하세요");
				fm.pwd.focus();
				isYN = 0;
			}
			
			if(isYN==1){
				fm.action ="<%=request.getContextPath()%>/board/boardReplyAction.do";
				fm.method="post";
				fm.submit();
			}
		}
		</script>
	</head>
	<body>
		<h1>글 작성</h1>
		<form name="frm">
			<input type="hidden" name ="bidx" value="<%=bv.getBidx()%>">
			<input type="hidden" name ="originBidx" value="<%=bv.getOriginbidx()%>">
			<input type="hidden" name ="depth" value="<%=bv.getDepth()%>">
			<input type="hidden" name ="level_" value="<%=bv.getLevel_()%>">
			<table>
				<thead>
					<tr>
						<th><input type=text name="subject" placeholder="제목을 입력해 주세요."></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input style="height:40px;" name="writer" type=text placeholder="작성자를 입력하세요"></td>
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
				<span><input type=file></span>
				<span><input type="button" onclick="check()" value="등록"></span>
				<span><input type="reset" value="초기화"></span>
			</div>
		</form>
	</body>
</html>