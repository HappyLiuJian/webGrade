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
 * Servlet implementation class AddStudentToCourse
 */
@WebServlet("/AddStudentToCourse")
public class AddStudentToCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudentToCourse() {
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
		String studentId = request.getParameter("studentId");
		PrintWriter writer = response.getWriter();
		DBManager manager = new DBManager();
		if(manager.addStudentToCourse(courseId, studentId)){
			writer.println("<script>alert(\"���ѧ���ɹ���\")</script>");
		}else{
			writer.println("<script>alert(\"���ʧ�ܣ���ѧ�����ܲ����ڻ����ѱ���ӣ�\")</script>");
		}
		response.addHeader("refresh", "0;URL=teacher_query_student.jsp?courseId="+courseId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
