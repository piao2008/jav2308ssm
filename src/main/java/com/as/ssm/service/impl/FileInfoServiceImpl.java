package com.as.ssm.service.impl;

import com.as.ssm.dao.FileInfoMapper;
import com.as.ssm.domain.Employee;
import com.as.ssm.domain.FileInfo;
import com.as.ssm.service.FileInfoService;
import com.as.ssm.util.Common;
import com.as.ssm.util.Pages;
import com.as.ssm.util.UploadFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/7
 **/
@Service
public class FileInfoServiceImpl implements FileInfoService {
    @Autowired
    private FileInfoMapper fileInfoMapper;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpSession session;
    @Override
    public void append(FileInfo fileInfo, MultipartFile file) {
        //得到登录中员工的信息
        Employee emp=(Employee)session.getAttribute("loginEmp");
        //
        fileInfo.setEmpid(emp.getEmpid());

        //上传文件
        String fileName= UploadFile.fileUp(file, request);
        //给文件信息fileUrl属性赋值
        fileInfo.setFileurl(fileName);
        this.fileInfoMapper.insert(fileInfo);
    }

    @Override
    public void modifyById(FileInfo fileInfo, MultipartFile file) {
        String fileName= UploadFile.fileUp(file, request);
        if(fileName!=null)  fileInfo.setFileurl(fileName);
        this.fileInfoMapper.updateById(fileInfo);
    }

    @Override
    public void removeById(Integer fileId) {
        //得到文件信息
        FileInfo fileInfo=this.fileInfoMapper.selectById(fileId);
        //1>删除数据
        this.fileInfoMapper.deleteById(fileId);
        //2>删除物理文件
        String fileName = request.getSession().getServletContext().getRealPath("/") + "/" + Common.FILEUPLOAD + "/"
                + fileInfo.getFileurl();// 得到物理路径
        //创建文件对象
        File file=new File(fileName);
        //判断文件是否存在
        if(file.exists())
        {
            //删除物理文件
            file.delete();
        }
    }

    @Override
    public void removeByIds(Integer[] fileIds) {

        //1>删除物理文件
        List<FileInfo> listFileInfo=this.fileInfoMapper.selectByFileIds(fileIds);

        for(FileInfo fileInfo :listFileInfo)
        {
            String fileName = request.getSession().getServletContext().getRealPath("/") + "/" + Common.FILEUPLOAD + "/"
                    + fileInfo.getFileurl();// 得到物理路径
            //创建文件对象
            File file=new File(fileName);
            //判断文件是否存在
            if(file.exists())
            {
                //删除物理文件
                file.delete();
            }
        }
        //2>删除表中数据
        this.fileInfoMapper.deleteByIds(fileIds);

        //



    }

    @Override
    public FileInfo getById(Integer fileId) {
        return this.fileInfoMapper.selectById(fileId);
    }

    @Override
    public void updateCount(Integer fileId) {
        this.fileInfoMapper.updateCount(fileId);
    }

    @Override
    public Pages<FileInfo> list(Integer currPage, FileInfo fileInfo) {
        int rowCount = this.fileInfoMapper.getRowCount(fileInfo);
        List<FileInfo> list = this.fileInfoMapper.select(fileInfo, (currPage - 1) * Common.PAGESIZE, Common.PAGESIZE);
        return new Pages<>(currPage, Common.PAGESIZE, rowCount, list);
    }
}
