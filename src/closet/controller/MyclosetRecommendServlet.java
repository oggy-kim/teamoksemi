package closet.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import closet.model.service.ClosetService;
import closet.model.vo.Closet;

/**
 * Servlet implementation class MyclosetRecommendServlet
 */
@WebServlet("/recommend.look")
public class MyclosetRecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyclosetRecommendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Double cTemp = Double.parseDouble(request.getParameter("cTemp"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		ArrayList<Closet> clist = null;
		ArrayList<Closet> up = new ArrayList<>();
		ArrayList<Closet> down = new ArrayList<>();
		
		if(cTemp >= -10 && cTemp < 5 ) {
			clist = new ClosetService().recommendWinter(memberNo);
		} else if(cTemp >= 5 && cTemp <20 ) {
			clist = new ClosetService().recommendSF(memberNo);
		} else {
			clist = new ClosetService().recommendSummer(memberNo);
		}
		
		if(clist != null) {
			for(Closet c : clist) {
				if(c.getTypeOption() == 1) {
					up.add(c);
				} else {
					down.add(c);
				}
			}
		}
		HashMap<String, ArrayList<Closet>> ClosetMap = new HashMap<>();
		ClosetMap.put("up", up);
		ClosetMap.put("down", down);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(ClosetMap, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
