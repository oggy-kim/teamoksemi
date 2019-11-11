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
import shop.model.vo.Shop;

/**
 * Servlet implementation class AdmDetailShopServlet
 */
@WebServlet("/detailShop.adm")
public class AdmDetailShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmDetailShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int shopNo = Integer.parseInt(request.getParameter("shopNo"));
	
		// System.out.println(shopNo);

		Shop s = new AdmService().detailShop(shopNo);
		
		// System.out.println(s);
		
		if(s != null) {
	 		response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(s, response.getWriter());
		} else {
			request.setAttribute("msg", "세부 내용 읽기에 실패하셨습니다.");
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
