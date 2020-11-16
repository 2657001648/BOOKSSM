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
                    <small>新增书籍</small>
                </h1>
            </div>
        </div>


    </div>

    <div class="col-md-4 column">
        <form action="${pageContext.request.contextPath}/book/addBook" method="post">
            <div class="form-group">
                <label>书籍名称</label>
                <input type="text" class="form-control" name="bookName" required>
            </div>
            <div class="form-group">
                <label>书籍数量</label>
                <input type="text" class="form-control" name="bookCounts" required>
            </div>
            <div class="form-group">
                <label>书籍描述</label>
                <input type="text" class="form-control" name="detail" required>
            </div>

            <div class="form-group">
                <input type="submit" class="form-control" value="添加">
            </div>
        </form>
    </div>

</div>

</body>
</html>
