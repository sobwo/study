<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>글 내용 페이지</title>
		<style>
			a:link{text-decoration:none;}
			*{padding:0, border:0; font-size:13px;font-family:"맑은 고딕";}
			body{display:flex; justify-content:center; flex-direction: column; align-items: center;}
			h1{font-size:30px;}
			table{border-collapse:collapse; border:0; border-top:2px solid black;}
			th, td{width:862px; height:40px; border:1px solid #e4e4e4;}
			th{border-bottom:0; font-size:15px;}
			td{height:410px;}
			tbody > tr:first-child td{height:40px;}
			tbody > tr:last-child td{height:40px;}
			tbody span{width:50px; padding:10px 0 10px 10px;}
			tbody span:nth-child(1){font-size:15px;font-weight:bold;line-height:30px;}
			tbody span:nth-child(3){font-size:12px; color:gray;}
			tbody span:nth-child(4){font-size:12px; color:gray;}
			
			#btn{float:right;margin-top:20px;}
			button{width:80px; height:30px;}
			
		</style>
	</head>
	<body>
		<h1>글 내용</h1>
		<table>
				<thead>
					<tr>
						<th colspan="2">제목</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" style="border-top:0; height:80px;">
							<span>작성자</span><br/>
							<span>조회수</span>
							<span>작성날짜</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">글 내용</td>
					</tr>
					<tr>
						<td style="border:0; height:40px;">첨부파일</td>
					</tr>
					<tr>
						<td style="width:400px; border:0;"></td>
						<td style="border:0;">
							<form>
								<div id="btn">
									<button><a href="boardModify.jsp">수정</a></button>
									<button><a href="boardDelete.jsp">삭제</a></button>
									<button><a href="boardReply.jsp">답변</a></button>
									<button><a href="boardList.jsp">목록</a></button>
								</div>
							</form>
						</td>
					</tr>
				</tbody>
			</table>
	</body>
</html>