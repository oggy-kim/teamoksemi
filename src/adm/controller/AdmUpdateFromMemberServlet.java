package adm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.model.service.AdmService;
import member.model.vo.Member;
import shop.model.vo.Shop;

/**
 * Servlet implementation class AdmUpdateFromMemberServlet
 */
@WebServlet("/updateForm.member")
public class AdmUpdateFromMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmUpdateFromMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		System.out.println("memberNo="+memberNo);
		
		Member member = new AdmService().selectMember(memberNo);
		System.out.println("member="+member);
		
		if(member != null) {
			request.setAttribute("member", member);
			request.getRequestDispatcher("views/adm/adm_memberUpdatePage.jsp").forward(request, response);
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
