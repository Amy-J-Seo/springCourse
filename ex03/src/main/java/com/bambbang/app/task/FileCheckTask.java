package com.bambbang.app.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Component
@Log
public class FileCheckTask {
	
	@Scheduled(cron ="15,30 * * * * *" )
	public void checkFile() {
		log.info("file check................");
		log.info("____________________________");
	}
}
