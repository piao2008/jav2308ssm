/**
 * 文件管理相关的js
 */
//下拉列表默认选中
$("#departid").val('${fileInfo.departid}')
//下载
function  downloadFile(fileid,obj)
{
    //$(obj)把dom转成jq
    //obj表示当前元素
    //得到自定义属性url的值
    //debugger
    let url=$(obj).attr('url')
    //download="${fileInfo.fileurl}"
    //得到自定义属性fileurl的值
    let fileurl=$(obj).attr('fileurl')
    //设置当前元素的download属性的值
    $(obj).attr("download",fileurl)
    $(obj).attr('href',url)
    //外js中不能使用el表达式
    let url2=$("#oa").attr("root")+'/fileinfo/updatecount'
    let param={"fileId":fileid}
    $.post(url2,param,function(data){
        //刷新页面
        location.reload();
    })
}
