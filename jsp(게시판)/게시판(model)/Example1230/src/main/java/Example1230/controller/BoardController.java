package Example1230.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			String ip = InetAddress.getLocalHost().getHostAddress();
			int midx = 1;			
//			String ip = request.getHeader("X-Forwarded-For"); 
//			if(ip==null) request.getRemoteAddr();
//			

			BoardDao bd = new BoardDao();
			
			bd.boardInsert(subject, contents, writer,ip,midx);
			
			String path = request.getContextPath()+"/board/boardList.do";
		 	response.sendRedirect(path);
		}
		
		else if(str.equals("/board/boardContents.do")) {
			int bidx = Integer.parseInt(request.getParameter("bidx"));
			System.out.println("boardContents로 들어옴");
			
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.boardSelect(bidx);
			
			request.setAttribute("boardContents", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardContents.jsp");
			rd.forward(request, response);
		}
		
		else if(str.equals("/board/boardModify.do")) {
			BoardDao bd = new BoardDao();
			
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");
			
			int bidx = Integer.parseInt(request.getParameter("bidx"));
			BoardVo bv = bd.boardModify(subject, contents, bidx);
			
//			String path = request.getContextPath()+"/board/boardList.do";
//		 	response.sendRedirect(path);
		}
//		else if(str.equals("/board/"))
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
