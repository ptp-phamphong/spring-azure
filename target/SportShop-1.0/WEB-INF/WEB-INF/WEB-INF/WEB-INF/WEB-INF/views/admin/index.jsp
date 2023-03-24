<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@include file="/WEB-INF/views/layouts/adminLayouts/dashboard2.jsp"%>

<%@include file="/WEB-INF/views/layouts/adminLayouts/dashboard.jsp"%>

<a class="btn btn-primary" href='<c:url value = "/admin/product/type/0"></c:url>'>Manage products</a>

<hr>

<table id="example" class="display" style="width: 100%">
	<thead>
		<tr>
			<th>Name</th>
			<th>Type</th>
			<th>Sport type</th>
			<th>Discount</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${listProduct}" var="item" varStatus="index">
		<tr>
			<td>${item.getName()}</td>
			<td>${item.getProductType().getName() }</td>
			<td>${item.getSportType().getName() }</td>
			<td>${item.getDiscount()}</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<th>Name</th>
			<th>Type</th>
			<th>Sport type</th>
			<th>Discount</th>
		</tr>
	</tfoot>
</table>