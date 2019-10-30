package board.controller;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import member.model.vo.Member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="MyListSelectServlet", urlPatterns="/mylist.look")
public class MyListSelectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Member m = (Member) request.getSession().getAttribute("loginUser");

        request.setCharacterEncoding("UTF-8");
        BoardService bService = new BoardService();

        int listCount = bService.getListCount(m.getMemberNo());

        int boardLimit = 10;
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

        ArrayList<Board> list = bService.selectMyList(currentPage, boardLimit, m.getMemberNo());

        RequestDispatcher view = request.getRequestDispatcher("views/mypage/mylist.jsp");
        request.setAttribute("list", list);
        request.setAttribute("pi", pi);
        view.forward(request, response);
    }
}