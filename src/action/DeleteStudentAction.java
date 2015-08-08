package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import tools.DBManager;

/**
 * Servlet implementation class DeleteStudentAction
 */
@WebServlet("/DeleteStudentAction")
public class DeleteStudentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStudentAction() {
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
		
		String id = request.getParameter("studentId");
		PrintWriter out = response.getWriter();
		DBManager manager = new DBManager();
		
		JSONObject object=new JSONObject();
		if (!manager.adminDeleteStudent(id)) {
			object.put("resultCode", "-1");
			object.put("resultMessage", "学生删除失败！");
		}else{
			object.put("resultCode", "1");
			object.put("resultMessage", "学生删除成功！");
		}
		out.print(object.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
