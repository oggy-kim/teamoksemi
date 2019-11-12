package adm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import adm.model.service.AdmService;
import board.model.vo.Board;
import member.model.vo.Member;

/**
 * Servlet implementation class AdmDetailBoaradServlet
 */
@WebServlet("/detailBoard.adm")
public class AdmDetailBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmDetailBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int articleNo = Integer.parseInt(request.getParameter("aNo"));		
		
		Board b = new AdmService().detailBoard(articleNo);
		
		if(b != null) {
	 		response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(b, response.getWriter());
		} else {
			// request.setAttribute("msg", "게시물상세조회에 실패하셨습니다.");
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
