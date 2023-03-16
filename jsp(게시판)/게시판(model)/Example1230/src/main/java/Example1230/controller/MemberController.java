package Example1230.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Example1230.service.MemberDao;
import Example1230.domain.MemberVo;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String str;
	
	public MemberController(String path) {
		this.str = path;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("utf-8");
		
		if(str.equals("/member/memberList.do")) { //추출한 가상경로가 이 문자열과 같나요?
			System.out.println("가상경로로 memberList 들어옴");
			
			MemberDao md = new MemberDao();
		 	ArrayList<MemberVo> memberList = md.memberSelectAll();
			request.setAttribute("memberList", memberList);  //내부 이동할 때 자원 공유
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberList.jsp");
			rd.forward(request, response);
		}
		
		else if(str.equals("/member/memberJoin.do")) {
			System.out.println("가상경로로 memberJoin 들어옴");
//			RequestDispatcher rd = request.getRequestDispatcher("/memberJoin.jsp");
//			rd.forward(request, response);
			String path = request.getContextPath()+"/member/memberJoin.jsp";
			response.sendRedirect(path);
		}
		
		else if(str.equals("/member/memberData.do")) {
			System.out.println("가상경로로 memberData 들어옴");
		
			MemberDao md = new MemberDao();
			
			String memberId = request.getParameter("memberId");
			String memberPw = request.getParameter("memberPw");
			String memberName = request.getParameter("memberName");
//			String memberPhone = request.getParameter("memberPhone");
			String memberEmail = request.getParameter("memberEmail");
			String memberGender = request.getParameter("memberGender");
			String memberAddr = request.getParameter("memberAddr");
			String birth_yy = request.getParameter("birth_yy");
			String birth_mm = request.getParameter("birth_mm");
			String birth_dd = request.getParameter("birth_dd");
			
			String memberBirth = birth_yy+birth_mm+birth_dd;

			// 	String sql = "INSERT INTO member1230 (midx,memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip) " 
			// 				+"VALUES(midx_seq.nextval,'"+memberId+"','"+memberPw+"','"+memberName+"','"+memberEmail+"','"+memberGender+"','"+memberAddr+"','"+memberBirth+"',null)";
				
			// 	//구문 쿼리 클래스
			// 	Statement stmt = conn.createStatement();
			// 	stmt.execute(sql);
			// 	stmt.close();

		 	md.memberInsert(memberId, memberPw, memberName, memberEmail, memberGender, memberAddr, memberBirth);
		 	
		 	//	String path = request.getContextPath()+"/memberList.jsp"; // request.getContextPaht() = Exam1230 (루트 경로)
		 	
			String path = request.getContextPath()+"/member/memberList.do";
		 	response.sendRedirect(path);
		}
		
		else if (str.equals("/member/memberIdCheck.do")) {
			 String memberId = request.getParameter("memberId");
			 
			 //넘어온 memberId와 같은 아이디가 있는지 체크
			 MemberDao md = new MemberDao();
			 int value = md.memberIdCheck(memberId);
			 
			 PrintWriter out = response.getWriter();
			 out.println("{\"value\": \""+value+"\"}");
		}
		
		else if(str.equals("/member/memberLogin.do")) {
			System.out.println("memberLogin 들어옴");
			String memberId = request.getParameter("memberId");
			String memberPw = request.getParameter("memberPw");
			MemberDao md = new MemberDao();
			int midx = md.memberLogin(memberId,memberPw);
			
			System.out.println("midx="+midx);
					
			if(midx==0) {
				response.setContentType("text/html; charset=UTF-8");
			    PrintWriter out = response.getWriter();
			    out.println("<script>alert('패스워드가 일치하지 않습니다.');history.go(-1);</script>");
			    out.flush();
			    return;
			}
			
			else {
				RequestDispatcher rd = request.getRequestDispatcher("/board/boardList.do?midx="+midx);
				rd.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
