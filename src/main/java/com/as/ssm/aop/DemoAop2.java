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
 * jdk动态代理
 * @author Administrator
 *
 */
//@Aspect
//@Component
public class DemoAop2 {

	//定义切点
	//第一个*表示任意返回值
	//第二个*表示任意类
	//第三个*表示任意方法
	//..表示任意参数
	
	//@Pointcut("execution(* com.as.service..*.*(..))") //第一个".." 表示当前包和子包
	@Pointcut("execution(* com.as.ssm.service..*.*(..))")
	 public void aspcut() {}//固定写法,方法名称任意.
	
	//通知(增强) 5种
	
	//前置增强:方法执行前
	@Before("aspcut()")
	public void before() {
		System.out.println("前置增强");
	}
	
	//后置增强:方法执行后
	@AfterReturning(pointcut ="aspcut()" )
	 public void afterReturning()
	 {
		 System.out.println("后置增强");
	 }
	//最终增强:相当于异常处理的finally
	@After("aspcut()")
	public void after() {
		System.out.println("最终增强");
	}
	
	//异常增强:当发生异常时,后置增强不会执行.最终增强依然执行.
	@AfterThrowing(pointcut ="aspcut()",throwing = "ex" )
	public void afterThrowing(Exception ex) throws Throwable {
		System.out.println("异常增强");
		System.out.println(ex.getMessage());
		System.out.println("异常增强");
		
	}
	
	//环绕增强:在方法执行前和执行后都要执行.
	//环绕增强方法的返回值,就是目标对象方法的返回值.
	//方法中必须要有ProceedingJoinPoint joinPoint类型 参数
	@Around("aspcut()")
	public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("环绕增强--执行前");
		//执行方法:目标对象的方法.
		//必须要joinPoint.proceed();
		Object obj=joinPoint.proceed();
		System.out.println("环绕增强--执行后");
		return obj;
	}
	
	
}
