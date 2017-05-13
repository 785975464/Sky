package check;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class eyesight {
	//private static double LeftEyeValue, RightEyeValue, LeftEyeFunction,RightEyeFunction;// ,VisualFunction;LeftEyeVisualFunction, RightEyeVisualFunction;
	//private int con_normal, con_warn, con_abnor, age;			//正常、预警、异常
	private int con_normal=0, con_warn=0, con_abnor=0,wrongrs=0,unexpected=0,subhealthy=0;		//新增视觉等级亚健康subhealthy，2016-07-13
	private String visionlevel;
	public void Connection()throws Exception{

		Connection conn=null;
		String sql;
		String url="jdbc:mysql://localhost:3306/skydb?user=root&password=zcy2815&useUnicode=true&characterEncoding=utf-8";
//		String url="jdbc:mysql://localhost:3306/skydb?user=root&password=&useUnicode=true&characterEncoding=utf-8";
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("成功加载MySQL驱动！");
			conn=DriverManager.getConnection(url);
			Statement stmt=conn.createStatement();
			
			sql="select visioncheck.username,visioncheck.visionlevel " +
					" from visioncheck,userinfo " +
					" where visioncheck.username=userinfo.username and visioncheck.tableId in "+
					"(" +
						" select MAX(visioncheck.tableId) from userinfo, visioncheck " +
						" where visioncheck.username=userinfo.username " +
						" group by userinfo.username" +
					")";
			
			ResultSet rs=stmt.executeQuery(sql);
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
				
			}
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		System.out.println("所有人员中，\t视觉正常的人数有："+con_normal+"人\t视觉预警的人数有："+ con_warn+ "人\t视觉亚健康的人数有："+ subhealthy
				+"人\t视觉异常的人数有："+con_abnor+"人\t信息错误的有："+wrongrs+"人\t信息未知的有："+unexpected+"人");
	}
	
	
	public int getcon_Nor(){
		return con_normal;
	}
	public int getcon_Warn(){
		return con_warn;
	}
	public int getSubhealthy(){
		return subhealthy;
	}
	public int getcon_Abnor(){
		return con_abnor;
	}
	public int getWrong_rs(){
		return wrongrs;
	}
	public int getUnexpected(){
		return unexpected;
	}
	
}


