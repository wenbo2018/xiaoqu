package com.scut.util;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component("logAspect")
public class LogAspect
{

	public void aroundLog(ProceedingJoinPoint proceedingJoinPoint) throws Throwable
	{
		LogMessage.addLog(proceedingJoinPoint.getSignature().getName());
		proceedingJoinPoint.proceed();
	}
}
