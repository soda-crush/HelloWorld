package kh.hello.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kh.hello.services.ProjectService;

@Component
public class ProjectScheduler {

	@Autowired
	private ProjectService svc;
	
	@Scheduled(cron = "0 0 0 * * ?")
	public void closeProject() {
		svc.letProjectClose();		
	}
}
