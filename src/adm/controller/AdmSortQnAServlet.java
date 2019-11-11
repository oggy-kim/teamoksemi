package adm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import adm.model.service.AdmService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import board.model.vo.PageInfo;
import board.model.vo.QnA;

/**
 * Servlet implementation class AdmSearchQnAServlet
 */
@WebServlet("/sortQNA.adm")
public class AdmSortQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmSortQnAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sort = request.getParameter("sort");
		int sortId = 0;
		
		if (sort.equals("comment_status")) { 
			sortId = 1;
		} else if (sort.equals("oldest_date")) {
			sortId = 2;
		} else if (sort.equals("newest_date")) {
			sortId = 3;
		} 
		
		System.out.println(sortId);
		
		AdmService aService = new AdmService();
		
		int listCount = aService.getQListCount();		
		int boardLimit = 10;
		int currentPage = 1;
		int pageLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage -1)/ pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		ArrayList<QnA> list = aService.sortQList(sortId, currentPage, boardLimit);
		
		System.out.println("list" + list);
		System.out.println("pi" + pi);
		System.out.println("sort" + sortId);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
		
		/*RequestDispatcher view = request.getRequestDispatcher("views/adm/adm_qnaPage.jsp");
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("sort",sort);

		view.forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
