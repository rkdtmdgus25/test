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
	
	private static MemberDAO instance; //싱글톤 처리 메모리에 한번만 잡게하겠다.
	
	public MemberDAO() { //커넥션 풀을 꺼내오는생성자
		try {
			Context ctx= new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle"); //tomcat인 경우 필요
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	public static MemberDAO  getInstance(){	
		if(instance==null){ //한번도 생성한적이없다.
			synchronized (MemberDAO.class) {	//동기화 했기때문에 동기화된 이 클래스를 통과한다.
				instance=new MemberDAO();  //instance에 MemberDAO()의 주소를 저장해논다.
			}
		}
		return instance; //또 검색할때 있으면 리턴해줌
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
			
			 su = pstmt.executeUpdate();  //중요합니당~
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				try {
					if(pstmt !=null)
					pstmt.close(); //close 해줘라. pstmt가 나중의것이므로 먼저닫음
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
			
			if(rs.next()) //rs에 값이있을때
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
		return result;	//rs에 값이 있으면 사용불가.(중복)
	}
	
	public Map<String,String> login(String id,String pwd){
		Map<String,String> map=null ;//객체를 넘겨줄때 map을 사용한다.
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
