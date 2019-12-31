package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.hello.dao.ProjectDAO;
import kh.hello.dto.ProjectDTO;

@Service
public class ProjectService {

	@Autowired
	private ProjectDAO dao;
	
	public List<ProjectDTO> projectList(){
		return dao.getProjectList();
	}
	
	@Transactional("txManager")
	public ProjectDTO ProjectDetailView(int seq) {
		dao.updateProjectViewCount(seq);
		return dao.getProjectDetailView(seq);
	}
	
	
}
