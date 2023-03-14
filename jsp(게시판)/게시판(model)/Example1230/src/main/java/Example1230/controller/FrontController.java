package Example1230.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FirstController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String projectName = request.getContextPath();
		int projectLength = projectName.length();
		String str = uri.substring(projectLength);
		
		System.out.println("uri : "+uri);
		System.out.println("contextpath : "+projectName);
		System.out.println("str :"+str);
		
		String[] strArray = str.split("/");
		String strHub = strArray[1];	
		
		if(strHub.equals("member")) {
			MemberController mc = new MemberController(str);
			mc.doGet(request, response);
		}
		else if(strHub.equals("board")) {
			BoardController bc = new BoardController(str);
			bc.doGet(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
