package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBManager;

/**
 * Servlet implementation class AddScoreAction
 */
@WebServlet("/AddScoreAction")
public class AddScoreAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddScoreAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		String courseId = request.getParameter("courseId");
		PrintWriter out = response.getWriter();
		Enumeration<String> pNames = request.getParameterNames();
		DBManager manager = new DBManager();
		pNames.nextElement();
		int total = 0;
		int failure = 0;
		while (pNames.hasMoreElements()) {
			String studentId = (String) pNames.nextElement();
			String score = request.getParameter(studentId);
			total++;
			if (!manager.updateScore(courseId, studentId, score)) {
				failure++;
			}
		}
		out.println(
				"<script>alert(\"共录入" + total + "条成绩。成功" + (total - failure) + "条，失败" + failure + "条！\");</script>");
		response.addHeader("refresh", "0;URL=teacher_add_score.jsp?courseId="+courseId);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
