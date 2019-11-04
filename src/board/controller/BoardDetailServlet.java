package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardComment;
import board.model.vo.PageInfo;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/boarddetail.look")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int aNo = Integer.parseInt(request.getParameter("aNo"));

		Board board = null;
		
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("aNo"+aNo)) {
					flag = true;
				}
			}
			
			if(!flag) {
				board = new BoardService().selectBoard(aNo);
				Cookie c1 = new Cookie("aNo"+aNo, String.valueOf(aNo));
				c1.setMaxAge(1 * 24 * 60 * 60);
				response.addCookie(c1);
			} else {
				board = new BoardService().selectBoardNoCnt(aNo);
			}
		}
		
		BoardService bService = new BoardService();
		
		int listCount = bService.getListCount();
		
		int boardLimit = 5;
		int currentPage = 1;
		int pageLimit = 3;
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		//ArrayList<BoardComment> rlist = new BoardService().selectCommentList(aNo);
		
		ArrayList<BoardComment> rlist = bService.selectCommentList(currentPage, boardLimit, aNo);

		
		RequestDispatcher view = request.getRequestDispatcher("views/board/boardListView.jsp");
		request.setAttribute("rlist", rlist);
		request.setAttribute("pi", pi);
		
		view.forward(request, response);
		
		System.out.println(rlist);
		
		if(board != null) {
			request.setAttribute("board", board);
			
			request.setAttribute("rlist", rlist);
			
			System.out.println(rlist);
			
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "게시판 상세 조회에 실패하였습니다.");
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
