package check;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class eyesight {
	//private static double LeftEyeValue, RightEyeValue, LeftEyeFunction,RightEyeFunction;// ,VisualFunction;LeftEyeVisualFunction, RightEyeVisualFunction;
	//private int con_normal, con_warn, con_abnor, age;			//������Ԥ�����쳣
	private int con_normal=0, con_warn=0, con_abnor=0,wrongrs=0,unexpected=0,subhealthy=0;		//�����Ӿ��ȼ��ǽ���subhealthy��2016-07-13
	private String visionlevel;
	public void Connection()throws Exception{

		Connection conn=null;
		String sql;
		String url="jdbc:mysql://localhost:3306/skydb?user=root&password=zcy2815&useUnicode=true&characterEncoding=utf-8";
//		String url="jdbc:mysql://localhost:3306/skydb?user=root&password=&useUnicode=true&characterEncoding=utf-8";
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("�ɹ�����MySQL������");
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
				if(visionlevel.equals("����")){
					con_normal++;
				}
				else if(visionlevel.equals("Ԥ��"))
				{
					con_warn++;
				}
				else if(visionlevel.equals("�ǽ���"))
				{
					subhealthy++;
				}
				else if(visionlevel.equals("�쳣"))
				{
					con_abnor++;
				}
				else if(visionlevel.equals("����"))
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
		System.out.println("������Ա�У�\t�Ӿ������������У�"+con_normal+"��\t�Ӿ�Ԥ���������У�"+ con_warn+ "��\t�Ӿ��ǽ����������У�"+ subhealthy
				+"��\t�Ӿ��쳣�������У�"+con_abnor+"��\t��Ϣ������У�"+wrongrs+"��\t��Ϣδ֪���У�"+unexpected+"��");
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


