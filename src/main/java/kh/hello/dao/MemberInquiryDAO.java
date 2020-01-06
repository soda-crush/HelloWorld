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
}
