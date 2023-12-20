// 通用js

//给a元素name=deleteRow注册事件

$("a[name=deleteRow]").click(function (){
    if(confirm("真的删除?"))
    {
        //删除对应地址
        let url=$(this).attr('delete_url')
        //删除对应的主键
        let key=$(this).attr("key")
        //跳转地址
        location.href=url+key;
    }
})


//通用批量删除
//id=deleteAll注册事件
$("#deleteAll").click(function (){

    if($("input[name=c]:checked").length==0)
    {
        alert('至少选择一个,再删除!')
        return
    }
    if(confirm("真的执行批量删除?"))
    {
        let deletes_url=$(this).attr("deletes_url")
        //定义数组
        let ids=[]
        //匹配所有input元素name=c并且被选中,遍历
        $("input[name=c]:checked").each(function (index,obj){
            //把匹配元素的value值添加到ids数组中
            ids.push($(this).val())
        })
        location.href=deletes_url+ids
    }

})

// 全选或全不选

$("#mainCheckbox").change(function (){

    $("input[name=c]").prop("checked",$(this).prop("checked"))
})
