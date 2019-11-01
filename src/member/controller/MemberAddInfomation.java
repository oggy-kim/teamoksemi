package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberAddInfomation
 */
@WebServlet("/updateinfo.me")
public class MemberAddInfomation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAddInfomation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
//			String root = request.getSession().getServletContext();
			
			String savePath = "resources/images/profile";
			
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			
			Member m = (Member)request.getAttribute("loginUser");
			int mno = m.getMemberNo();
			
//			int mno = request.getParameter("member_no");
			
			MultipartRequest multiRequest = new MultipartRequest(request , savePath , maxSize , "UTF-8" , new MyfileRenamePolicy(mno));
			
			ArrayList<String> changeFiles = new ArrayList<String>();
			ArrayList<String> originfiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					
					String originName = multiRequest.getOriginalFileName(name);
					
				}
			}
			
		}
		
		
		
		String userId = request.getParameter("userId");
		
		int year = Integer.parseInt(request.getParameter("year"));
		String style1 = request.getParameter("s1");
		String style2 = request.getParameter("s2");
		String style = style1 + "," + style2;
//		String style = style1 + style2;
		
//		 style = "";
//		if(style != null) {
//			style = String.join(",", style);
//		}
		
		Member m  = new Member(userId, year, style);
		System.out.println(m);
		Member updateMember = new MemberService().updateMember(m);
		
		if(updateMember != null) {
			request.getSession().setAttribute("msg","추가정보가 저장되었습니다.");
			
			request.getSession().setAttribute("loginUser", updateMember);
			response.sendRedirect(request.getContextPath());
			
			
		}else {
			request.setAttribute("msg","추가정보 저장에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
