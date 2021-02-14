

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		if(Objects.isNull(email))return ;
		PrintWriter out = response.getWriter();
		Map map = new HashMap();
		
		UserDao userDao=new UserDao();
		String sql="select * from user where email='"+email+"' ";
		User user=userDao.getUser(sql);
		
		map.put("email",email);
		if(Objects.isNull(user)) {
			map.put("result", Boolean.FALSE);
			map.put("loginInfo","have no such email");
		}else {
			String truePass=user.getPass();
			if(truePass.equals(pass)) {
				map.put("result", Boolean.TRUE);
				map.put("loginInfo","pass input true");
			}else {
				map.put("result", Boolean.FALSE);
				map.put("loginInfo","pass input error");
			}
		}
		String jsonOutput= JSON.toJSONString(map);
		out.print(jsonOutput);
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
