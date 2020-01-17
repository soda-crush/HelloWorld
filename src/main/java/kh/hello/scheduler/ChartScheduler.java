package kh.hello.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kh.hello.dao.CountDAO;

@Component
public class ChartScheduler {
	
	@Autowired
	private CountDAO cdao;
	
	@Scheduled(cron = "0 15 10 * * ?")
	public void protectNoDay() {
		cdao.plusVisitCount();
		cdao.newBoard();
		cdao.delBoard();
		cdao.newCo();
		cdao.delCo();
	}
}
