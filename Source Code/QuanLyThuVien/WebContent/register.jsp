<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!-- Main content -->
<div class="content-wrapper" >
    <!-- Content Header -->
    <div class="content-header">
   
    </div>

 <!-- Content Section -->
<section class="content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-4"> <!-- Giảm từ col-md-6 xuống col-md-4 để thu nhỏ form -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Đăng ký tài khoản</h3>
                    </div>
                    <!-- Form start -->
                    <form role="form" action="${pageContext.request.contextPath}/Register" method="post">
                        <!-- Display error message if any -->
                        <div class="row justify-content-center card-body">
                            <div style="color: red;">${errorString}</div>
                        </div>

                        <div class="card-body" style="padding: 15px;"> <!-- Giảm padding -->
                            <div class="form-group">
                                <label for="exampleInputName">Họ và Tên</label>
                                <input type="text" class="form-control" name="fullName" placeholder="Nhập họ và tên" required="required">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputUsername1">Tên đăng nhập</label>
                                <input type="text" class="form-control" name="username" placeholder="Nhập tên đăng nhập" required="required">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Mật khẩu</label>
                                <input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Nhập mật khẩu" required="required">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword2">Xác nhận mật khẩu</label>
                                <input type="password" class="form-control" name="confirmPassword" id="exampleInputPassword2" placeholder="Xác nhận mật khẩu" required="required">
                            </div>
                        </div>

                        <!-- /.card-body -->
                        <div class="card-footer" style="text-align: center; border: none; background: transparent;">
                            <button type="submit" class="btn btn-primary" style="border: 2px solid black; background-color: red; color: black; margin-right: 10px;">Register</button>
                            <a href="${pageContext.request.contextPath}/Login" class="btn btn-secondary" style="border: 2px solid black; background-color: red; color: black; margin-left: 10px;">Đã có tài khoản? Đăng nhập</a>
                        </div>
                        <%@ include file="footer.jsp"%>
                    </form>
                </div>
            </div>
        </div>
        
    </div>
</section>



