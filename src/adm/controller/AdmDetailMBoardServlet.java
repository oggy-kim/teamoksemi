package adm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import adm.model.service.AdmService;
import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;
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
		
		System.out.println("memberNo="+memberNo);
		
		BoardService bService = new BoardService();
        int listCount = bService.getListCount(memberNo);

        System.out.println("listCount="+listCount);
        
        int boardLimit = 5;
        int currentPage = 1;
        int pageLimit = 5;
        int maxPage = (int)Math.ceil((double)listCount/boardLimit);
        int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;

        if(maxPage < endPage) {
            endPage = maxPage;
        }

        if(request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

        PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

        ArrayList<Board> list = bService.selectMyList(currentPage, boardLimit, memberNo);

/*        RequestDispatcher view = request.getRequestDispatcher("views/adm/mylist.jsp");
        request.setAttribute("list", list);
        request.setAttribute("pi", pi);
        view.forward(request, response);
*/
		/*if(list != null) {
 		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
		} else {
		// request.setAttribute("msg", "회원상세정보 조회에 실패하셨습니다.");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}*/

        response.setContentType("application/json; charset=utf-8");
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
		System.out.println("list="+list);
		System.out.println("pi="+pi);
		System.out.println("memberNo="+memberNo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
