package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.ReportDTO;

@Repository
public class ReportDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<ReportDTO> reportListByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Report.reportListByPage", param);
	}
	
	public int getReportTotal() {
		return jdbc.selectOne("Report.getReportTotal");
	}
	
	public int updateResult(int seq, String result) {
		Map<String, Object> param = new HashMap<>();
		param.put("seq", seq);
		param.put("result", result);
		return jdbc.update("Report.updateResult", param);
	}
	
	public int updateState(int seq) {
		return jdbc.update("Report.updateState", seq);
	}
	
	public List<ReportDTO> waitListByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Report.waitListByPage", param);		
	}
	
	public int getWaitTotal() {
		return jdbc.selectOne("Report.getWaitTotal");
	}
	
	public List<ReportDTO> endListByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);		
		return jdbc.selectList("Report.endListByPage", param);
	}
	
	public int getEndTotal() {
		return jdbc.selectOne("Report.getEndTotal");
	}
}
