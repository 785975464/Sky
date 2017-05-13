package com.njust.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.plot.PiePlot;


import check.*;


//public class eyesight {
public class EyesightServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//private static double LeftEyeValue, RightEyeValue, LeftEyeFunction,RightEyeFunction;// ,VisualFunction;LeftEyeVisualFunction, RightEyeVisualFunction;
	private int con_normal, con_warn, con_abnor, age , wrongrs,unexpected,subhealthy;		//新增视觉等级亚健康subhealthy，2016-07-13
	private String visionlevel;

	public EyesightServlet() {
		super();
	}
	public void init() throws ServletException {
		System.out.println("初始化！");
		// Put your code here
	}
	
/**
	public void service(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException{ 
		System.out.println("Service鏂规硶锛�);
	}
**/
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		System.out.println("结束！");
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		String login_school=request.getParameter("login_school");
		System.out.println( "传入的参数为："+login_school );
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		/**
		 * 
		 */
		//int con_normal=0, con_warn=0, con_abnor=0;

		con_init();		//初始化
		//int state=1,state_Left=1,state_Right=1;//,age;
		//double temp;
		Connection conn=null;
		String sql;
//		String url="jdbc:mysql://202.119.84.51:4433/skydb?user=root&password=root&useUnicode=true&characterEncoding=UTF-8";
		String url="jdbc:mysql://localhost:3306/skydb?user=root&password=zcy2815&useUnicode=true&characterEncoding=utf-8";
//		String url="jdbc:mysql://localhost:3306/skydb?user=root&password=&useUnicode=true&characterEncoding=utf-8";
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			System.out.println("成功加载MySQL驱动！");
			try {
				conn=DriverManager.getConnection(url);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			Statement stmt = null;
			try {
				stmt = conn.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			sql="select visioncheck.username,visioncheck.visionlevel " +
					" from visioncheck,userinfo " +
					" where visioncheck.username=userinfo.username and userinfo.school='"+login_school+"' "+
					" and visioncheck.tableId in " +
					"( " +
						" select MAX(visioncheck.tableId) from userinfo , visioncheck " +
						" where visioncheck.username=userinfo.username and userinfo.school='"+login_school+"' " +
						" group by visioncheck.username " +
					")";
			ResultSet rs = null;
			try {
				rs = stmt.executeQuery(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			try {
				while(rs.next()){
					visionlevel = rs.getString("visionlevel");
					if(visionlevel.equals("正常")){
						con_normal++;
					}
					else if(visionlevel.equals("预警"))
					{
						con_warn++;
					}
					else if(visionlevel.equals("亚健康"))
					{
						subhealthy++;
					}
					else if(visionlevel.equals("异常"))
					{
						con_abnor++;
					}
					else if(visionlevel.equals("错误"))
					{
						wrongrs++;
					}
					else
					{
						unexpected++;
					}
					//System.out.println(rs.getString(1)+"\t"+rs.getString("username")+"\t"+rs.getString("age")+"\t"+rs.getString("LeftEyeLittleValue")+"\t"+rs.getString("RightEyeLittleValue"));
					//System.out.println(rs.getString("tableId")+"\t"+age+"\ttemp:"+temp+"\t锟斤拷锟桔ｏ拷"+state_Right+"\t锟斤拷锟桔ｏ拷"+state_Left+"\t"+state);
					//System.out.println(name+""+add);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		System.out.println(login_school+"学校中，\t视觉正常的人数有："+con_normal+"人\t视觉预警的人数有："+ con_warn+ "人\t视觉亚健康的人数有："+ subhealthy
				+"人\t视觉异常的人数有："+con_abnor+"人\t信息错误的有："+wrongrs+"人\t信息未知的有："+unexpected+"人");
		
		piechart chart=new piechart();
		chart.setPieChart(con_normal, con_warn, subhealthy, con_abnor,wrongrs,unexpected, request);
		//PiePlot plot = (PiePlot) chart.getPlot();
		String graph_url=chart.getURL();
		//request.getSession.setAttribute("name",graph_url);
		//response.sendRedirect("set.jsp");
		
		request.setAttribute("total_number",con_normal+con_warn+subhealthy+con_abnor+wrongrs+unexpected);
		request.setAttribute("error_number",wrongrs+unexpected);
		request.setAttribute("name",graph_url);
		RequestDispatcher rd=request.getRequestDispatcher("setback.jsp");
		rd.forward(request,response);
		
		
	}

	
///******************************状态初始化，清除session缓存
	
	public void con_init() {
		this.con_normal=0;
		this.con_warn=0;
		this.subhealthy=0;
		this.con_abnor=0;
		this.wrongrs=0;
		this.unexpected=0;
	}


}


