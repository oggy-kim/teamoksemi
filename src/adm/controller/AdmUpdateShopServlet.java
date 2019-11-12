package adm.controller;

import java.io.IOException;
import java.util.Date; // sql Date는 시,분,초 정보가 있음
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
 * Servlet implementation class AdmUpdateShopServlet
 */
@WebServlet("/update.shop")
public class AdmUpdateShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmUpdateShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int shopNo = Integer.parseInt(request.getParameter("shopNo"));
			
		Shop shop = new Shop();
		shop.setShopNo(shopNo);
		shop.setShopName(request.getParameter("shopName"));
		shop.setStatus(request.getParameter("status"));
		shop.setShopGradeCode(request.getParameter("shopGradeCode"));
		shop.setContractMoney(Integer.parseInt(request.getParameter("contractMoney")));
		shop.setShopPIC(request.getParameter("shopPIC"));
		shop.setShopContact(request.getParameter("shopContact"));
		
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
		Date cdate = new Date();
		Date edate = new Date();
		
		try {
			cdate = dt.parse(request.getParameter("contractDate"));
			edate = dt.parse(request.getParameter("expireDate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		shop.setContractDate(cdate);
		shop.setExpireDate(edate);
		
		System.out.println("shop="+shop);
		
		int result = new AdmService().updateShop(shop);
		System.out.println("result="+result);
		
		if(result > 0) {
			response.sendRedirect("shop.adm");
		}else {
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
