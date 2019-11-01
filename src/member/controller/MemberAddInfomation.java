package member.controller;

import java.io.File;
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
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.MyFileRenamePolicy;
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
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println(root);
			
			String savePath = root + "resources/images/profile";
			
			System.out.println(savePath);
			
			MultipartRequest multiRequest = new MultipartRequest(request , savePath , maxSize , "UTF-8" , new DefaultFileRenamePolicy());
			
			
			String userId = multiRequest.getParameter("userId");
			int year = Integer.parseInt(multiRequest.getParameter("year"));
			String style1 = multiRequest.getParameter("s1");
			String style2 = multiRequest.getParameter("s2");
			String style = style1 + "," + style2;
			
			Member m  = new Member(userId, year, style);
			System.out.println(m);
			Member updateMember = new MemberService().updateMember(m);
			
			if(updateMember != null) {
				//request.getSession().setAttribute("msg","추가정보가 저장되었습니다.");
				
				String defaultName = multiRequest.getFilesystemName("upfile");
				
				File defaultFile = new File(savePath + "/" + defaultName);
				File changeFile = new File(savePath + "/" + updateMember.getMemberNo() + defaultName.substring(defaultName.lastIndexOf('.')));
				
				defaultFile.renameTo(changeFile);
				
				//request.getSession().setAttribute("loginUser", updateMember);
				response.sendRedirect(request.getContextPath());
				
			}else {
				request.setAttribute("msg","추가정보 저장에 실패하였습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
			
			
			
			
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
