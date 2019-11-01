package closet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import closet.model.service.ClosetService;
import closet.model.vo.Closet;
import member.model.vo.Member;

/**
 * Servlet implementation class MyclosetSelectServlet
 */
@WebServlet(name="MyclosetSelectServlet", urlPatterns="/closet.look")
public class MyclosetSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyclosetSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		ClosetService cService = new ClosetService();
		
		ArrayList<Closet> list = cService.selectMyCloset(m.getMemberNo());
		int topCount = cService.getTopCount(m.getMemberNo());
		int bottomCount = cService.getBottomCount(m.getMemberNo());
		int accCount = cService.getAccCount(m.getMemberNo());
		
		System.out.println("topCount : " + topCount);
		System.out.println("bottomCount : " + bottomCount);
		System.out.println("AccCount : " + accCount);
		System.out.println(list);
		request.setAttribute("list", list);
		request.setAttribute("topCount", topCount);
		request.setAttribute("bottomCount", bottomCount);
		request.setAttribute("accCount", accCount);
		
		request.getRequestDispatcher("/views/mypage/mycloset.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
