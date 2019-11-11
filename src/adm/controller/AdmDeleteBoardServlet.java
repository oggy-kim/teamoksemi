package adm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.model.service.AdmService;

/**
 * Servlet implementation class AdmDeleteBoardServlet
 */
@WebServlet("/delete.board")
public class AdmDeleteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmDeleteBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		System.out.println(articleNo);
		
		int result = new AdmService().deleteBoard(articleNo);
		System.out.println(result);
		
		if(result > 0) {
			System.out.println("왜안돌아오니");
			response.sendRedirect("board.adm");
			// request.setAttribute("msg", "서블릿_게시물이 성공적으로 삭제되었습니다.");
		} else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			// request.setAttribute("msg", "게시물 삭제에 실패했습니다.");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
