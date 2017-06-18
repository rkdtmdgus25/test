package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.bean.MemberDTO;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	private static MemberDAO instance; //�̱��� ó�� �޸𸮿� �ѹ��� ����ϰڴ�.
	
	public MemberDAO() { //Ŀ�ؼ� Ǯ�� �������»�����
		try {
			Context ctx= new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle"); //tomcat�� ��� �ʿ�
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	public static MemberDAO  getInstance(){	
		if(instance==null){ //�ѹ��� ���������̾���.
			synchronized (MemberDAO.class) {	//����ȭ �߱⶧���� ����ȭ�� �� Ŭ������ ����Ѵ�.
				instance=new MemberDAO();  //instance�� MemberDAO()�� �ּҸ� �����س��.
			}
		}
		return instance; //�� �˻��Ҷ� ������ ��������
	}

	public int write(MemberDTO memberDTO){
		int su=0;
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try{
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPwd());
			pstmt.setString(4, memberDTO.getGender());
			pstmt.setString(5, memberDTO.getEmail1());
			pstmt.setString(6, memberDTO.getEmail2());
			pstmt.setString(7, memberDTO.getTel1());
			pstmt.setString(8, memberDTO.getTel2());
			pstmt.setString(9, memberDTO.getTel3());
			pstmt.setString(10, memberDTO.getZipcode());
			pstmt.setString(11, memberDTO.getAddr1());
			pstmt.setString(12, memberDTO.getAddr2());
			
			 su = pstmt.executeUpdate();  //�߿��մϴ�~
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				try {
					if(pstmt !=null)
					pstmt.close(); //close �����. pstmt�� �����ǰ��̹Ƿ� ��������
					if(con !=null)
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
			}
		
		return su;
	}
	public boolean isExistId(String id){
		boolean result=false;
		String sql="select * from member where id=?";
	
			
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);			
			rs=pstmt.executeQuery();
			
			if(rs.next()) //rs�� ����������
				result=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(con!=null)
				con.close();
				if(pstmt!=null)
				pstmt.close();
				if(rs!=null)
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;	//rs�� ���� ������ ���Ұ�.(�ߺ�)
	}
	
	public Map<String,String> login(String id,String pwd){
		Map<String,String> map=null ;//��ü�� �Ѱ��ٶ� map�� ����Ѵ�.
		String email1=null;
		String email2=null;
		String name=null;
		
		String sql="select * from member where id=? and pwd=?";
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			if(rs.next()) 
				map=new HashMap<String,String>();
				map.put("email1",rs.getString("email1"));
				map.put("email2",rs.getString("email2"));
				map.put("name", rs.getString("name"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
				try {
					if(con!=null)
					con.close();
					if(pstmt!=null)
					pstmt.close();
					if(rs!=null)
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		return map;
	}
	
}
