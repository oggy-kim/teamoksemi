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
 * Servlet implementation class MemberWithdrawServlet
 */
@WebServlet("/withdraw.look")
public class MemberWithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberWithdrawServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");

        int result = new MemberService().withdrawMember(m.getMemberNo());

        if(result > 0) {
            HttpSession session = request.getSession();
            session.removeAttribute("loginUser");

            session.setAttribute("msg", "회원 탈퇴에 성공하셨습니다.");
            response.sendRedirect(request.getContextPath());
        } else {
            request.setAttribute("msg", "회원 탈퇴에 실패하셨습니다. 관리자에게 문의해주세요.");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
