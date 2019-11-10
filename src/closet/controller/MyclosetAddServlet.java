package closet.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

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
		System.out.println(c);		

		BufferedReader br = request.getReader(); //request를 통해 데이터를 읽는다.
		  if(br == null) {
			  System.out.println("buffer = null");
			  br = null;
		  }
		  
		  Object obj = JSONValue.parse(br); 
		  if(obj == null) {
			  System.out.println("obj = null");
			  obj = null;
		  }
		  
		  JSONObject object = (JSONObject)obj;
		  if(object == null) {
			  System.out.println("JSONObject = null");
			  object = null;
		  }
		  
		  if(!(object == null)){   
			  int memberNo = m.getMemberNo();
			  String typeCode = (String)object.get("clothtype");
			  int typeOption = ((Long)object.get("typeoption")).intValue();
			  
			  JSONArray styleCodeArr = (JSONArray)object.get("style");
			  String styleCode = styleCodeArr.toJSONString().toString();
			  System.out.println("styleCode : " + styleCode);
			  
			  String colourCode = (String)object.get("colour");
			  String fitCode = (String)object.get("fit");
			  String seasonCode = (String)object.get("season");
			  String clothName = (String)object.get("brand");
			  System.out.println("clothName : " + clothName);
			  String dateForStr = (String)object.get("buydate");
			  System.out.println(dateForStr);
			  Date clothBuyDate = new Date();
				try {
					clothBuyDate = new java.text.SimpleDateFormat("yyyy-MM").parse(dateForStr);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			  System.out.println("clothBuyDate : " + clothBuyDate);
			  String clothMemo = (String)object.get("memo");
			  String likeStatus = ""; 
			  if(((String)object.get("likestatus")).equals("Y")) {
				  likeStatus = "Y";
			  } else {
				  likeStatus = "N";
			  }
			  c = new Closet(memberNo, typeCode, typeOption, styleCode, colourCode, fitCode, seasonCode,
					  				clothName, clothBuyDate, clothMemo, likeStatus);
			  
			  int result = new ClosetService().addNewCloth(c);
			  if(result > 0) {
				  
				  
			  }
			  
			  
		}
		  System.out.println(c);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
