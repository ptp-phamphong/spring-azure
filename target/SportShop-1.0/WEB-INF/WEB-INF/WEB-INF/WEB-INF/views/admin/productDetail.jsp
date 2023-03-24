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
	/ ${Product.getName() }
</p>
<hr>
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<h1>
				<strong>Detail</strong>
			</h1>
			<h8>${Product.getName() }</h8>
			<hr>
			<div class="row">
				<div class="col-8">
					<p style="font-size: 27px">
						<Strong>Type:</Strong> ${Product.getProductType().getName() }
					</p>
					<p style="font-size: 27px">
						<Strong>Sport:</Strong> ${Product.getSportType().getName() }
					</p>
					<p style="font-size: 27px">
						<Strong>Description:</Strong> <br> - ${Product.getDetails() }
					</p>
					<p style="font-size: 27px">
						<Strong>Discount:</Strong> ${Product.getDiscount() } %
					</p>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Size</th>
								<th>Price</th>
								<th>Inventory</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ProductDetail}" var="item" varStatus="index">
								<tr>

									<td>${item.getSize().getName() }</td>
									<td>${item.getPrice() }VND</td>
									<td>${item.getInventory() }</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr>
					<a class="btn btn-primary"
						href='<c:url value = "/admin/editproduct/${Product.getId()}"></c:url>'>Edit
						this product</a> <a class="btn btn-success" href='<c:url value = "/admin/importProduct/${Product.getId()}"></c:url>'>Import</a> <a class="btn btn-secondary" href='<c:url value = "/admin/exportProduct/${Product.getId()}"></c:url>'>Export</a>
				</div>
				<div class="col-4">
					<div class="product-img">
						<div class="img-display">
							<div id="mainImg" class="img-showcase">
								<img
									src='<c:url value = "/assets/user/images/products/${MainImage.getName()}.jpg"></c:url>'
									alt="product" />
							</div>
						</div>
						<div class="img-select">
							<c:forEach items="${Images}" var="imageName"
								varStatus="indexImage">
								<div class="img-item">
									<a name="imgItem"
										onclick="changeImage('${imageName.getName()}')" href="#">
										<img
										src='<c:url value = "/assets/user/images/products/${imageName.getName()}.jpg"></c:url>'
										alt="product item" />
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
