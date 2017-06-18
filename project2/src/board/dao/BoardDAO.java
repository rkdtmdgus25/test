package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;


public class BoardDAO {
	/*
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@localhost:1521:xe";
	private String username="java"; //오라클계정
	private String password="itbank";//계정패스워드
	*/
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	private static BoardDAO instance; //싱글톤 처리 메모리에 한번만 잡게하겠다.
	
	public BoardDAO() {
		try {
			Context ctx= new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle"); //tomcat인 경우 필요
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance(){	
		if(instance==null){ //한번도 생성한적이없다.
			synchronized (BoardDAO.class) {	//동기화 했기때문에 동기화된 이 클래스를 통과한다.
				instance=new BoardDAO();  //instance에 MemberDAO()의 주소를 저장해논다.
			}
		}
		return instance; //또 검색할때 있으면 리턴해줌
	}
	
	public void boardModify(Map<String,String> map){
		String sql="update board set subject=?,content=? where seq=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, map.get("subject"));
			pstmt.setString(2, map.get("content"));
			pstmt.setInt(3, Integer.parseInt(map.get("seq")));
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
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
	}
	public void boardDelete(int seq){
		String sql="delete board where seq=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
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
		
	}
	
	public ArrayList<BoardDTO> boardList(int start,int end){
		ArrayList<BoardDTO> list=new ArrayList<BoardDTO>();
		String sql="select seq,id,name,email,subject,content,hit,to_char(logtime,'YYYY.MM.DD') as logtime from"
				+ "(select rownum rn,tt.* from "
				+ "(select * from board order by seq desc)tt)"
				+ "where rn>=? and rn<=?";
		
		
		try{
		con=ds.getConnection();
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		rs=pstmt.executeQuery();
		
		while(rs.next()){ //rs가 없을때까지
			BoardDTO boardDTO = new BoardDTO(); //rs가 있으면 DTO를 만든다.
			boardDTO.setSeq(rs.getInt("seq"));
			boardDTO.setId(rs.getString("id"));
			boardDTO.setName(rs.getString("name"));
			boardDTO.setEmail(rs.getString("Email"));
			boardDTO.setSubject(rs.getString("subject"));
			boardDTO.setContent(rs.getString("content"));
			boardDTO.setHit(rs.getInt("hit"));
			boardDTO.setLogtime(rs.getString("logtime"));
			
			list.add(boardDTO);
		}
		
		}catch(SQLException e){
			list=null; //list에 넣는중에 에러가발생해도 리턴을 하므로,에러발생하면 null
		}
		return list;
	}
	
	public BoardDTO boardView(int seq){
		BoardDTO boardDTO=null;
		String sql="select * from board where seq=?";
	
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,seq);
			rs=pstmt.executeQuery();
			if(rs.next()){
			boardDTO=new BoardDTO();
			boardDTO.setSeq(rs.getInt("seq"));
			boardDTO.setId(rs.getString("id"));
			boardDTO.setName(rs.getString("name"));
			boardDTO.setEmail(rs.getString("Email"));
			boardDTO.setSubject(rs.getString("subject"));
			boardDTO.setContent(rs.getString("content"));
			boardDTO.setHit(rs.getInt("hit"));
			boardDTO.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)
				rs.close();
				if(pstmt !=null)
				pstmt.close(); //close 해줘라. pstmt가 나중의것이므로 먼저닫음
				if(con !=null)
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}		
		return boardDTO;
	}
	
	public void updateHit(int seq){
		String sql="update board set hit=hit+1 where seq=?";

		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)
				rs.close();
				if(pstmt !=null)
				pstmt.close(); //close 해줘라. pstmt가 나중의것이므로 먼저닫음
				if(con !=null)
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		
	}
	public int getTotalArticle(){
		int su=0;
		String sql="select count(*)as count from board";

		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next(); //포지션 설정, 몇번쨰rs에다 설정을맞춤
			su=rs.getInt(1);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)
				rs.close();
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
	
	public void boardWrite(BoardDTO boardDTO){
		
		String sql = "insert into board values(seq_board.nextval,?,?,?,?,?,0,sysdate)";

	
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getId());
			pstmt.setString(2, boardDTO.getName());
			pstmt.setString(3, boardDTO.getEmail());
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getContent());
	
			 pstmt.executeUpdate();  //중요합니당~
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
	}
}
