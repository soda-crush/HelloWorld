package kh.hello.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.dbcp2.BasicDataSource;

public class CountDAO {

	private static CountDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	private CountDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("hello");
		bds.setPassword("hello");
		bds.setInitialSize(30);		
	}
	
	private Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	
	public synchronized static CountDAO getInstance() {
		if(CountDAO.instance == null) {
			CountDAO.instance = new CountDAO();
		}
		return CountDAO.instance;
	}
	
	public void plusVisitCount() throws Exception{
		String sql = "insert into visit values(sysdate)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.executeUpdate();
			con.commit();
		}
	}
	
	public int getVisitTotalCount() throws Exception{
		String sql = "select count(*) from visit";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);	
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);
		}
	}
	
	public int getVisitTodayCount() throws Exception{
		String sql = "select count(*) from visit where substr(to_char(visit), 1, 9) = to_date(sysdate, 'yy/MM/dd')";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);	
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);
		}
	}
}
