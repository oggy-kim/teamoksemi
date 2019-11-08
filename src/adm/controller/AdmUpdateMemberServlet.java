package adm.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.model.service.AdmService;
import member.model.vo.Member;
import shop.model.vo.Shop;

/**
 * Servlet implementation class AdmUpdateMemberServlet
 */
@WebServlet("/AdmUpdateMemberServlet")
public class AdmUpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmUpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		System.out.println(memberNo);
		
		Member member = new Member();
		
		member.setMemberNo(memberNo);
		member.setGradeCode(request.getParameter("gradeCode"));
		member.setMemberId(request.getParameter("memeberId"));
		member.setMemberNick(request.getParameter("memberNick"));
		member.setGender(request.getParameter("gender"));
		member.setProfile(request.getParameter("profile"));
		member.setLikeStyle(request.getParameter("likeStyle"));
		member.setBirthYear(Integer.parseInt(request.getParameter("birthYear")));

		SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
		Date edate = null;
		
		try {
			edate = dt.parse(request.getParameter("entryDate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		member.setEntryDate(edate);

		int result = new AdmService().updateMember(member);
		
		if(result > 0) {
			request.setAttribute("memberNo", memberNo);
			request.getRequestDispatcher("member.adm").forward(request, response);
		}else {
			request.setAttribute("msg", "쇼핑몰 등급 수정에 실패했습니다.");
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
