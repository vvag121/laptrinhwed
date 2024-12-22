<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!-- Main content -->
<div class="content-wrapper">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary" style="margin-top: 12px;">
                        <div class="card-header" style="background-color: #007bff; color: white;">
                            <h3 class="card-title">Hướng dẫn sử dụng trang web</h3>
                        </div>
                        <div style="margin-top: 12px; margin-left: 12px;">
                            <%
                                if (request.getSession().getAttribute("User") == null) {
                            %>
                            <p>
                                &nbsp;- Muốn sử dụng trang web này thì đầu tiên bạn cần <b>
                                    <a href="${pageContext.request.contextPath}/Login" style="color: #007bff;">đăng
                                    nhập.</a>
                                </b>. Tên tài khoản: <b>nobita</b>, Mật khẩu: <b>doraemon</b>.
                            </p>
                            <%
                                } else {
                            %>
                            <p>&nbsp;Cảm ơn bạn đã đăng nhập, bây giờ bạn có thể sử dụng trang web.</p>
                            <%
                                }
                            %>
                            <p>- Các chức năng của trang web là quản lý sách và quản lý mượn sách</p>

                            <p><b>I. Quản lý sách.</b></p>
                            <p>- Muốn xem danh sách trong thư viện chọn <b>Quản lý sách -> Danh sách.</b></p>
                            <p>- Trong mục danh sách:</p>
                            <ol>
                                <li>Muốn tìm kiếm sách trong danh sách thì gõ vào ô Tìm kiếm và nhấn enter.</li>
                                <li>Muốn chỉnh sửa thông tin sách thì chọn <b>Chỉnh sửa</b> -> Chỉnh sửa những thông tin cần thiết -> Nhấn <b>Lưu</b> hoặc <b>Hủy</b> để trở lại.</li>
                                <li>Muốn xóa sách thì chọn nút <b>Xóa</b> tương ứng.</li>
                                <li>Muốn xóa tất cả sách thì chọn nút <b>Xóa tất cả</b>.</li>
                            </ol>
                            <p>- Muốn thêm sách thì chọn <b>Quản lý sách -> Thêm sách</b> và điền các thông tin cần thiết.</p>
                            <p>- Muốn xem thể loại sách thì chọn <b>Quản lý sách -> Thể loại.</b></p>

                            <p><b>II. Quản lý mượn sách.</b></p>
                            <p>- Muốn thêm người mượn thì chọn <b>Quản lý mượn sách -> Thêm người mượn sách.</b></p>
                            <p>- Muốn xem danh sách mượn sách thì chọn <b>Quản lý mượn sách -> Danh sách đang mượn.</b></p>
                            <p>- Trong mục này, bạn có thể tìm kiếm và xác nhận sách đã trả hay chưa.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<%@ include file="footer.jsp"%>
