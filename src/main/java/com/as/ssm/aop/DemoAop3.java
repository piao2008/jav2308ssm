package com.as.ssm.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * a定义切面类
 * @author Administrator
 *
 */
@Aspect
@Component
public class DemoAop3 {

	//定义切点
	//第一个*表示任意返回值
	//第二个*表示任意类
	//第三个*表示任意方法
	//..表示任意参数
	
	//@Pointcut("execution(* com.as.service..*.*(..))") //第一个".." 表示当前包和子包
	@Pointcut("execution(* com.as.ssm.service.*.*(..))")
	 public void aspcut() {}//固定写法,方法名称任意.
	


	
	//环绕增强:在方法执行前和执行后都要执行.
	//环绕增强方法的返回值,就是目标对象方法的返回值.
	//方法中必须要有ProceedingJoinPoint joinPoint类型 参数
	@Around("aspcut()")
	public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("环绕增强--执行前");
		//毫秒
		long begin=System.currentTimeMillis();
		//操作日志
		//必须要joinPoint.proceed();
		System.out.println("操作的类名为:"+joinPoint.getTarget().getClass().getSimpleName());
		System.out.println("操作的类名为:"+joinPoint.getTarget().getClass().getName());
		System.out.println("操作的方法名称"+joinPoint.getSignature().getName());
		//得到参数
		Object[] params=joinPoint.getArgs();
	
		
		for(Object p:params)
		{
			System.out.println(p);
		}
		//执行方法:目标对象的方法.
		Object obj=joinPoint.proceed();
		long end=System.currentTimeMillis()-begin;
		System.out.println("时间:"+end);
		System.out.println("环绕增强--执行后");
		return obj;
	}
	
	
}
