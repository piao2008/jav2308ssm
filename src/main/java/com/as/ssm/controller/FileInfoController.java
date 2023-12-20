package com.as.ssm.controller;

import com.as.ssm.domain.DepartInfo;
import com.as.ssm.domain.FileInfo;
import com.as.ssm.service.DepartInfoService;
import com.as.ssm.service.FileInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/7
 **/

@Controller
@RequestMapping("/fileinfo")
public class FileInfoController {
    @Autowired
    private FileInfoService fileInfoService;
    @Autowired
    private DepartInfoService departInfoService;

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "currPage",required = true,defaultValue = "1") Integer currPage, FileInfo fileInfo)
    {
        ModelAndView mv=new ModelAndView("file/list");
        mv.addObject("pages", this.fileInfoService.list(currPage,fileInfo));
        mv.addObject("fileInfo", fileInfo);
        mv.addObject("listDepart", this.departInfoService.list(-1,new DepartInfo()).getList());
        return mv;
    }

    @GetMapping("/removebyid")
    public ModelAndView removeById(Integer fileId)
    {
        ModelAndView mv=new ModelAndView("redirect:/fileinfo/list");
        this.fileInfoService.removeById(fileId);
        return mv;
    }

    @GetMapping("/removebyids")
    public ModelAndView removeByIds(Integer[] fileIds)
    {
        ModelAndView mv=new ModelAndView("redirect:/fileinfo/list");
        this.fileInfoService.removeByIds(fileIds);
        return mv;
    }
    //添加显示页面
    @GetMapping("/append")
    public ModelAndView append()
    {
        ModelAndView mv=new ModelAndView("file/append");
        return mv;
    }

    //添加处理
    @PostMapping("/append")
    public ModelAndView append(FileInfo fileInfo, MultipartFile file)
    {
        ModelAndView mv=new ModelAndView("redirect:/fileinfo/list");
        this.fileInfoService.append(fileInfo,file);
        return mv;
    }

    //编辑
    @GetMapping("/edit")
    public ModelAndView getById(Integer fileId)
    {
        ModelAndView mv=new ModelAndView("file/list");
        mv.addObject("fileInfo", this.fileInfoService.getById(fileId));
        return mv;
    }

    //修改
    @PostMapping("/modifybyid")
    public ModelAndView modifyById(FileInfo fileInfo,MultipartFile file)
    {
        ModelAndView mv=new ModelAndView("redirect:/fileinfo/list");
        this.fileInfoService.modifyById(fileInfo,file );
        return mv;
    }

    //ajax方法
    @ResponseBody
    @PostMapping("/updatecount")
    public String updateCount(Integer fileId)
    {
        this.fileInfoService.updateCount(fileId);
        return "OK";
    }
}
