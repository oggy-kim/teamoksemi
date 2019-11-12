package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.model.service.BoardService;
import board.model.vo.*;
import member.model.vo.*;

/**
 * Servlet implementation class SelectQnAServlet
 */
@WebServlet(name="QnASelectServlet", urlPatterns="/qna.look")
public class QnASelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnASelectServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");

        request.setCharacterEncoding("UTF-8");
        BoardService bService = new BoardService();
        String fromajax = request.getParameter("fromajax");
        if(fromajax == null) {
        	
        
        
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
        } else {
        	ArrayList<QnA> list = bService.selectQnAList( m.getMemberNo());
        	response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
        	
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
