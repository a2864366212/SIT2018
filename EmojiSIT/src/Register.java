

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// 接收前端ajax传来的user json格式注册信息
				String btnName=request.getParameter("btn");
				if(Objects.isNull(btnName))return ;
	
				String email = null;
				String pass = null;
				HttpSession session = request.getSession();
				
				if(btnName.equals("btn1")) {
					email = request.getParameter("email");
					pass = request.getParameter("pass");
					// 业务逻辑处理
					String str = "INSERT INTO user (email,phone,pass,username ) VALUES ( '%s', '%s', '%s', '%s' )";
					String sql=String.format(str,email,null,pass,null);
			        int res = -1;
			        UserDao userDao;
					try {
						userDao = new UserDao();
						String sqlSelect="select * from user where email='"+email+"'";
						boolean isExist=userDao.isExist(sqlSelect);//判断当前注册的邮箱是否已经存在于数据库
						if(isExist)res=-1;
						else {
							res=userDao.add(sql);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					PrintWriter out = response.getWriter();
					Map map = new HashMap();
					if(res>0) {
						//返回结果到js的ajax中
						map.put("email", email);
						map.put("RegisterInfo", Boolean.TRUE);
						session.setAttribute("email", email);
					}else {
						map.put("email", email);
						map.put("RegisterInfo", Boolean.FALSE);
					}
					String jsonOutput= JSON.toJSONString(map);
					out.print(jsonOutput);
					out.flush();
					out.close();
				}
				if(btnName.equals("btn2")) {
					email=(String) session.getAttribute("email");
					String username=request.getParameter("username");
					String phone=request.getParameter("phone");
					// 业务逻辑处理
			        int res = -1;
			        UserDao userDao;
					try {
						userDao = new UserDao();
						String sqlSelect="select * from user where username='"+username+"'";
						boolean isExist=userDao.isExist(sqlSelect);//判断当前注册的用户名是否已经存在于数据库
						if(isExist)res=-1;
						else {
							String str="update user set username='%s',phone='%s' where email='%s'";
							String sqlUpdate=String.format(str, username,phone,email);
							res=userDao.update(sqlUpdate);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					PrintWriter out = response.getWriter();
					Map map = new HashMap();
					res=1;
					if(res>0) {
						//返回结果到js的ajax中
						map.put("username", username);
						map.put("RegisterInfo", Boolean.TRUE);
					}else {
						map.put("username", username);
						map.put("RegisterInfo", Boolean.FALSE);
					}
					String jsonOutput= JSON.toJSONString(map);
					out.print(jsonOutput);
					out.flush();
					out.close();
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
