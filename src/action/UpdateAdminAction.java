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
 * Servlet implementation class UpdateAdminAction
 */
@WebServlet("/UpdateAdminAction")
public class UpdateAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminAction() {
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

		String id = request.getParameter("adminId");
		String name =request.getParameter("name");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		DBManager manager = new DBManager();
		
		JSONObject object=new JSONObject();
		if (!manager.updateAdminInfo(id, name, password)) {
			object.put("resultCode", "-1");
			object.put("resultMessage", "����Ա��Ϣ�޸�ʧ�ܣ�");
		}else{
			object.put("resultCode", "1");
			object.put("resultMessage", "����Ա��Ϣ�޸ĳɹ���");
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
