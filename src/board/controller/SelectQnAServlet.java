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
import board.model.vo.*;
import member.model.vo.*;

/**
 * Servlet implementation class SelectQnAServlet
 */
@WebServlet(name="SelectQnAServlet", urlPatterns="/qna.look")
public class SelectQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectQnAServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");

        request.setCharacterEncoding("UTF-8");
        BoardService bService = new BoardService();

        int listCount = bService.getQnAListCount(m.getMemberNo());

        int boardLimit = 5;
        int currentPage = 1;
        int pageLimit = 3;
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

        ArrayList<QnA> list = bService.selectQnAList(currentPage, boardLimit, m.getMemberNo());

        RequestDispatcher view = request.getRequestDispatcher("views/mypage/qna.jsp");
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
