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
				<strong>Edit product information</strong>
			</h1>
			<hr>
			<div class="row">
				<div class="col-12">
					<form id="formEditProduct">
						<input type="hidden" value="${Product.getId() }" name="id" id="id" />
						<label for="name"><strong>Product name:</strong></label> <input
							type="text" value="${Product.getName() }" name="name" id="name"
							class="form-control" placeholder="Product name..." /> <br>
						<label for="productType"><strong>Product type:</strong></label> <select
							name="productType" id="productType" class="form-control">
							<option selected="selected"
								value="${Product.getProductType().getId() }">${Product.getProductType().getName() }</option>
							<c:forEach items="${ProductTypeList}" var="item">
								<option value="${item.getId() }">${item.getName() }</option>
							</c:forEach>
						</select> <br> <label for="sportType"><strong>Sport
								type:</strong></label> <select name="sportType" id="sportType"
							class="form-control">
							<option selected="selected"
								value="${Product.getSportType().getId() }">${Product.getSportType().getName() }</option>
							<c:forEach items="${SportTypeList}" var="item">
								<option value="${item.getId() }">${item.getName() }</option>
							</c:forEach>
							<option value="-1">Other</option>
						</select> <br> <label for="other"><strong>Other:</strong></label> <input
							type="text" name="other" id="other" class="form-control"
							placeholder="Sport name..." /> <br> <label for="details"><strong>Description:</strong></label>
						<textarea rows="5" type="text" name="details" id="details"
							class="form-control" placeholder="Description...">${Product.getDetails() }</textarea>
						<br> <label for="discount"><strong>Discount:</strong></label>
						<input type="number" min="0" max="99" value="0" name="discount"
							id="discount" class="form-control" placeholder="Discount..." />

						<br>
						<button id="editProduct" class="btn btn-primary">Edit
							product</button>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>