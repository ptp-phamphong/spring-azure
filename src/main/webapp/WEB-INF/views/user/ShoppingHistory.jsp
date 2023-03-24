<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<h1>Đây là lịch sử mua hàng</h1>
<div class="container mt-5">
	<div class="d-flex justify-content-center row">
		<div class="col-md-8">
			<div class="p-3 bg-white rounded">
				<div class="row"></div>
				<div class="mt-3">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>Id</th>
									<th>Date</th>
									<th>Customer Name</th>
									<th>Total Price</th>
									<th>Details</th>
								</tr>
							</thead>
							<tbody>

								<!-- vòng for ở đây -->
								<c:forEach var="item" items="${listInvoice }">
									<tr>
										<td>${item.getId() }</td>
										<td><fmt:formatDate value="${item.getCreateDate()}"
												pattern="dd-MM-yyyy" /></td>
										<td>${item.getCustomer().getFullName() }</td>
										<td><fmt:formatNumber type="number"
												value="${item.getTotalPrice() }" /> VNĐ</td>
										<td><button class="btn btn-primary" data-toggle="modal"
												data-target="#${item.getId()}">Details</button></td>
									</tr>
								</c:forEach>
								<!-- Kết thúc vòng for -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- Model các chi tiết hóa đơn -->
<!-- Modal -->
<c:forEach items="${listInvoice }" var="item">
	<div class="modal fade" id="${item.getId()}" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Invoice
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th>Image</th>
								<th>Product</th>
								<th>Unit</th>
								<th>Quantity</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="details" items="${item.getInvoiceDetails()}">
								<tr>
									<td>
										<div class="photo">
											<img style="display: block;" height="80px" width="80px"
												src='<c:url value = "/assets/user/images/products/${details.getProductDetail().getProduct().getImages()[0].getName()}.jpg"></c:url>'
												alt="">
										</div>
									</td>

									<td>${details.getProductDetail().getProduct().getName()}</td>
									<td><fmt:formatNumber type="number"
											value="${details.getUnit()}" /> VNĐ</td>
									<td>${details.getQuantity() }</td>
									<td><fmt:formatNumber type="number"
											value="${details.getQuantity() *  details.getUnit()}" /> VNĐ</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
