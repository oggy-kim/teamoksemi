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
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.BoardComment;
import board.model.vo.PageInfo;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/boardlist.look")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService bService = new BoardService();
		
		int listCount = bService.getListCount();
		
		int currentPage;	// 현재 페이지
		int pageLimit;		// 한 페이지 하단에 보여질 페이지 수
		int maxPage;		// 전체 페이지에 가장 마지막 페이지
		int startPage;		// 한 페이지 하단에 보여질 시작 페이지
		int endPage;		// 한 페이지 하단에 보여질 끝 페이지
		
		int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 수
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		ArrayList<Board> flist = bService.selectList(currentPage, boardLimit);
		
		// ArrayList<Attachment> flist = bService.selectList(currentPage, boardLimit);
		
		RequestDispatcher view = request.getRequestDispatcher("views/board/boardListView.jsp");
		request.setAttribute("flist", flist);
		request.setAttribute("pi", pi);
		
		view.forward(request, response);
		
		/*int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		
		Board board = null;
		
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("articleNo"+articleNo)) {
					flag = true;
				}
			}
			
			if(!flag) {
				board = new BoardService().selectBoard(articleNo);
			}
		}
		
		ArrayList<BoardComment> rlist = new BoardService().selectReplyList(articleNo);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
