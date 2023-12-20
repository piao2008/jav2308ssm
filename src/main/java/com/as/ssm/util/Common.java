package com.as.ssm.util;

/**
 * 常量类
 * @author user
 *
 */
public interface Common {
	//每页大小
	public static final int PAGESIZE=Integer.parseInt(ReaderProperties.newInstance().getProperty("pagesize"));
	//上传文件路径
	public static final String FILEUPLOAD=ReaderProperties.newInstance().getProperty("fileupload");
}
