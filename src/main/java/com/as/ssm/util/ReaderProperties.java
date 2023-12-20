package com.as.ssm.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 单列设计模式实现
 * @author user
 *
 */
public class ReaderProperties extends Properties {

	private static ReaderProperties properties=null;
	
	private ReaderProperties()
	{
		//读取属性文件
		InputStream is=this.getClass().getResourceAsStream("/configuration.properties");
		try {
			//加载属性文件中key和值
			this.load(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}
	
	public static ReaderProperties newInstance()
	{
		if(properties==null)
		{
			properties=new ReaderProperties();
		}
		return properties;
	}
}
