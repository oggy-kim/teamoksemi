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
import member.model.vo.Member;

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
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int mNo = loginUser.getMemberNo();
		
		Board board = new Board();
		
		/*boolean flag = false;
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
			}ㅁㄴ
		}*/
		
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("aNo"+aNo+"mNo"+mNo)) {
					flag = true;
				}
			}
			
			if(!flag) {
				board = new BoardService().selectBoard(aNo);
				Cookie c1 = new Cookie("aNo"+aNo+"mNo"+mNo, String.valueOf(aNo)+String.valueOf(mNo));
				c1.setMaxAge(1 * 24 * 60 * 60);
				response.addCookie(c1);
			} else {
				board = new BoardService().selectBoardNoCnt(aNo);
			}
		}
		
		BoardService bService = new BoardService();
		
		int listCount = bService.getCommentList(aNo);
		
		int boardLimit = 5;
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
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
		
		// Attachment at = bService.selectChangeName(aNo);
		
		Board at = bService.selectBoard(aNo);
		System.out.println(at);
		
		if(at != null) {
			
			request.setAttribute("board", board);
			
			request.setAttribute("rlist", rlist);
			
			request.setAttribute("at", at);
			
			request.setAttribute("pi", pi);
			
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
