package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.InquiryDTO;

@Repository
public class MemberInquiryDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<InquiryDTO> getMyInquiryByPage(String id, int start, int end){
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("MemberInquiry.getMyInquiryByPage", param);
	}
	
	public int getMyInquiryTotal(String id) {
		return jdbc.selectOne("MemberInquiry.getMyInquiryTotal", id);
	}
	
	public int getInquirySeq() {
		return jdbc.selectOne("MemberInquiry.getInquirySeq");
	}
	
	public int insertImg(int boardSeq, String sysName) {
		Map<String, Object> param = new HashMap<>();
		param.put("boardSeq", boardSeq);
		param.put("sysName", sysName);
		return jdbc.insert("MemberInquiry.insertImg", param);
	}
	public int writeInquiry(InquiryDTO dto) {
		return jdbc.insert("MemberInquiry.writeInquiry", dto);
	}
}
