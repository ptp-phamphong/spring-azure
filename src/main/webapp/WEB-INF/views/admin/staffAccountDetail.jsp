<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<p>
	<a href='<c:url value = "/admin/staffAccountList"></c:url>'>Account
		list</a> / ${Staff.getUsername() }
</p>
<hr>
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<h1>
				<strong>Detail</strong>
			</h1>
			<h8> <Strong>Username:</Strong> ${Staff.getUsername() }</h8>
			<hr>
			<div class="row customerDetail">
				<div class="col-8">
					<p style="font-size: 27px">
						<Strong>Full name:</Strong> ${Staff.getFullName() }
					</p>
					<p style="font-size: 27px">
						<c:if test="${Staff.getGender()}">
							<Strong>Gender:</Strong> Male</c:if>
						<c:if test="${Staff.getGender()==false}">
							<Strong>Gender:</Strong> Female</c:if>
					</p>
					<p style="font-size: 27px">
						<Strong>Phone number:</Strong> ${Staff.getPhoneNumber() }
					</p>
					<p style="font-size: 27px">
						<Strong>Email:</Strong> ${Staff.getEmail() }
					</p>
					<p style="font-size: 27px">
						<Strong>Address:</Strong> ${Staff.getAddress() }
					</p>
					<p style="font-size: 27px">
						<Strong>Status:</Strong>
						<c:if test="${Staff.getStatus()}">
							<strong style="color: #7CFC00">Active</strong>
						</c:if>
						<c:if test="${Staff.getStatus()==false}">
							<strong style="color: red">Negative</strong>
						</c:if>
					</p>
					<hr>
					<c:if test="${Staff.getStatus()}">
						<button id="turnOff" class="btn btn-danger"
							onclick="editStatusAdmin('${Staff.getId()}')">Turn off</button>
					</c:if>
					<c:if test="${Staff.getStatus()==false}">
						<button id="turnOn" class="btn btn-success"
							onclick="editStatusAdmin('${Staff.getId()}')">Turn on</button>
					</c:if>
				</div>
				<div class="col-4">
				<c:if test="${Staff.getGender()}">
							<img src='<c:url value="/assets/themes/img/avatar.jpg"></c:url>'
						width="100%" height="100%" /></c:if>
						<c:if test="${Staff.getGender()==false}">
							<img src='<c:url value="/assets/themes/img/avatar1.jpg"></c:url>'
						width="100%" height="100%" /></c:if>
					
				</div>
			</div>
		</div>
	</div>
</div>
