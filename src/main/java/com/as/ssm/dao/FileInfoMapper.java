package com.as.ssm.dao;

import com.as.ssm.domain.FileInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 文件管理数据访问层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/7
 **/

public interface FileInfoMapper {

    /**
     * 文件添加
     * @param fileInfo
     */
    public  void insert(FileInfo fileInfo);

    /**
     * 修改
     * @param fileInfo
     */
    public  void updateById(FileInfo fileInfo);

    /**
     * 主键删除
     * @param fileId
     */
    public void deleteById(Integer fileId);

    public void deleteByIds(Integer[] fileIds);

    /**
     * 主键查询
     * @param fileId
     * @return
     */
    public FileInfo selectById(Integer fileId);

    /**
     * 修改下载次数
     * @param fileId
     */
    public void updateCount(Integer fileId);

    /**
     * 查询
     * @param fileInfo
     * @param skip
     * @param take
     * @return
     */
    public List<FileInfo> select(@Param("fileInfo") FileInfo fileInfo,@Param("skip") Integer skip,@Param("take") Integer take);

    /**
     * 记录条数
     * @param fileInfo
     * @return
     */
    public int getRowCount(@Param("fileInfo") FileInfo fileInfo);

    /**
     * 按多个主键查询
     * @param fileIds
     * @return
     */
    public  List<FileInfo> selectByFileIds(Integer[] fileIds);
}
