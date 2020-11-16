<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>


<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>My Register Page</title>


<script src="${basePath}/static/JQuery/jquery-3.5.0.js"></script>
<script src="${basePath}/static/JQuery/jquery.form.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${basePath}/static/asset/css/my-login.css">

<body class="my-login-page">
<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-md-center h-100">
            <div class="card-wrapper">
                <div class="brand">
                    <img src="${basePath}/static/asset/img/logo.jpg" alt="bootstrap 4 login page">
                </div>
                <div class="card fat">
                    <div class="card-body">
                        <h4 class="card-title"  align="center">Register</h4>
                        <form id="inputForm">
                            <div class="form-group">
                                <label for="username">Name</label>
                                <input id="username" type="text" class="form-control" name="username" required autofocus>
                                <div class="invalid-feedback">
                                    Username already exists
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email">E-Mail Address</label>
                                <input id="email" type="email" class="form-control" name="email" required>
                                <div class="invalid-feedback" id="email_feed">
                                    Email format error
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input id="password" type="password" class="form-control" name="password" required data-eye>
                                <div class="invalid-feedback">
                                    Password is required
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input id="phone" type="number" class="form-control" name="phone" oninput="if(value.length>11) value=value.slice(0,11)" required>
                                <div class="invalid-feedback">
                                    Phone is required
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="custom-checkbox custom-control">
                                    <input type="checkbox" name="agree" id="agree" class="custom-control-input" required="">
                                    <label for="agree" class="custom-control-label">I agree to the <a href="#">Terms and Conditions</a></label>
                                    <div class="invalid-feedback">
                                        You must agree with our Terms and Conditions
                                    </div>
                                </div>
                            </div>

                            <div class="form-group m-0">
                                <button type="button" id="btn_submit" onclick="ajaxtest()" class="btn btn-primary btn-block">
                                    Register
                                </button>
                            </div>
                            <div class="mt-4 text-center">
                                Already have an account? <a href="${basePath}/user/goLogin">Login</a>
                            </div>
                        </form>

                        <script>
                            function ajaxtest() {
                                var inputForm = $("#inputForm");
                                if(inputForm[0].checkValidity()==false){
                                    event.preventDefault();
                                    event.stopPropagation();
                                    inputForm.addClass("was-validated");
                                }else{
                                    $.ajax({
                                        type:"post",
                                        dataType:"json",
                                        url:"${pageContext.request.contextPath}/user/registerUser2",
                                        data:$("#inputForm").serialize(),
                                        success:function (result) {
                                            console.log(result);
                                            if(result==101){
                                                alert("成功,即将跳转");
                                                window.location.href="${pageContext.request.contextPath}/user/goLogin";
                                                $("#inputForm").resetForm();
                                            }else{
                                                $("#username").val("");
                                                alert("失败");
                                            }
                                        }

                                    });
                                }
                            }
                        </script>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
