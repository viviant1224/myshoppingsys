package cn.com.shxt.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.shxt.model.PageBean;
import cn.com.shxt.service.GoodsService;
import cn.com.shxt.service.UserService;
import cn.com.shxt.utils.DBUtil;
import cn.com.shxt.utils.PageUtil;

public class UserServlet extends HttpServlet {

	UserService uservice = new UserService();
	GoodsService service = new GoodsService();

	private static final long serialVersionUID = -6941962964024826347L;

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String flag = request.getParameter("flag");
		System.out.println("flag:-------" + flag);

		if (flag != null) {

			if (flag.equals("houtailogin")) {
				userLogin(request, response);
			} else if (flag.equals("loginout")) {
				userLoginout(request, response);
			} else if (flag.equals("userSearch")) {
				userSearch(request, response);
			} else if (flag.equals("register")) {
				register(request, response);
			} else if (flag.equals("houtaizhuce")) {
				houtaizhuce(request, response);
			} else if(flag.equals("userUpdate")) {
				userUpdate(request, response);
			} else if(flag.equals("findpw")) {
				findpw(request, response);
			} else if(flag.equals("setInfo")) {
				setInfo(request, response);
			} else if(flag.equals("huifupinglun")) {
				huifupinglun(request, response);
			}

		}

	}
	
	//回复评论
	public void huifupinglun(HttpServletRequest request,
			HttpServletResponse response) {
		
		String buyname = request.getParameter("buyname");
		String liuyandate_ = request.getParameter("liuyandate_");
		String content1 = request.getParameter("content1");
		System.out.println("buyname---"+buyname);
		System.out.println("liuyandate_---"+liuyandate_);
		System.out.println("content1---"+content1);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(d);
		System.out.println("time----"+time);
		String huifuSql = "insert into SHOPGERENXIAOXI (ID,BUYDATE,BUYNAME,STATE1,TIME_,GOODSNAME,GOODSID,BUYNUM,STATE2)" +
				"values(autoid.nextval,'"+time+"','"+buyname+"','"+content1+"','"+time+"','无','0',0,'未读')";
		int i = uservice.update(huifuSql);
		if(i!=0) {
			String message = "回复评论成功！";
			request.setAttribute("message", message);
			try {
				request.getRequestDispatcher("admin/commonMessage.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	//修改个人信息
	public void setInfo(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = request.getParameter("userName");
		String pw = request.getParameter("pw1");
		String email = request.getParameter("email");
		String tel =  request.getParameter("tel");
		String sex = request.getParameter("sex");
		
		
		String provinceId = request.getParameter("provinceId");
		String cityId = request.getParameter("cityId");
		String areaId = request.getParameter("areaId");
		
		if(provinceId==null) {
			provinceId="1";
			
		}
		if(cityId==null) {
			cityId="1";
			
		}
		if(areaId==null) {
			areaId="1";
		}
		
		

		System.out.println("provinceId------" + provinceId);
		System.out.println("cityId------" + cityId);
		System.out.println("areaId------" + areaId);

		String province = service.getProvince(provinceId);
		String city = service.getCity(cityId);
		String area = service.getArea(areaId);
		String add = province + city + area;
		
		System.out.println("add------" + add);
		System.out.println("sex------" + sex);
		System.out.println("email------" + email);
		System.out.println("tel------" + tel);
		String updateSql = "update shopvip set PASSWORD='"+pw+"',TEL='"+tel+"',SEX='"+sex+"'," +
				" EMAIL='"+email+"',ADDRESS='"+add+"' where USERNAME='"+userName+"'";
		int i = service.updateGoodsCar(updateSql);
		if(i!=0) {
			try {
				request.getRequestDispatcher("/web/setInmess.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else {
			
			
		}
		
		
	}
	//修改密码
	public void findpw(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = request.getParameter("userName");
		System.out.println("userName-----"+userName);
		
		String favcolor = request.getParameter("favcolor");
		String favfood = request.getParameter("favfood");
		String info="";
		String sql = "select * from SHOPMANAGER where USERNAME='"+userName+"'";
		List<Map<String,String>> userList = service.query(sql);
		if(userList==null||userList.size()==0) {
			info="对不起，该账户尚未注册。。";
			try {
				response.sendRedirect("/myshoppingsys/admin/findpwmessage.jsp?info="+URLEncoder.encode(info,"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		} else {
			String favcolor_ = userList.get(0).get("FAVCOLOR");
			String favfood_ = userList.get(0).get("FAVFOOD");
			String pw = userList.get(0).get("PASSWORD");
			if(favcolor.equals(favcolor_)&&favfood.equals(favfood_)) {
				info=pw;
				try {
					response.sendRedirect("/myshoppingsys/admin/findpwmessage.jsp?info="+URLEncoder.encode(info,"UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				info="对不起，你的密保问题回答有误！";
				try {
					response.sendRedirect("/myshoppingsys/admin/findpwmessage.jsp?info="+URLEncoder.encode(info,"UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}
	
	//修改个人信息  后台人员
	public void userUpdate(HttpServletRequest request,
			HttpServletResponse response) {
		
		String userName = "";
		try {
			userName = new String(request.getParameter("userName").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");
		String food = request.getParameter("favfood");
		String color = request.getParameter("favcolor");
		String updateUser ="update SHOPMANAGER set PASSWORD = '"+password+"'," +
				"SEX = '"+sex+"',TEL = '"+tel+"',FAVFOOD='"+food+"',FAVCOLOR = '"+color+"'";
		int i = uservice.update(updateUser);
		if(i!=0) {

			try {
				request.getRequestDispatcher("/admin/MyJsp.jsp").forward(request,
						response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		
	}
	//后台注册
	public void houtaizhuce(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");
		String food = request.getParameter("favfood");
		String color = request.getParameter("favcolor");
		System.out.println("-------");
		
		String newmanager = "insert into SHOPMANAGER" +
				"(ID, USERNAME, PASSWORD, TEL, SEX, QUANXIAN, FAVCOLOR, FAVFOOD)" +
				"values" +
				"( autoid.nextval, '"+userName+"', '"+password+"', '"+tel+"', '"+sex+"', 'normal', '"+color+"', '"+food+"')";
		int i = uservice.update(newmanager);
		System.out.println("i------"+i);
		if(i!=0) {
			try {
				request.getRequestDispatcher("/admin/MyJsp.jsp").forward(request,
						response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	//前台注册
	public void register(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String Email = request.getParameter("Email");
		String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");

		String sql = "insert into SHOPVIP(ID,USERNAME,PASSWORD,EMAIL,SEX,TEL,STATE,CARNUM,ISVIP)"
				+ "values(shpvip.nextval,'"
				+ userName
				+ "','"
				+ password
				+ "','"
				+ Email
				+ "',"
				+ "'"
				+ sex
				+ "','"
				+ tel
				+ "','正常','0','否')";

		int i = uservice.update(sql);
		if (i != 0) {
			request.getSession().setAttribute("userNameqiantai", userName);
			try {
				request.getRequestDispatcher("/web/main.jsp").forward(request,
						response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	//查询前台用户
	public void userSearch(HttpServletRequest request,
			HttpServletResponse response) {

		int nowPage = 1;// 当前页
		int iRows = 5; // 每页显示记录数

		// 接收传递过来的页数
		String newPage = request.getParameter("nextPage");
		System.out.println("newPage:  " + newPage);
		if (newPage != null && !"".equals(newPage)) {
			nowPage = Integer.parseInt(newPage);
		}
		PageUtil pageUtil = new PageUtil();
		PageBean pageBean = pageUtil.queryByPage("SHOPVIP", nowPage, iRows,
				"正常");
		request.setAttribute("pageBean", pageBean);
		try {
			request.getRequestDispatcher("/admin/userSearch.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	//用户登录
	public void userLogin(HttpServletRequest request,
			HttpServletResponse response) {

		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		System.out.println("----userName" + userName + "----password"
				+ password);
		DBUtil db = new DBUtil();
		String sql = "select * from SHOPMANAGER t where USERNAME = '"
				+ userName + "'";

		System.out.println("-" + sql);
		List<Map<String, String>> userList = service.query(sql);
		System.out.println("-" + userList.size());

		if (userList != null && userList.size() > 0) {
			String pw = userList.get(0).get("PASSWORD");
			if (pw.equals(userName)) {
				System.out.println("登录成功");
			} else {

				System.out.println("密码错误！");
			}

		}

	}

	// 注销用户
	public void userLoginout(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("userName");
		session.invalidate();

		System.out.println();
		try {
			response.sendRedirect("/myshoppingsys/admin/login.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
