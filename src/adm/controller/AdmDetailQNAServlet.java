package adm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import adm.model.service.AdmService;
import board.model.vo.QnA;
import shop.model.vo.Shop;

/**
 * Servlet implementation class AdmDetailQNAServlet
 */
@WebServlet("/detailQNA.adm")
public class AdmDetailQNAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmDetailQNAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		
		System.out.println(qnaNo);

		QnA q = new AdmService().detailQnA(qnaNo);
		
		System.out.println(q);
		
		if(q != null) {
	 		response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(q, response.getWriter());
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
