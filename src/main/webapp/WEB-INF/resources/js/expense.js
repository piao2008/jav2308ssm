//id=addRow注册事件
let index=1
$("#addRow").click(function (){
    let tr=''
    tr+='<tr id="row'+index+'">'
    tr+='    <td>'+index+'</td>'
    tr+='    <td>'
    tr+='        <div class="row">'
    tr+='           <div>'
    tr+='            <select onchange="deleteSpace2('+index+')"  class="form-control col-md-10" name="extypeids">'
    tr+=$("#op").html()
    tr+='            </select>'

    tr+='           </div>'
    tr+='            <label name="extypeids" id="extypeids'+index+'"  class="col-form-label text-danger"></label>'
    tr+='        </div>'
    tr+='    </td>'
    tr+='    <td>'
    tr+='        <div class="row">'
    tr+='           <div>'
    tr+='            <input id="money'+index+'" type="text" value="0" onkeyup="getTotal(this,'+index+')" name="moneys" class="form-control col-md-6" placeholder="请输入总金额...">'
    tr+='           </div>'
    tr+='            <label id="moneys'+index+'" name="moneys"  class="col-form-label text-danger"></label>'
    tr+='        </div>'
    tr+='    </td>'
    tr+='    <td>'
    tr+='        <div class="row">'
    tr+='           <div>'
    tr+='            <input type="text" onkeyup="deleteSpace('+index+')" name="costdescs" class="form-control col-md-6" placeholder="请输入费用说明...">'
    tr+='           </div>'
    tr+='           <label name="costdescs"  id="costdescs'+index+'"  class="col-form-label text-danger"></label>'
    tr+='        </div>'

    tr+='    </td>'
    tr+='    <td>'
    tr+='        <div class="row">'
    tr+='            <button type="button" class="btn btn-danger"  onclick="deleteRow('+index+')">删除</button>'
    tr+='        </div>'
    tr+='    </td>'
    tr+='</tr>'

    index++;
    //把tr添加到id=detail下tbody中
    //console.log(tr)
    $("#detail tbody").append(tr)

})

//求总金额
function  getTotal(obj,index)
{

    debugger
    $("#moneys"+index).text('')
    if(!$(obj).val().match(/^\d+$/))
    {
        $(obj).val(0)
    }

    let total=0
    $("input[name=moneys]").each(function (index,obj){

        total+=parseInt($(this).val())
    })
    //给id=total元素value属性赋值
    $("#total").val(total)

}

//表单验证
function  formValidate()
{
    if($('#confirmperson').val()==-1)
    {
        alert('请选择审批人')
        $('#confirmperson').focus()
        return false;
    }

    for(let i=0;i<$("select[name=extypeids]").length;i++)
    {

        if($("select[name=extypeids]").eq(i).val()==-1)
        {
            // alert('请选择报销类别')
            $("label[name=extypeids]").eq(i).text('请选报销类别')
            $("select[name=extypeids]").eq(i).focus()
            return  false;
        }
    }


    for(let i=0;i<$("input[name=moneys]").length;i++)
    {

        if($("input[name=moneys]").eq(i).val()=='' || $("input[name=moneys]").eq(i).val()==0)
        {
            //alert('金额不能为空或0')
            $("label[name=moneys]").eq(i).text('金额不能为空或0')
            $("input[name=moneys]").eq(i).focus()
            return  false;
        }
    }

    for(let i=0;i<$("input[name=costdescs]").length;i++)
    {

        if($("input[name=costdescs]").eq(i).val()=='')
        {
            //alert('请填写报销费用说明')
            $("label[name=costdescs]").eq(i).text('请填写报销费用说明')
            $("input[name=costdescs]").eq(i).focus()
            return  false;
        }
    }
}

//删除一行
function  deleteRow(index)
{
    if(confirm("真的删除?"))
    {
        debugger

        //console.log($("#money"+index)[0])
        let total=$("#total").val()
        $("#total").val(total-$("#money"+index).val())
        $("#row"+index).remove()
    }

}

//删除对应信息
function  deleteSpace(index)
{
    $("#costdescs"+index).text('')
}
//删除对应信息
function deleteSpace2(index)
{
    $("#extypeids"+index).text('')
}