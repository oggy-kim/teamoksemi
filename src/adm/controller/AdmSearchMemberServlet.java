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
import member.model.vo.Member;
import shop.model.vo.Shop;

/**
 * Servlet implementation class AdmSearchMemberServlet
 */
@WebServlet("/searchMember.adm")
public class AdmSearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmSearchMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String sort = request.getParameter("sort");
		String keyword = request.getParameter("keyword");
		
		System.out.println(sort);
		System.out.println(keyword);
		
		int sortId = 0;
		
		if (sort.equals("member_no")) { 
			sortId = 1;
		} else if (sort.equals("member_id")) {
			sortId = 2;
		} else { // member_nick
			sortId = 3;
		}
		
		AdmService aService = new AdmService();
		
		int listCount = aService.getListCount();		
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
		
		ArrayList<Member> list = aService.searchMList(sortId, keyword, currentPage, boardLimit);
		
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
