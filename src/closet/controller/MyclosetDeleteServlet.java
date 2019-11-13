package closet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import closet.model.dao.ClosetDao;
import closet.model.service.ClosetService;

/**
 * Servlet implementation class MyclosetDeleteServlet
 */
@WebServlet(name="MyclosetDeleteServlet", urlPatterns="/deletemycloth.look")
public class MyclosetDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyclosetDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] s = request.getParameterValues("deletelist");
		System.out.println(s[1]);
		
		
		int[] deleteList = new int[s.length];
		
		if(s != null) {
			for(int i = 0; i < s.length; i++) {
				deleteList[i] = Integer.parseInt(s[i]);
			}
		}
		for(int i = 0; i < deleteList.length; i++) {
			System.out.println("list ; " + deleteList[i]);
		}
		
		int result = new ClosetService().deleteMyCloth(deleteList);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
