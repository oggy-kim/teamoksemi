package adm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import adm.model.service.AdmService;
import board.model.vo.PageInfo;
import board.model.vo.QnA;
import shop.model.vo.Shop;

/**
 * Servlet implementation class AdmSortShopServlet
 */
@WebServlet("/sortShop.adm")
public class AdmSortShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmSortShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sort = request.getParameter("sort");
		int sortId = 0;
		
		if (sort.equals("cont_money")) { // 계약금
			sortId = 1;
		} else if (sort.equals("cont_status")) { // 계약상태
			sortId = 2;
		} 
		
		System.out.println(sortId);
		
		AdmService aService = new AdmService();
		
		int listCount = aService.getSListCount();		
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
		
		ArrayList<Shop> list = aService.sortSList(sortId, currentPage, boardLimit);
		
		System.out.println("list" + list);
		System.out.println("pi" + pi);
		System.out.println("sort" + sortId);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
