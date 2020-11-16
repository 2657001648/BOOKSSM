<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/common/head.jsp"></jsp:include>

<html>
<head>
    <title>书籍展示</title>
    <script>

        var query_info="";

        $(function () {

            //得到TypeName列表并显示在select下拉框内
            getBookType();

            // query_info=$("#queryName").val();
            // alert("输入框的值："+query_info);

            /*使用ajax刷新table*/
           $("#btn_query").click(function () {
               alert("数据为："+$("#queryName").val());
               // var query_name = $("#queryName").val();

               query_info=$("#queryName").val();

               // alert("输入框的值："+query_info);

               queryBookFun(1);

           });

           //点击添加按钮
           $("#btn_add").click(function () {

               //显示模态框
               $("#myModal").modal({
                   backdrop:"static"
               });
           });

           /*要使用on函数，要不然ajax刷新后无法加载dom元素*/
           $(document).on('click',".btn_change",function (){
               // alert("!!!");
               var getId = $(this).parent().parent().find("td:first").text();
               // alert("得到的id为："+getId);
               location.href = "${pageContext.request.contextPath}/book/toUpdateBook?id="+getId;
           });

            $(document).on('click',".btn_delete",function () {

                // alert("!!!");
                var getName = $(this).parent().parent().find("td:eq(1)").text();
                // alert("得到的name为："+getName);
                if(confirm("你确定要删除【"+getName+"】吗？"))
                {
                    var getId = $(this).parent().parent().find("td:first").text();
                    location.href = "${pageContext.request.contextPath}/book/deleteBook/"+getId;
                }
            });

        });
    </script>

    <style>
        .div1{
            border:2px solid #BEBEBE;
            height: 480px;
        }
    </style>

</head>
<body>
<div class="container-fluid">

    <div style="height: 40px;">

        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Java <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">jmeter</a></li>
                    <li><a href="#">EJB</a></li>
                    <li><a href="#">Jasper Report</a></li>
                    <li class="divider"></li>
                    <li><a href="#">分离的链接</a></li>
                    <li class="divider"></li>
                    <li><a href="#">另一个分离的链接</a></li>
                </ul>
            </li>
            <li><a href="#">jmeter</a></li>
            <li><a href="#">EJB</a></li>
            <li><a href="#">Jasper Report</a></li>
        </ul>

    </div>

    <div class="row" style="margin-top: 50px">
        <div class="col-lg-2  div1">
            <div class="row">
                <ul class="nav nav-list nav-first" style="margin-top: 50px">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            图书操作
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="active" href="#">图书列表</a></li>
                            <li><a href="#">添加图书</a></li>
                            <li><a href="#">搜索图书</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            用户操作
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">用户列表</a></li>
                            <li><a href="#">添加用户</a></li>
                            <li><a href="#">搜索用户</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            拓展应用
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">导出到excel</a></li>
                            <li><a href="#">导入文件</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>

        <div class="col-lg-10">
            <div class="row">
                <div class="col-md-6">
                    <div class="input-group" style="width: 60%;height: 40px;margin: 0 auto;">
                        <input type="text" class="form-control input-lg" id="queryName">
                        <span class="input-group-addon btn btn-primary" id="btn_query">搜索</span>
                    </div>
                </div>
                <div class="col-md-6">
                    <button id="btn_add" class="btn-link">添加</button>
                </div>
            </div>

            <div class="row">
                <div style="margin-top: 30px;">
                    <table class="table" style="height: 400px">
                        <thead>
                        <tr>
                            <th>书籍编号</th>
                            <th>书籍名称</th>
                            <th>书籍作者</th>
                            <th>书籍类型</th>
                            <th>书籍详情</th>
                            <th>可借阅数量</th>
                            <th>总数量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <%--书籍从数据库中查询出来，从这个list中遍历出来：foreach--%>
                        <tbody id="bookTable">
                        <c:forEach var="book" items="${pageInfo.list}">
                            <tr style="height: 10px">
                                <td>${book.bookID}</td>
                                <td>${book.bookName}</td>
                                <td>${book.author}</td>
                                <td>${book.typeName}</td>
                                <td>${book.detail}</td>
                                <td>${book.bookCounts}</td>
                                <td>${book.num}</td>
                                <td>
                                    <button id="change" class="btn_change btn-link">修改</button>
                                    &nbsp; | &nbsp;
                                    <button id="delete" class="btn_delete btn-link">删除</button>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>


            <div id="pageInfo" class="row" style="text-align: center">
                当前第${pageInfo.pageNum}页,总共${pageInfo.pages}页，总共有${pageInfo.total}条记录数
            </div>

            <div class="row">
                <nav aria-label="Page navigation" style="text-align: center;">
                    <ul id="pagebar" class="pagination">

                        <li><a onclick="goPage(this)" page_no="1">首页</a></li>
                        <c:if test="${pageInfo.pageNum!=1}">
                            <li>
                                <a onclick="goPage(this)" page_no="${pageInfo.prePage}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum}">
                                <li class="active"><a>${page_Num}</a></li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum}">
                                <li><a onclick="goPage(this)" page_no="${page_Num}">${page_Num}</a></li>
                            </c:if>

                        </c:forEach>

                        <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                            <li>
                                <a onclick="goPage(this)" page_no="${pageInfo.nextPage}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a onclick="goPage(this)" page_no="${pageInfo.pages}">末页</a></li>

                    </ul>
                </nav>
            </div>
        </div>
    </div>

</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel" style="text-align: center">
                    添加图书
                </h4>
            </div>
            <div class="modal-body">
                <form id="addForm">

                    <div class="form-inline" style="text-align: center">
                        <label>书籍名称：</label>
                        <input type="text" class="form-control" id="add_bookName" name="bookName" required autofocus="autofocus">

                    </div>
                    <br/>

                    <div class="form-inline" style="text-align: center">
                        <label>书籍作者：</label>
                        <input type="text" class="form-control" id="add_author" name="author" required>

                    </div>
                    <br/>

                    <div class="form-inline" style="text-align: center">
                        <label>书籍数量：</label>
                        <input type="number" class="form-control" id="add_bookCounts" name="bookCounts" required>

                    </div>
                    <br/>

                    <div class="form-inline" style="text-align: center">
                        <label>书籍描述：</label>
                        <input type="text" id="add_detail" class="form-control" name="detail">
                    </div>
                    <br/>

                    <div class="form-inline" style="text-align: center">
                        <label>书籍类型：</label>
                        <select id="add_typeName" class="combobox" style="width: 200px;height: 30px">

                        </select>
                    </div>

                    <br/>

                </form>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button id="modal_AddSubmit" type="button" class="btn btn-primary" onclick="addBookFun()" style="width:80px">
                    提交添加
                </button>
                <button type="button" class="btn btn-warning" style="width: 80px" data-dismiss="modal">关    闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>

<script>

    //根据输入框内容显示图书列表
    function queryBookFun(requestPageNo) {
        $.get({
            url:"${pageContext.request.contextPath}/book/queryBookByName",
            data:{"bookName":query_info,
                "pageNo":requestPageNo
            },
            success:function (data) {

                //根据返回的数据，渲染表格信息
                tableRender(data);
                //根据返回的数据，渲染分页信息
                pageInfoRender(data);
                //根据返回的数据，渲染分页条信息
                pagebarRender(data);

            }
        });
    }
    
    //查询bookType信息，显示在下拉列表中
    function getBookType() {
        $.ajax({
            url:"${pageContext.request.contextPath}/bookType/getTypeName",
            type:"get",
            success:function (data) {
                // console.log(data);
                let result = $.parseJSON(data);
                // console.log(result);
                $.each(result,function () {
                    var option = $("<option></option>").append(this.typeName).attr("value",this.tid);
                    option.appendTo("#myModal select");
                });
                var s1 = $("#pagebar .active").text();
                // alert("得到的页码为："+s1);
            }
        });
    }
    
    //点击提交添加按钮
    function addBookFun() {

        var addForm = $("#addForm");

        //获取下拉框选中的option
        let options = $("#add_typeName option:selected");
        //获取选中的option的value
        let options_val = options.val();
        //获取选中的option的内容
        let options_text = options.text();

        $.ajax({
            type:"post",
            dataType:"json",
            url:"${pageContext.request.contextPath}/book/authorHasBook",
            data: {
                "author":$("#add_author").val(),
                "bookName":$("#add_bookName").val(),
                "bookCounts":$("#add_bookCounts").val(),
                "detail":$("#add_detail").val(),
                "typeName":options_text,
                "tid":options_val
            },
            success:function (result) {
                console.log(result);
                if(result==101){
                    alert("已添加该图书");
                    $("#addForm").get(0).reset();
                    $("#myModal").modal('hide');

                    //刷新列表显示表格，更新数据
                    queryBookFun($("#pagebar .active").text());

                }else{
                    alert("该作者已经拥有同名图书，请更改图书名称");
                }
            }
        });

    }

    //点击对应页码后跳转
    function goPage(obj) {

        // alert("页码："+$(obj).attr("page_no"));
        // alert("点击页码后找到输入框的值："+query_info);

        //跳转
        $.ajax({
            type: "post",
            url:"${pageContext.request.contextPath}/book/queryBookByName",
            data:{"bookName":query_info,
                "pageNo":$(obj).attr("page_no")
            },
            success:function (data) {

                //设置搜索框内容
                $("#queryName").val(query_info);

                tableRender(data);
                pageInfoRender(data);
                pagebarRender(data);
            }
        })
        
    }

    //渲染表格
    function tableRender(data) {

        let parseJSON = $.parseJSON(data);

        let tabalHtml="";

        for(let i=0;i< parseJSON.list.length;i++){
            tabalHtml +="<tr style=\"height: 10px\">" +
                "<td style=\"height: 10px\">" + parseJSON.list[i].bookID + "</td>" +
                "<td style=\"height: 10px\">" + parseJSON.list[i].bookName + "</td>" +
                "<td style=\"height: 10px\">" + parseJSON.list[i].author + "</td>" +
                "<td style=\"height: 10px\">" + parseJSON.list[i].typeName + "</td>" +
                "<td style=\"height: 10px\">" + parseJSON.list[i].detail + "</td>" +
                "<td style=\"height: 10px\">" + parseJSON.list[i].bookCounts + "</td>" +
                "<td style=\"height: 10px\">" + parseJSON.list[i].num + "</td>" +
                "<td style=\"height: 10px\">" +
                "<button id=\"change\" class=\"btn_change btn-link\">修改</button>" +
                "&nbsp; | &nbsp;" +
                "<button id=\"delete\" class=\"btn_delete btn-link\">删除</button>" +
                "</td>" +
                "</tr>"
        }

        //渲染表格
        $("#bookTable").html(tabalHtml);

    }

    //渲染：当前第xx页,总共xx页，总共有xx条记录数
    function pageInfoRender(data) {

        let parseJSON = $.parseJSON(data);
        let pageInfoHtml="";

        pageInfoHtml += "当前第" + parseJSON.pageNum + "页,总共" + parseJSON.pages + "页，总共有" + parseJSON.total + "条记录数";

        //渲染信息
        $("#pageInfo").html(pageInfoHtml);
    }

    //渲染分页条
    function pagebarRender(data) {

        //将返回的字符串转换为json
        let parseJSON = $.parseJSON(data);

        let pagebarHtml="";

        //拼接“首页”页码
        pagebarHtml +="<li><a onclick=\"goPage(this)\" page_no=" + 1 + ">首页</a></li>";

        //拼接“上一页”
        if(parseJSON.hasPreviousPage){
            pagebarHtml +="<li>" +
                "<a onclick=\"goPage(this)\" page_no=" + parseJSON.prePage + " aria-label=\"Previous\">" +
                "<span aria-hidden=\"true\">&laquo;</span>" +
                "</a>" +
                "</li>";
        }

        //拼接“中间显示页数”页码
        for(var i=0;i<parseJSON.navigatepageNums.length;i++)
        {
            if(parseJSON.navigatepageNums[i] == parseJSON.pageNum){
                pagebarHtml +="<li class=\"active\"><a>" + parseJSON.navigatepageNums[i] + "</a></li>";
            }
            else {
                pagebarHtml +="<li><a class=\"goToPage\" onclick=\"goPage(this)\" page_no=" + parseJSON.navigatepageNums[i]  + ">" + parseJSON.navigatepageNums[i] + "</a></li>";
            }
        }

        //拼接“下一页”页码
        if(parseJSON.hasNextPage){
            pagebarHtml += " <li>" +
                "<a onclick=\"goPage(this)\" page_no=" + parseJSON.nextPage + " aria-label=\"Next\">" +
                "<span aria-hidden=\"true\">&raquo;</span>" +
                "</a>" +
                "</li>";
        }

        //拼接“末页”页码
        pagebarHtml += "<li><a onclick=\"goPage(this)\" page_no=" + parseJSON.pages + ">末页</a></li>";

        //渲染
        $("#pagebar").html(pagebarHtml);

    }
    
</script>

</html>
