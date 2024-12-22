<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!-- Main content -->
<div class="content-wrapper">
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">Thêm người mượn sách</h1>
				</div>
			</div>
		</div>
	</div>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<form role="form" method="post" action="${pageContext.request.contextPath}/AddReader">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">Thông tin người mượn sách</h3>
							</div>
							<!-- /.card-header -->
							<div class="row justify-content-center card-body" style="margin-bottom: -34px;">
								<div style="color: red;">${errorString}</div>
							</div>
							<div class="card-body">
								<div class="form-group">
									<label>Họ và tên</label>
									<input type="text" class="form-control" id="name_reader" name="name_reader"
										placeholder="Nhập họ và tên" required="required">
								</div>
								<div class="form-group">
									<label>Số chứng minh nhân dân</label>
									<input type="text" class="form-control" id="identify" name="identify"
										placeholder="Số chứng minh nhân dân" required="required">
								</div>
								<div class="form-group">
									<label>Tên sách</label>
									<select class="form-control select2" style="width: 100%;" name="id_book" required="required">
										<c:forEach items="${bookList}" var="book">
											<option value="${book.getId()}">${book.getName()}</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>Ngày trả sách:</label>
									<div class="input-group date" id="reservationdate" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" id="end_day"
											data-target="#reservationdate" oninput="generateFullName()" required="required"
											name="end_day" />
										<div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-primary">Lưu</button>
								<input type="button" value="Hủy" class="btn btn-primary"
									onclick="location.href='${pageContext.request.contextPath}/ManageReader'">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>

	<!-- jQuery -->
	<script src="Resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="Resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Select2 -->
	<script src="Resources/plugins/select2/js/select2.full.min.js"></script>
	<!-- InputMask -->
	<script src="Resources/plugins/moment/moment.min.js"></script>
	<script src="Resources/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script src="Resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- AdminLTE App -->
	<script src="Resources/js/adminlte.min.js"></script>
	<script>
		$(function() {
			// Initialize Select2 Elements
			$('.select2').select2();
		});
	</script>

	<script type="text/javascript">
		function generateFullName() {
			var dateInput = document.getElementById('end_day').value;
			// Kiểm tra nếu nhập đúng định dạng
			if (dateInput && moment(dateInput, 'MM/DD/YYYY', true).isValid()) {
				var formattedDate = moment(dateInput, 'MM/DD/YYYY').format('DD/MM/YYYY');
				document.getElementById('end_day').value = formattedDate;
			} else {
				alert("Vui lòng nhập ngày đúng định dạng MM/DD/YYYY.");
			}
		}
	</script>
</div>
