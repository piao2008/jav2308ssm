package com.as.ssm.domain;

import lombok.Data;

/**
 * 文件信息类
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/7
 **/
@Data
public class FileInfo {
    /**
     * 文件id
     */
    private Integer fileid;

    /**
     * 文件的标题名称
     */
    private String filename;

    /**
     * 上传后的文件名称
     */
    private String fileurl;

    /**
     * 文件描述
     */
    private String filedesc;

    /**
     * 员工id
     */
    private Integer empid;

    /**
     * 下载次数
     */
    private Integer count;
    /**
     * 文件大小
     */
    private Integer filesize;

    /**
     * 上传时间
     */
    private String posttime;

    /**
     * 员工名称
     */
    private String empname;

    /**
     * 部门名称
     */
    private  String departname;

    /**
     * 部门id
     */
    private  Integer departid;
}
