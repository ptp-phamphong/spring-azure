<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<h1>
				<strong>Detail</strong>
			</h1>
			<h8> <strong>Date:</strong> ${invoice.getCreateDate() }</h8>
			<hr>
			<div class="row invoiceDetail">
				<div class="col-12">
					<p style="font-size: 27px">
						<Strong>Customer name:</Strong>
						${invoice.getCustomer().getFullName() }
					</p>
					<p style="font-size: 27px">
						<Strong>Customer account:</Strong>
						${invoice.getCustomer().getEmail() }
					</p>
					<p style="font-size: 27px">
						<Strong>Follower:</Strong>
						<c:if test="${invoice.getStaff().getUsername()==null}"> No follower</c:if>
						<c:if test="${invoice.getStaff().getUsername()!=null}"> ${invoice.getStaff().getUsername()}</c:if>
					</p>
					<p style="font-size: 27px">
						<Strong>Total price:</Strong> ${invoice.getTotalPrice() } VNĐ
					</p>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Product Code</th>
								<th>Quantity</th>
								<th>Price</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${InvoiceDetail}" var="item" varStatus="index">
								<tr>

									<td>PRODUCT${item.getProductDetail().getId() }</td>
									<td>${item.getQuantity() }</td>
									<td>${item.getUnit() }VND</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr>
					<c:if test="${invoice.getStaff().getUsername()==null}">
						<button id="turnOn" class="btn btn-danger"
							onclick="process('${invoice.getId()}','${currentStaff.getId() }')">Process</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
