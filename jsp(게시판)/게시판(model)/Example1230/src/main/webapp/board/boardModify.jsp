<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Example1230.domain.*" %>
<% BoardVo bv = (BoardVo)request.getAttribute("boardContents");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 작성 페이지</title>
		<style>
			*{
				padding:0;
				border:0; 
				font-size:13px;
				font-family:"맑은 고딕";
			}
			
			body{
				display:flex; 
				justify-content:center; 
				flex-direction: column; 
				align-items: center;
			}
				
			h1{
				font-size:30px;
			}
				
			table{ 
				border:0; 
				border-top:2px solid black;
			}
			th,td{
				height:40px;
				border: 1px solid #e4e4e4;
			}
			th > input{
				width:862px; height:40px;
			}
			
			
			td>input, td>textarea{
				width:862px;
				height:410px;
				resize:none;
			}
			
			#submit{
				margin-top:10px;
			}
			
			#submit input{
				width:80px;
				height:30px;
			}
			
			#submit input[type=file]{
				width:300px;
			}
			
			#submit span:nth-child(2), #submit span:nth-child(3){
				float:right; margin:0 5px;
			}
			#submit input[type=button], #submit input[type=reset]{
				width: 80px;
			  	height: 30px;
			  	border: 1px solid #a4a4a4;
			  	border-radius: 10px;
			  	font-size:14px;
			  	cursor:pointer;
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
				
				if (fm.contents.value == ""){
					alert("내용을 입력하세요");
					fm.contents.focus();
					isYN = 0;
				}
				
				if(isYN ==1){
					alert();
					fm.action = "<%=request.getContextPath()%>/board/boardModifyAction.do?bidx=<%=bv.getBidx()%>";
					fm.method = "post";
					fm.submit();
				}
			}
		</script>
	</head>
	<body>
		<h1>글 작성</h1>
		<form name="frm">
			<table>
				<thead>
					<tr>
						<th><input type=text name="subject" value="<%=bv.getSubject() %>"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span><%=bv.getWriter() %></span></td>
					</tr>
					<tr>
						<td><textarea style="vertical-align:top;" name="contents"><%=bv.getContents()%></textarea></td>
					</tr>
				</tbody>
			</table>
			<div id="submit">
				<span><input type="file"></span>
				<span><input type="button" onclick="check()" value="등록"></span>
				<span><input type="button" value="초기화"></span>
			</div>
		</form>
	</body>
</html>