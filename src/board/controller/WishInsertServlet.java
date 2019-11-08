package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.WishList;
import javafx.scene.control.Alert;

/**
 * Servlet implementation class WishInsertServlet
 */
@WebServlet("/wishinsert.look")
public class WishInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int memberno = Integer.parseInt(request.getParameter("memberno"));
		int aNo = Integer.parseInt(request.getParameter("aNo"));
		String memo = request.getParameter("memo");
		
		int likes = Integer.parseInt(request.getParameter("likes"));
		
		WishList w = new WishList();
		w.setMemberNo(memberno);
		w.setArticleNo(aNo);
		w.setWishMemo(memo);
		
		int result = new BoardService().insertWish(w);
		
		int result1 = new BoardService().increaseCountt(aNo);
		
		if(result > 0) {
			response.sendRedirect("wishlist.look");
		} else {
			request.setAttribute("msg", "게시판 작성에 실패했습니다.");
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
