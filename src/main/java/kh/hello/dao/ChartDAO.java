package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.ChartGenderDTO;
import kh.hello.dto.ChartJoinPathDTO;
import kh.hello.dto.ChartVisitChangeDTO;

@Repository
public class ChartDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<ChartVisitChangeDTO> getVisitChange(){
		return jdbc.selectList("Chart.getVisitChange");
	}
	
	public List<ChartGenderDTO> getGenderRatio(){
		return jdbc.selectList("Chart.getGenderRatio");
	}
	
	public List<ChartJoinPathDTO> getJoinPath(){
		return jdbc.selectList("Chart.getJoinPath");
	}
}
