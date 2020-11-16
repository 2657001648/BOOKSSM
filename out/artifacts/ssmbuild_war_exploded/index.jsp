<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/common/head.jsp"></jsp:include>
<html>
<head>
  <title>首页</title>

  <style>
    a{
      text-decoration: none;
      color: black;
      font-size: 30px;
    }
    h3{
      width: 180px;
      height: 38px;
      margin: 100px auto;
      text-align: center;
      line-height: 38px;
      background: deepskyblue;
      border-radius: 5px;
    }
  </style>



</head>
<body>

<h3>
  <a href="${pageContext.request.contextPath}/book/allBook">进入书籍页面</a>
  <a href="${pageContext.request.contextPath}/user/goLogin">进入登录界面</a>
</h3>


</body>
</html>
