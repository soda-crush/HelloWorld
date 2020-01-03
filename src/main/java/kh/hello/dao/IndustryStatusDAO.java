package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.IndustryStatusCoDTO;
import kh.hello.dto.IndustryStatusDTO;

@Repository
public class IndustryStatusDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
	//업계현황 게시판
	public List<IndustryStatusDTO> selectAll(){
		return jdbc.selectList("Industry.selectAll");
	}
	public IndustryStatusDTO getIndustryStatusDetailView(int seq) {
		return jdbc.selectOne("Industry.getIndustryStatusDetailView", seq);
	}
	public int latestSeq(String writer) {
		return jdbc.selectOne("Industry.latestSeq", writer);
	}
	public int insertIndustryStatus(IndustryStatusDTO dto) {
		return jdbc.insert("Industry.insertIndustryStatus", dto);
	}	
	public int updateIndustryStatus(IndustryStatusDTO dto) {
		return jdbc.update("Industry.updateIndustryStatus", dto);
	}
	public int updateIndustryStatusViewCount(int seq) {
		return jdbc.update("Industry.updateIndustryStatusViewCount", seq);
	}
	public int deleteIndustryStatus(int seq) {
		return jdbc.delete("Industry.deleteIndustryStatus", seq);
	}
	
	//대나무숲 댓글
	
	public List<IndustryStatusCoDTO> getCoList(int indSeq){
		return jdbc.selectList("IndustryCo.getList", indSeq);
	}
	public int insertIndustryStatusCo(IndustryStatusCoDTO dto) {
		return jdbc.insert("IndustryCo.insertIndustryStatusCo", dto);
	}	
	public int updateIndustryStatusCo(IndustryStatusCoDTO dto) {
		return jdbc.update("IndustryCo.updateIndustryStatusCo", dto);
	}	
	public int deleteIndustryStatusCo(int seq) {
		return jdbc.delete("IndustryCo.deleteIndustryStatusCo", seq);
	}
	public int deleteIndustryStatusAllCo(int indSeq) {
		return jdbc.delete("IndustryCo.deleteIndustryStatusAllCo", indSeq);
	}
}
