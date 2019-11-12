package board.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import member.model.vo.Member;

/**
 * Servlet implementation class DeleteWishServlet
 */
@WebServlet("/deletewish.look")
public class DeleteWishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWishServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		//int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		/*String wishDate = request.getParameter("wishDate");
		String wishMemo = request.getParameter("wishMemo");*/
		
		String[] arr = request.getParameterValues("delete");
		
		int aNo = m.getMemberNo();
		
		int result = new BoardService().deleteWish(aNo, arr);
		
		if(result > 0) {
			response.sendRedirect("wishlist.look");
		} else {
			request.setAttribute("msg", "게시물 삭제에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
