package Example1230.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Example1230.domain.BoardVo;
import Example1230.service.BoardDao;


@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String str;
	public BoardController(String path) {
		this.str = path;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		if(str.equals("/board/boardList.do")) {
			System.out.println("boardList로 들어옴");
			BoardDao bd = new BoardDao();
			
			ArrayList<BoardVo> boardList = bd.boardSelectAll();
			request.setAttribute("boardList", boardList);
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardList.jsp");
			rd.forward(request, response);
		}
		
		else if(str.equals("/board/boardSearch.do")) {
			System.out.println("boardSearch 들어옴");
			
			String option = request.getParameter("searchOption");
			String context = request.getParameter("searchContext");
			BoardDao bd = new BoardDao();
			ArrayList<BoardVo> boardList = bd.boardSearch(option, context);
			request.setAttribute("boardList", boardList);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardList.jsp");
			rd.forward(request, response);
		}
		
		else if(str.equals("/board/boardWrite.do")) {
			System.out.println("boardWrite로 들어옴");

			RequestDispatcher rd = request.getRequestDispatcher("/board/boardWrite.jsp");
			rd.forward(request, response);
		}
		
		else if(str.equals("/board/boardData.do")) {
			System.out.println("boardData로 들어옴");
			String subject = request.getParameter("subject");
			String writer = request.getParameter("writer");
			String contents = request.getParameter("contents");
			String pwd = request.getParameter("pwd");
			String ip = InetAddress.getLocalHost().getHostAddress();			
//			String ip = request.getHeader("X-Forwarded-For"); 
//			if(ip==null) request.getRemoteAddr();
			HttpSession session = request.getSession();
			int midx =(int)session.getAttribute("midx");
			BoardDao bd = new BoardDao();
			
			bd.boardInsert(subject, contents, writer,ip,midx,pwd);
			
			String path = request.getContextPath()+"/board/boardList.do";
		 	response.sendRedirect(path);
		}
		
		else if(str.equals("/board/boardContents.do")) {
			System.out.println("boardContents로 들어옴");
			int bidx = Integer.parseInt(request.getParameter("bidx"));
			
			BoardDao bd = new BoardDao();
			bd.boardViewCnt(bidx);
			BoardVo bv = bd.boardSelectOne(bidx);
			
			request.setAttribute("boardContents", bv);
			
			System.out.println("originbidx="+bv.getOriginbidx());
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardContents.jsp");
			rd.forward(request, response);
		}
		
		else if(str.equals("/board/boardModify.do")) {
			System.out.println("boardModify로 들어옴");
			int bidx = Integer.parseInt(request.getParameter("bidx"));  
			
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.boardSelectOne(bidx);
			
			request.setAttribute("boardContents", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardModify.jsp");
			rd.forward(request, response);
		}
		
		else if(str.equals("/board/boardModifyData.do")) {
			System.out.println("boardModifyData 들어옴");
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");
			int bidx = Integer.parseInt(request.getParameter("bidx"));

			BoardDao bd = new BoardDao();
			bd.boardModify(subject, contents, bidx);
			
			String path = request.getContextPath()+"/board/boardContents.do?bidx="+bidx;
		 	response.sendRedirect(path);
		}
		
		else if(str.equals("/board/boardDelete.do")) {
			System.out.println("boardDelete 들어옴");
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardDelete.jsp");
			rd.forward(request, response);
		}
		
		else if(str.equals("/board/boardDeleteAction.do")) {
			System.out.println("boardDeleteAction 들어옴");
			int bidx = Integer.parseInt(request.getParameter("bidx"));
			String memberPw = request.getParameter("memberPw");
			
			BoardDao bd = new BoardDao();
			int value = bd.boardDelete(bidx,memberPw);
			
			if(value==1) {
			String path = request.getContextPath()+"/board/boardList.do";
		 	response.sendRedirect(path);
		 	}
			else {
				response.setContentType("text/html; charset=UTF-8");
			    PrintWriter out = response.getWriter();
			    out.println("<script>alert('패스워드가 일치하지 않습니다.');history.go(-1);</script>");
			    out.flush();
			    return;
			}
		}
		
		else if(str.equals("/board/boardReply.do")) {
			System.out.println("boardReply 들어옴");
			int bidx = Integer.parseInt(request.getParameter("bidx"));
			int originbidx = Integer.parseInt(request.getParameter("originbidx"));
			int depth = Integer.parseInt(request.getParameter("depth"));
			int level_ = Integer.parseInt(request.getParameter("level_"));
			
			BoardVo bv = new BoardVo();
			bv.setBidx(bidx);
			bv.setOriginbidx(originbidx);
			bv.setDepth(depth);
			bv.setLevel_(level_);
			
			System.out.println("depth:"+depth);
			System.out.println("level:"+level_);
			
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardReply.jsp");
			rd.forward(request, response);
		}
		
		else if(str.equals("/board/boardReplyAction.do")) {
			System.out.println("boardReplyAction 들어옴");
			int value = 0;
			int originbidx = Integer.parseInt(request.getParameter("originBidx"));
			System.out.println("originbidx : "+originbidx);
			int depth = Integer.parseInt(request.getParameter("depth"));
			int level_ = Integer.parseInt(request.getParameter("level_"));
			String subject = request.getParameter("subject");
			String writer = request.getParameter("writer");
			String contents = request.getParameter("contents");
			String ip = InetAddress.getLocalHost().getHostAddress();
			String pwd = request.getParameter("pwd");
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			BoardVo bv = new BoardVo();
			bv.setOriginbidx(originbidx);
			bv.setDepth(depth);
			bv.setLevel_(level_);
			bv.setSubject(subject);
			bv.setContents(contents);
			bv.setWriter(writer);
			bv.setIp(ip);
			bv.setPwd(pwd);
			bv.setMidx(midx);
			
			BoardDao bd = new BoardDao();
			value = bd.boardReply(bv);
			
			if(value==1) {
				response.sendRedirect(request.getContextPath()+"/board/boardList.do");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
