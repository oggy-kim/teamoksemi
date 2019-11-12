package closet.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import closet.model.service.ClosetService;
import closet.model.vo.Closet;
import member.model.vo.Member;

/**
 * Servlet implementation class MyclosetAddServlet
 */
@WebServlet(name="MyclosetAddServlet", urlPatterns="/addmycloth.look")
public class MyclosetAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyclosetAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8");
		Closet c = new Closet();
		Member m = (Member) request.getSession().getAttribute("loginUser");
		int memberNo = m.getMemberNo();
		String options = request.getParameter("options");
		String typeCode = "";	
		switch(options) {
		case "top" 
			: typeCode = request.getParameter("clothtypetop");
			break;
		case "bottom"
			: typeCode = request.getParameter("clothtypebottom");
			break;
		case "acc"
			: typeCode = request.getParameter("clothtypeacc");
			break;
		}
		
		System.out.println(typeCode);
		String[] styleCodeArr = request.getParameterValues("style");
		String styleCode = "";
		if(styleCodeArr != null) {
			styleCode = String.join(",", styleCodeArr);
		} else {
			styleCode = "";
		}
		System.out.println("코드체크 : " + styleCode);
		String colourCode = request.getParameter("colour");
		System.out.println("컬러코드 : " + colourCode);
		String fitCode = request.getParameter("fit");
		String seasonCode = request.getParameter("season");
		String clothName = request.getParameter("brand");
		String clothBuyDater = request.getParameter("buydate");
		System.out.println(clothBuyDater);
		Date clothBuyDate = new Date();
		try {
			clothBuyDate = new SimpleDateFormat("yyyy-MM").parse(clothBuyDater);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(clothBuyDate);
		
		  String clothMemo = request.getParameter("memo");
		  String likeStatus = ""; 
		  if((request.getParameter("likestatus")) != null) {
			  likeStatus = "Y";
		  } else {
			  likeStatus = "N";
		  }
		
		  c = new Closet(memberNo, typeCode, styleCode, colourCode, fitCode, seasonCode,
	  				clothName, clothBuyDate, clothMemo, likeStatus);

			int result = new ClosetService().addNewCloth(c);
			if(result > 0) {
				request.setAttribute("check", "check");
				request.setAttribute("msg", "등록에 성공하였습니다.");
				request.getRequestDispatcher("/closet.look").forward(request, response);
			} else {
				request.setAttribute("msg", "등록에 오류가 있습니다. 다시 확인해주세요.");
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
