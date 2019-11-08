package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import board.model.vo.WishList;
import member.model.vo.Member;

/**
 * Servlet implementation class FavoriteServlet
 */
@WebServlet("/wishlist.look")
public class WishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");

        request.setCharacterEncoding("UTF-8");
        BoardService bService = new BoardService();

        int listCount = bService.getWishListCount(m.getMemberNo());
        
        int boardLimit = 4;
        int currentPage = 1;
        int pageLimit = 5;
        int maxPage = (int)Math.ceil((double)listCount/boardLimit);
        int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;

        if(maxPage < endPage) {
            endPage = maxPage;
        }

        if(request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

        PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
        
        ArrayList<WishList> list = bService.selectWishList(currentPage, boardLimit, m.getMemberNo());
        
        RequestDispatcher view = request.getRequestDispatcher("views/board/wishListView.jsp");
        request.setAttribute("list", list);
        request.setAttribute("pi", pi);
        
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
