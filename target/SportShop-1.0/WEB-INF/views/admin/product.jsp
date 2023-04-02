<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<p>
	<a href='<c:url value = "/admin/product/type/0"></c:url>'>Products</a>
	/ ${ProductTypeName }${SportName }
</p>
<hr>
<table id="example" class="display" style="width: 100%">
	<thead>
		<tr>
			<th>Name</th>
			<th>Type</th>
			<th>Sport type</th>
			<th>Discount</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${listProduct}" var="item" varStatus="index">
			<tr>
				<td><a
					href='<c:url value = "/admin/productDetail/${item.getId()}"></c:url>'>${item.getName()}</a></td>
				<td>${item.getProductType().getName() }</td>
				<td>${item.getSportType().getName() }</td>
				<td>${item.getDiscount()}</td>
				<td><a class="btn btn-success" href='<c:url value = "/admin/importProduct/${item.getId()}"></c:url>'>Import</a> <a class="btn btn-secondary" href='<c:url value = "/admin/exportProduct/${item.getId()}"></c:url>'>Export</a> <button id="deleteProduct" class="btn btn-danger" onclick="deleteThis('${item.getId()}')" >Delete</button></td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<th>Name</th>
			<th>Type</th>
			<th>Sport type</th>
			<th>Discount</th>
			<th>Status</th>
			<th></th>
		</tr>
	</tfoot>
</table>