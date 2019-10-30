package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.QnA;
import javafx.scene.control.Alert;
import member.model.vo.Member;

/**
 * Servlet implementation class CreateQnAServlet
 */
@WebServlet("/qnasubmit.look")
public class QnACreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnACreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		request.setCharacterEncoding("UTF-8");
		
		int memberNo = m.getMemberNo();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		QnA q = new QnA(memberNo, title, content);
		
		int result = new BoardService().insertQnA(q);
		
		if(result > 0) {
			request.setAttribute("msg", "문의글 등록에 성공하셨습니다.");
			response.sendRedirect("./qna.look");
		} else {
			request.setAttribute("msg", "QnA 문의글 등록에 실패하셨습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
