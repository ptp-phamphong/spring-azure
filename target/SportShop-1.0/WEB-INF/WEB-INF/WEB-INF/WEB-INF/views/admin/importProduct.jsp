<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<p>
	<a href='<c:url value = "/admin/product/type/0"></c:url>'>Products</a>
	/ <a
		href='<c:url value = "/admin/product/type/${Product.getProductType().getId() }"></c:url>'>${Product.getProductType().getName() }</a>
	/ <a
		href='<c:url value = "/admin/product/sport/${Product.getSportType().getId() }"></c:url>'>${Product.getSportType().getName() }</a>
	/ <a
		href='<c:url value = "/admin/productDetail/${Product.getId()}"></c:url>'>${Product.getName() }</a>
	/ Import
</p>
<hr>
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<h1>
				<strong>Import</strong>
			</h1>
			<h8>${Product.getName() }</h8>
			<hr>
			<div class="row">
				<div class="col-12">
					<h8> <strong>Product type:</strong></h8>
					<h8>${Product.getProductType().getName() }</h8>
					<br>
					<h8> <strong>For:</strong></h8>
					<h8>${Product.getSportType().getName() }</h8>
					<br> <strong>Description:</strong>
					</h8>
					<br>
					<h8>${Product.getDetails() }</h8>
					<hr>
					<form id="formImportProduct">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Size</th>
									<th>Price</th>
									<th>Import</th>
								</tr>
							</thead>
							<tbody id="details">
								<div class="imports">
								<c:forEach items="${ProductDetail}" var="item" varStatus="index">
									<tr>

										<td>${item.getSize().getName() }</td>
										<td>${item.getPrice() }VND</td>
										<td><input type="hidden" value="${item.getId() }"
											name="id" id="id" /> <input type="number" value="0"
											name="import" id="import" min="0" class="form-control"
											placeholder="Import..." /></td>

									</tr>
								</c:forEach>
								</div>
							</tbody>
						</table>
						<button id="importProduct" class="btn btn-primary">Save</button>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>