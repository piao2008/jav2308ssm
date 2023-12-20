package com.as.ssm.service;

import com.as.ssm.domain.FileInfo;
import com.as.ssm.util.Pages;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件管理业务层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/7
 **/

public interface FileInfoService{
    /**
     * 文件添加
     * @param fileInfo
     */
    public  void append(FileInfo fileInfo, MultipartFile file);

    /**
     * 修改
     *
     * @param fileInfo
     * @param file
     */
    public  void modifyById(FileInfo fileInfo,MultipartFile file);

    /**
     * 主键删除
     * @param fileId
     */
    public void removeById(Integer fileId);

    public void removeByIds(Integer[] fileIds);

    /**
     * 主键查询
     * @param fileId
     * @return
     */
    public FileInfo getById(Integer fileId);

    /**
     * 修改下载次数
     * @param fileId
     */
    public void updateCount(Integer fileId);

    /**
     * 分页信息
     * @param currPage
     * @param fileInfo
     * @return
     */
    public Pages<FileInfo> list(Integer currPage,FileInfo fileInfo);

}
