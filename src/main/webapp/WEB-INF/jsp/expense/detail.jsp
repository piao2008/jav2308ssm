
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>顺顺顺顺系统</title>
    <jsp:include page="../share/resources_css.jsp"></jsp:include>
</head>

<body>

<div id="main-wrapper">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <jsp:include page="../share/top.jsp"></jsp:include>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <jsp:include page="../share/menu.jsp"></jsp:include>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">报销单填写</h4>
                    <div class="ml-auto text-right">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Library</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">


                        <div class="table-responsive">
                            <!-- ============================================================== -->
                            <!-- end Tables Content -->
                            <!-- ============================================================== -->
                            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/expense/modifybyid" onsubmit="return formValidate()">
                               <input type="hidden" name="expenseid" value="${expense.expenseid}">
                                <table id="master" class="table">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>填报人</th>
                                        <th>填报时间</th>
                                        <th>总金额</th>
                                        <th>状态</th>
                                        <th>审批人</th>
                                    </tr>
                                    </thead>
                                    <tbody class="customtable" id="tbody">
                                    <tr>
                                        <td>${expense.empname}</td>
                                        <td id="clock">
                                            <input name="addtime" type="text" readonly="readonly" style="border: none" value="${expense.addtime}">
                                        </td>
                                        <td>
                                            <input name="total" id="total" type="text"  readonly="readonly" style="border: none" value="${expense.total}">
                                        </td>
                                        <td>${expense.state==1?'新创建':'提交'}</td>
                                        <td>
                                            <div class="row">
                                                <c:if test="${expense.state==1}">
                                                <select class="form-control col-md-8" id="confirmperson" name="confirmperson">
                                                    <option value="-1">==选择审批人==</option>
                                                    <c:forEach items="${positionList}" var="position">
                                                        <option value="${position.empid}">${position.empname}</option>
                                                    </c:forEach>
                                                </select>
                                                </c:if>
                                                <c:if test="${expense.state!=1}">
                                                    ${expense.leadername}
                                                    </select>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>

                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="5">
                                            <c:if test="${expense.state==1}">
                                            <button type="button" id="addRow"  class="btn btn-danger" style="background-color: #ca6307;border: none">新增一项</button>
                                            </c:if>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>

                                <table id="detail" class="table">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>序号</th>
                                        <th scope="col">费用类别</th>
                                        <th scope="col">费用金额</th>
                                        <th scope="col">费用说明</th>
                                        <th scope="col">操作</th>
                                    </tr>
                                    </thead>

                                    <tbody size="${expense.list.size()}">
                                    <input type="hidden" id="size" value="${expense.list.size()}">
                                    <c:forEach items="${expense.list}" var="expenseDetail" varStatus="vsdetail">
                                    <tr id="row${vsdetail.count}">
                                        <td>${vsdetail.count}</td>
                                        <td>
                                            <div class="row">
                                                <div>
                                                    <c:if test="${expense.state==1}">
                                                    <select class="form-control col-md-8" name="extypeids" extypeid="${expenseDetail.extypeid}">
                                                        <option value="-1">==请选择==</option>
                                                        <c:forEach items="${listType}" var="type">
                                                            <option value="${type.extypeid}">${type.extypename}</option>
                                                        </c:forEach>

                                                    </select>
                                                    </c:if>
                                                    <c:if test="${expense.state==2}">
                                                        ${expenseDetail.extypename}
                                                    </c:if>
                                                </div>
                                                <label name="extypeids" id="extypeids${vsdetail.count}"  class="col-form-label text-danger"></label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="row">
                                                <c:if test="${expense.state==1}">
                                                <div>
                                                <input type="text" onkeyup="getTotal(this,1)" name="moneys" value="${expenseDetail.money}" class="form-control col-md-6" placeholder="请输入总金额...">
                                                </div>
                                                <label id="moneys${vsdetail.count}" name="moneys"  class="col-form-label text-danger"></label>
                                                </c:if>
                                                <c:if test="${expense.state==2}">${expenseDetail.money}</c:if>

                                            </div>
                                        </td>
                                        <td>
                                            <div class="row">
                                                <c:if test="${expense.state==1}">
                                                <div>
                                                <input type="text" name="costdescs" value="${expenseDetail.costdesc}" class="form-control col-md-6" placeholder="请输入费用说明...">
                                                </div>
                                                <label name="costdescs"  id="costdescs${vsdetail.count}"  class="col-form-label text-danger"></label>
                                                </c:if>
                                                <c:if test="${expense.state==2}">${expenseDetail.costdesc}</c:if>

                                            </div>
                                        </td>
                                        <td>
                                            <div class="row">
                                                <c:if test="${expense.state==1}">
                                                <button type="button" class="btn btn-danger" onclick="deleteRow(${vsdetail.count},${expenseDetail.id})">删除</button>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                    </c:forEach>

                                    </tbody>

                                </table>
                                <div class="border-top">
                                    <label for="cono1" class="col-sm-3 text-left control-label col-form-label">事由</label>
                                    <div class="col-sm-12">
                                        <c:if test="${expense.state==1}">
                                        <textarea class="form-control" name="reason" style="height: 100px;" placeholder="输入内容">${expense.reason}</textarea>
                                        </c:if>
                                        <c:if test="${expense.state==2}">${expense.reason}</c:if>
                                    </div>
                                </div>
                                <!-- 隐藏控件 -->
                                <input type="hidden" id="start" value="1">
                                <div class="card-body">
                                    <c:if test="${expense.state==1}">
                                    <button type="submit" class="btn btn-secondary" style="background-color: #609e9b;border: none">保存</button>
                                    <button type="reset" class="btn btn-info" style="background-color: #355a6d;border: none">重置</button>
                                    </c:if>
                                    <c:if test="${expense.state==2}">
                                        <a class="btn-info btn" href="javascript:history.go(-1);" >返回</a>
                                    </c:if>
                                </div>
                            </form>
                            <!-- ============================================================== -->
                            <!-- end Tables Content -->
                            <!-- ============================================================== -->
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" id="op"  style="display: none">

                    <option value="-1">==请选择==</option>
                    <c:forEach items="${listType}" var="type">
                        <option value="${type.extypeid}">${type.extypename}</option>
                    </c:forEach>

            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <jsp:include page="../share/footer.jsp"></jsp:include>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<jsp:include page="../share/resources_js.jsp"></jsp:include>


<script>
    //审批人默认选中
    $("#confirmperson").val('${expense.confirmperson}')
    //报销类别的默认选中
    $("select[name=extypeids]").each(function (){
       $(this).val($(this).attr('extypeid'))
    })

    ///
    //id=addRow注册事件
    let index=parseInt($("#detail tbody").attr('size'))+1
    $("#addRow").click(function (){
        let tr=''
        tr+='<tr id="row'+index+'">'
        tr+='    <td>'+index+'</td>'
        tr+='    <td>'
        tr+='        <div class="row">'
        tr+='           <div>'
        tr+='            <select onchange="deleteSpace2('+index+')"  class="form-control col-md-8" name="extypeids">'
        tr+=$("#op").html()
        tr+='            </select>'

        tr+='           </div>'
        tr+='            <label name="extypeids" id="extypeids'+index+'"  class="col-form-label text-danger"></label>'
        tr+='        </div>'
        tr+='    </td>'
        tr+='    <td>'
        tr+='        <div class="row">'
        tr+='           <div>'
        tr+='            <input type="text" value="0" onkeyup="getTotal(this,'+index+')" name="moneys" class="form-control col-md-6" placeholder="请输入总金额...">'
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
        tr+='            <button type="button" class="btn btn-danger"  onclick="deleteRow('+index+',-1)">删除</button>'
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
    function  deleteRow(index,detailid)
    {
        if(confirm("真的删除?"))
        {
                if(detailid==-1)
                {
                    $("#row"+index).remove()
                }
                else
                {
                    //ajax
                    let url='${pageContext.request.contextPath}/expense/deletebyiddetail?detailId='+detailid
                    $.get(url,function (data){
                        $("#row"+index).remove()
                    })
                }

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
    ///
</script>
</body>

</html>