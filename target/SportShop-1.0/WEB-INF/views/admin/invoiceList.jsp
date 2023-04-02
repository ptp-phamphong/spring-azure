<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<p>List of invoice</p>
<hr>
<table id="example" class="display" style="width: 100%">
	<thead>
		<tr>
			<th>Customer account</th>
			<th>Date create</th>
			<th>Total</th>
			<th>Status</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${invoiceList}" var="item" varStatus="index">
			<tr>
				<td>${item.getCustomer().getEmail() }</td>
				<td>${item.getCreateDate() }</td>
				<td>${item.getTotalPrice() }</td>
				<c:if test="${item.getStaff().getUsername()!=null}">
					<td style="color: red">Processed</td>
				</c:if>
				<c:if test="${item.getStaff().getUsername()==null}">
					<td style="color: #D6DBDF">${item.getStaff().getUsername()}</td>
				</c:if>
				<td><a class="btn btn-success"
					href='<c:url value = "/admin/invoiceDetail/${item.getId()}"></c:url>'>Detail</a>
					<button id="deleteAccount" class="btn btn-danger"
						onclick="deleteInvoice('${item.getId()}')">Delete</button></td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<th>Customer account</th>
			<th>Date create</th>
			<th>Total</th>
			<th>Status</th>
			<th></th>
		</tr>
	</tfoot>
</table>