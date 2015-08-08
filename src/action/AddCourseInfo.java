package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBManager;
/**
 * Servlet implementation class AddCourseInfo
 */
@WebServlet("/AddCourseInfo")
public class AddCourseInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourseInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String courseId = request.getParameter("courseId");
		System.out.println(courseId);
		String courseName = request.getParameter("courseName");
		String credit = request.getParameter("credit");
		String classHour = request.getParameter("classHour");
		PrintWriter out = response.getWriter();
		DBManager manager = new DBManager();
		boolean flag = manager.insertCourse(courseId, courseName,credit,classHour);
		if (!flag) {
			out.println("<script>alert(\"¼��ʧ��\")</script>");
			response.addHeader("refresh", "0;URL=admin_input_course.jsp");
		} else {
		out.println("<script>alert(\"¼��ɹ�\")</script>");
		response.addHeader("refresh", "0;URL=admin_input_course.jsp");
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
