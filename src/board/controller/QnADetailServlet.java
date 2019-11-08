package board.controller;

import board.model.service.BoardService;
import board.model.vo.QnA;
import member.model.vo.Member;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DetailQnAServlet
 */
@WebServlet(name="QnADetailServlet", urlPatterns="/qnadetail.look")
// @WebServlet("/qnadetail.look")
public class QnADetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnADetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));

		QnA q = null;

		q = new BoardService().detailQnA(qnaNo);

/*		System.out.println(q);
		System.out.println(q.getMemberNo());
		System.out.println(m.getMemberNo());
		System.out.println(q != null && q.getMemberNo() == m.getMemberNo());
		System.out.println(q.getMemberNo() == m.getMemberNo());*/

		if(q != null && q.getMemberNo() == m.getMemberNo()) {
/*			jsonUser = new JSONObject();

			jsonUser.put("qnaNo", q.getQnaNo());
			jsonUser.put("enrollDate", q.getEnrollDate());
			jsonUser.put("qnaTitle", q.getQnaTitle());
			jsonUser.put("qnaContents", q.getQnaContents());
			jsonUser.put("answerStatus", q.getAnswerStatus() + "");
			jsonUser.put("answerContents", q.getAnswerContents());
*/

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
