package com.bambbang.app.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component
@Aspect
public class LogAdvice {
	
	@Pointcut("execution(* com.bambbang.app..*ServiceImpl.*(..))")
	public void allpointcut() {}

	//pointcut 불러올때는 메서드 이름을 써 주면 된다.
	@Before("allpointcut()")
	public void logBefore(JoinPoint jp) {
		log.info("[before]======================");
		//JoinPoint jp 를 사용하면 불러온 서비스 메서드의 이름등 정보를 가져올 수 있다.
		//JoinPoint자체가 서비스 메서드래
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		String str = methodName + " : args="+ (!(args==null) && args.length>0? args[0] :""); 
		log.info(str);
	}
	
	//pointcut 불러올때는 메서드 이름을 써 주면 된다.
	@AfterReturning(pointcut="allpointcut()", returning="obj")
	public void logAfter(JoinPoint jp, Object obj) {
		log.info("=============================================[after]");
		String methodName = jp.getSignature().getName();
		String str = methodName+" : return="+(obj !=null? obj:"");
		log.info(str);
	}
}
