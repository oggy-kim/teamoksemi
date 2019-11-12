package member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.FileRenamePolicy;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/update.look")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 5; // 5MB
			String tempPath = request.getSession().getServletContext().getRealPath("/") + "/resources/images/temp";
			String savePath = request.getSession().getServletContext().getRealPath("/") + "/resources/images/profile";
			System.out.println(tempPath);
			MultipartRequest mRequest = new MultipartRequest(request, tempPath, maxSize, "UTF-8", new FileRenamePolicy());
			
			String originName = "";
			Enumeration fileNames = mRequest.getFileNames();
			while(fileNames.hasMoreElements()) {
				originName = mRequest.getOriginalFileName((String) fileNames.nextElement());
			}
			
			int birthYear = Integer.parseInt(mRequest.getParameter("birthYear"));
			String memberPwd = mRequest.getParameter("memberPwd");
			String memberNick = mRequest.getParameter("memberNick");
			String[] likeStyleArr = mRequest.getParameterValues("likeStyle");
			String likeStyle = "";
			
			
			if(likeStyleArr != null) {
				likeStyle = String.join(",", likeStyleArr);
			} else {
				likeStyle = "";
			}
			
			System.out.println(likeStyle);
			
			System.out.println(m.getMemberNo() + ", " + memberPwd + ", " + birthYear + ", " + memberNick + ", " + likeStyle);
			
			
			int result = new MemberService().updateMember(m.getMemberNo(), memberPwd, birthYear, memberNick, likeStyle);
			
			if(result > 0) {
				String origin = tempPath + "/" + originName;
				String rename = savePath + "/" + m.getMemberNo() + ".jpg";
				
				System.out.println(origin);
				System.out.println(rename);
				
				if(new File(rename).exists()) 
					new File(rename).delete();
				renameFile(origin, rename);
				new File(origin).delete();					
				
				Member UpdateMember = new MemberService().loginMember(m.getMemberId(), memberPwd);
				
				request.setAttribute("msg", "회원 정보가 정상적으로 수정되었습니다.");
				request.getSession().setAttribute("loginUser", UpdateMember);
				// response.sendRedirect(request.getContextPath());
				request.getRequestDispatcher("/views/mypage/myPage.jsp").forward(request, response);
			} else {
				File failedFile = new File(tempPath + originName);
				failedFile.delete();
				request.setAttribute("msg", "회원정보 업데이트에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
	
	public void renameFile(String filename, String newFilename) {
	    File file = new File( filename );
	    File fileNew = new File( newFilename );
	    if( file.exists() ) file.renameTo( fileNew );
	}


}
