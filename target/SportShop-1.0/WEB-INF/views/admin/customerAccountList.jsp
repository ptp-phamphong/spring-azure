<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<p>List of customer account</p>
<hr>
<table id="example" class="display" style="width: 100%">
	<thead>
		<tr>
			<th>Full name</th>
			<th>Email</th>
			<th>Phone number</th>
			<th>Status</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${accountList}" var="item" varStatus="index">
			<tr>
				<td>${item.getFullName() }</td>
				<td>${item.getEmail() }</td>
				<td>${item.getPhoneNumber() }</td>
				<td><c:if test="${item.getStatus()}">
						<p style="color: #7CFC00">Active</p>
					</c:if> <c:if test="${item.getStatus()==false}">
						<p style="color: red">Negative</p>
					</c:if></td>
				<td><a class="btn btn-success"
					href='<c:url value = "/admin/customerDetail/${item.getId()}"></c:url>'>Detail</a>
					<c:if test="${item.getStatus()}">
						<button class="btn btn-secondary">Delete</button>
					</c:if> <c:if test="${item.getStatus()==false}">
						<button id="deleteAccount" class="btn btn-danger"
							onclick="deleteAccountAdmin('${item.getId()}')">Delete</button>
					</c:if></td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<th>Full name</th>
			<th>Email</th>
			<th>Phone number</th>
			<th>Status</th>
			<th></th>
		</tr>
	</tfoot>
</table>