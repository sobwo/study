package Example1230.controller;

import java.io.IOException;
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
			String path = request.getContextPath()+"/board/boardWrite.jsp";
			response.sendRedirect(path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
