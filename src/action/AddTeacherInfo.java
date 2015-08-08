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
 * Servlet implementation class AddTeacherInfo
 */
@WebServlet("/AddTeacherInfo")
public class AddTeacherInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTeacherInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String teacherId = request.getParameter("teacherId");
		String teacherName = request.getParameter("teacherName");
		String sex = request.getParameter("sex");
		String position = request.getParameter("position");
		String age = request.getParameter("age");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		DBManager manager = new DBManager();
		boolean flag = manager.insertTeacher(teacherId, teacherName, sex, position, password, age);
		if (!flag) {
			out.println("<script>alert(\"¼��ʧ��\")</script>");
			response.addHeader("refresh", "0;URL=admin_input_teacher.jsp");
		} else {
		out.println("<script>alert(\"¼��ɹ�\")</script>");
		response.addHeader("refresh", "0;URL=admin_input_teacher.jsp");
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
