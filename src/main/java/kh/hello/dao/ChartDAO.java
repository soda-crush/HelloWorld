package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.BoardLogDTO;
import kh.hello.dto.ChartGenderDTO;
import kh.hello.dto.ChartGenerationDTO;
import kh.hello.dto.ChartJoinPathDTO;
import kh.hello.dto.ChartVisitChangeDTO;
import kh.hello.dto.ChartWorkDTO;
import kh.hello.dto.CommentLogDTO;
import kh.hello.dto.MemberDTO;

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
	
	public List<ChartWorkDTO> getWorkRatio(){
		return jdbc.selectList("Chart.getWorkRatio");
	}
	
	public List<ChartGenerationDTO> getGenerationRatio(){
		return jdbc.selectList("Chart.getGenerationRatio");
	}
	
	public List<MemberDTO> getTop5List(){
		return jdbc.selectList("Chart.getTop5List");
	}
	
	public List<BoardLogDTO> getBoardLog(){
		return jdbc.selectList("Chart.getBoardLog");
	}
	
	public List<CommentLogDTO> getComLog(){
		return jdbc.selectList("Chart.getComLog");
	}
}
