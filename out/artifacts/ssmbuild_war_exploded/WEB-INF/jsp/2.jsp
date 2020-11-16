<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/common/head.jsp"></jsp:include>

<html>
<head>
    <title>书籍展示</title>
    <script src="/static/JQuery/jquery-3.5.0.js"></script>
    <script>
        $(function () {
            /*使用ajax刷新table*/
            $("#btn_query").click(function () {
                alert("数据为："+$("#queryName").val())
                $.get({
                    url:"${pageContext.request.contextPath}/ajax/queryBook",
                    data:{"bookName":$("#queryName").val()},
                    success:function (data) {
                        alert(data.resultMap.length)

                        var html="";

                        for(let i=0;i< data.resultMap.length;i++){
                            html +="<tr>"+
                                "<td>"+data.resultMap[i].bookID + "</td>" +
                                "<td>"+data.resultMap[i].bookName + "</td>" +
                                "<td>"+data.resultMap[i].bookCounts + "</td>" +
                                "<td>"+data.resultMap[i].detail + "</td>" +
                                "<td>" +
                                "<button id=\"change\" class=\"btn_change\">修改1</button>" +
                                "&nbsp; | &nbsp;" +
                                "<button id=\"delete\" class=\"btn_delete btn-link\">删除</button>" +
                                "</td>" +
                                "</tr>"
                        }
                        $("#bookTable").html(html);
                    }
                })
            });

            /*要使用on函数，要不然ajax刷新后无法加载dom元素*/
            $(document).on('click',".btn_change",function () {
                alert("!!!");
                var getId = $(this).parent().parent().find("td:first").text();
                alert("得到的id为："+getId);
                location.href = "${pageContext.request.contextPath}/book/toUpdateBook?id="+getId;
            });

            $(document).on('click',".btn_delete",function () {
                alert("!!!");
                var getName = $(this).parent().parent().find("td:eq(1)").text();
                alert("得到的name为："+getName);
                if(confirm("你确定要删除【"+getName+"】吗？"))
                {
                    var getId = $(this).parent().parent().find("td:first").text();
                    location.href = "${pageContext.request.contextPath}/book/deleteBook/"+getId;
                }

            });
        });
    </script>

</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 ———— 显示所有书籍</small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增书籍</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">显示全部书籍</a>
            </div>

            <div class="col-md-4 column"></div>

            <div class="col-md-4 column">
                <%--查询书籍--%>
                <form class="form-inline" action="#" method="post" style="float: right">
                    <span style="color: red;font-weight: bold">${error}</span>
                    <input type="text" id="queryName" class="form-control" placeholder="请输入要查询的书籍名称">
                    <input type="button" id="btn_query"  value="查询" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                    <th>操作</th>
                </tr>
                </thead>
                <%--书籍从数据库中查询出来，从这个list中遍历出来：foreach--%>
                <tbody id="bookTable">
                <c:forEach var="book" items="${list}">
                    <tr>
                        <td>${book.bookID}</td>
                        <td>${book.bookName}</td>
                        <td>${book.bookCounts}</td>
                        <td>${book.detail}</td>
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

</div>

</body>
</html>
