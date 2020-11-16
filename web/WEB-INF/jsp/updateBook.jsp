<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/common/head.jsp"></jsp:include>
<html>
<head>
    <title>添加书籍</title>

</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>


    </div>

    <div class="col-md-4 column">
        <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
            <%--如果修改书籍失败，初次考虑是事务问题，但是配置完事务后，依旧失败--%>
            <%--可以去检查下SQL语句是否执行成功，若不成功，则查看是否漏了参数没有传过去--%>
            <%--前端传递隐藏域--%>
            <input type="hidden" class="form-control" name="bookID" value="${result.bookID}" required>

            <div class="form-group">
                <label>书籍名称</label>
                <input type="text" class="form-control" name="bookName" value="${result.bookName}" required>
            </div>
            <div class="form-group">
                <label>书籍数量</label>
                <input type="text" class="form-control" name="bookCounts" value="${result.bookCounts}" required>
            </div>
            <div class="form-group">
                <label>书籍描述</label>
                <input type="text" class="form-control" name="detail" value="${result.detail}" required>
            </div>

            <div class="form-group">
                <input type="submit" class="form-control" value="修改">
            </div>
        </form>
    </div>

</div>

</body>
</html>
