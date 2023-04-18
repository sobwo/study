package com.myezen.myapp.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class BoardTypeCheckAdvice {
	private static final Logger logger = LoggerFactory.getLogger(BoardTypeCheckAdvice.class);
	@Around("execution(* com.myezen.myapp.service.BoardService*.*(..))")
	public Object timelog(ProceedingJoinPoint pjp) throws Throwable {
		Object result = null;
		
		logger.info("before AOP");
		logger.info(Arrays.deepToString(pjp.getArgs()));
		long startTime = System.currentTimeMillis();
		
		result = pjp.proceed(); // 진행되는 과정
		
		long endTime = System.currentTimeMillis();
		logger.info("after AOP");
		logger.info(pjp.getSignature().getName()+" : "+(endTime-startTime));
		return result;
	}
}
