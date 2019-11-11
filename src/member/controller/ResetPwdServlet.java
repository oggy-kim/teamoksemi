package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class ResetPwdServlet
 */
@WebServlet("/resetPwd.look")
public class ResetPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String newPwd = request.getParameter("newPwd");
		String email = request.getParameter("email");
		
		System.out.println(newPwd); //잘들어가고
		System.out.println(email); // null? 
		
		Member m = new Member(email, newPwd);
		
		Member updateMem = new MemberService().resetPwd(m);
		
		if(updateMem != null ) {
			response.sendRedirect(request.getContextPath());
			request.getSession().setAttribute("msg", "비밀번호가 변경되었습니다 로그인해주세요");
		}else {
			request.setAttribute("msg", "비밀번호변경에 실패하였습니다.");
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
