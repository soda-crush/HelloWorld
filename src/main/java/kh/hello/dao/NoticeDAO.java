package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.NoticeDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<NoticeDTO> noticeListByPage(int start, int end, String searchOption, String keyword){
		Map<String, Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("searchOption", searchOption);
		param.put("keyword", "%"+keyword+"%");
		return jdbc.selectList("Notice.noticeListByPage", param);
	}
	
	public int getNoticeTotal(String searchOption, String keyword) {
		Map<String, String> param = new HashMap<>();
		param.put("searchOption", searchOption);
		param.put("keyword", "%"+keyword+"%");
		return jdbc.selectOne("Notice.getNoticeTotal", param);
	}
	public int plusNoticeView(int seq) {
		return jdbc.update("Notice.plusNoticeView", seq);
	}
	
	public NoticeDTO detailViewNotice(int seq) {
		return jdbc.selectOne("Notice.detailViewNotice", seq);
	}
}
