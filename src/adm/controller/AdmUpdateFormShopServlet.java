package adm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.model.service.AdmService;
import board.model.service.BoardService;
import board.model.vo.Board;
import shop.model.vo.Shop;

/**
 * Servlet implementation class AdmUpdateFormServlet
 */
@WebServlet("/updateForm.shop")
public class AdmUpdateFormShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmUpdateFormShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int shopNo = Integer.parseInt(request.getParameter("shopNo"));
		System.out.println("shopNo="+shopNo);
		
		Shop shop = new AdmService().selectShop(shopNo);
		System.out.println("shop="+shop);
		
		if(shop != null) {
			request.setAttribute("shop", shop);
			request.getRequestDispatcher("views/adm/adm_shopUpdatePage.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "쇼핑몰 수정페이지를 불러오는데 실패했습니다.");
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
