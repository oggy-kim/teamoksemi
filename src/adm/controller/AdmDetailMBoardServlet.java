package adm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import adm.model.service.AdmService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdmDetailMBoardServlet
 */
@WebServlet("/detailMboard.adm")
public class AdmDetailMBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmDetailMBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));

		Member m = new AdmService().detailMember(memberNo);
		
		// System.out.println(m);
		
		if(m != null) {
	 		response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(m, response.getWriter());
		} else {
			// request.setAttribute("msg", "회원상세정보 조회에 실패하셨습니다.");
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
