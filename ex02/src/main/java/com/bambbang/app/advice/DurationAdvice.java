package com.bambbang.app.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component  //bean 등록
//@Aspect
public class DurationAdvice {
	
	//execution은 logadvice의 pointcut을 가져옴
	@Around("LogAdvice.allpointcut()")
	public Object logTime(ProceedingJoinPoint pjp) {
		long start= System.currentTimeMillis();
			Object obj = null;
			try {
				obj = pjp.proceed();
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //서비스메서드 호출 하는 부분                                                              
			long end = System.currentTimeMillis();
			log.info("time: " + (end-start));
		return obj;
	}
}
