<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<p>
	<a href='<c:url value = "/admin/customerList"></c:url>'>Account
		list</a> / ${Customer.getEmail() }
</p>
<hr>
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<h1>
				<strong>Detail</strong>
			</h1>
			<h8> <Strong>Email:</Strong> ${Customer.getEmail() }</h8>
			<hr>
			<div class="row customerDetail">
				<div class="col-8">
					<p style="font-size: 27px">
						<Strong>Full name:</Strong> ${Customer.getFullName() }
					</p>
					<p style="font-size: 27px">
						<Strong>Phone number:</Strong> ${Customer.getPhoneNumber() }
					</p>
					<p style="font-size: 27px">
						<Strong>Address:</Strong> ${Customer.getAddress() }
					</p>
					<p style="font-size: 27px">
						<Strong>Status:</Strong>
						<c:if test="${Customer.getStatus()}">
							<strong style="color: #7CFC00">Active</strong>
						</c:if>
						<c:if test="${Customer.getStatus()==false}">
							<strong style="color: red">Negative</strong>
						</c:if>
					</p>
					<hr>
					<c:if test="${Customer.getStatus()}">
						<button id="turnOff" class="btn btn-danger" onclick="editStatus('${Customer.getId()}')" >Turn off</button>
					</c:if>
					<c:if test="${Customer.getStatus()==false}">
						<button id="turnOn" class="btn btn-success" onclick="editStatus('${Customer.getId()}')">Turn on</button>
					</c:if>
				</div>
				<div class="col-4">
					<img src='<c:url value="/assets/themes/img/user.jpg"></c:url>'
						width="100%" height="100%" />
				</div>
			</div>
		</div>
	</div>
</div>
