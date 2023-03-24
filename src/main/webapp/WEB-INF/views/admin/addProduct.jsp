<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<p>
	<a href='<c:url value = "/admin/product/type/0"></c:url>'>Products</a>
	/ Add new product
</p>
<hr>
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<h1>
				<strong>Add new product</strong>
			</h1>
			<hr>
			<div class="row">
				<div class="col-12">
					<form id="formAddProduct">
						<label for="name"><strong>Product name:</strong></label> <input
							type="text" name="name" id="name" class="form-control"
							placeholder="Product name..." /> <br> <label
							for="productType"><strong>Product type:</strong></label> <select
							name="productType" id="productType" class="form-control">
							<c:forEach items="${ProductTypeList}" var="item">
								<option value="${item.getId() }">${item.getName() }</option>
							</c:forEach>
						</select> <br> <label for="sportType"><strong>Sport
								type:</strong></label> <select name="sportType" id="sportType"
							class="form-control">
							<c:forEach items="${SportTypeList}" var="item">
								<option value="${item.getId() }">${item.getName() }</option>
							</c:forEach>
							<option value="-1">Other</option>
						</select> <br> <label for="other"><strong>Other:</strong></label> <input
							type="text" name="other" id="other" class="form-control"
							placeholder="Sport name..." /> <br> <label for="details"><strong>Description:</strong></label>
						<textarea rows="5" type="text" name="details" id="details"
							class="form-control" placeholder="Description..."></textarea>
						<br> <label for="discount"><strong>Discount:</strong></label>
						<input type="number" min="0" max="99" value="0" name="discount"
							id="discount" class="form-control" placeholder="Discount..." />
						<br>

						<div id="containerImage">
							<div class="Images">
								<label for="image"><strong>Image 1:</strong></label> <input
									type="file" name="image" id="image" class="form-control img" />
							</div>
							<div class="Images">
								<label for="image1"><strong>Image 2:</strong></label> <input
									type="file" name="image" id="image1" class="form-control img" />
							</div>
							<div class="Images">
								<label for="image2"><strong>Image 3:</strong></label> <input
									type="file" name="image" id="image2" class="form-control img" />
							</div>
							<br>
						</div>

						<div id="containerDetail">
							<div class="ProductDetails">
								<h3>
									<strong>Details:</strong>
								</h3>
								<hr>
								<label for="size"><strong>Size:</strong></label> <select
									name="size" id="size" class="form-control">
									<c:forEach items="${SizeList}" var="item">
										<option value="${item.getId() }">${item.getName() }</option>
									</c:forEach>
								</select> <br> <label for="price"><strong>Price:</strong></label> <input
									type="number" min="1000" value="1000" name="price" id="price"
									class="form-control" placeholder="Price..." /> <br> <label
									for="inventory"><strong>Inventory:</strong></label> <input
									type="number" min="1" value="1" name="inventory" id="inventory"
									class="form-control" placeholder="Inventory..." /> <br>
								<button class="btn btn-primary more">More detail</button>
							</div>
						</div>

						<div id="ProductDetails" class="ProductDetails">
							<h4>
								<strong>New detail:</strong>
							</h4>
							<hr>
							<label for="size"><strong>Size:</strong></label> <select
								name="size" id="size" class="form-control">
								<c:forEach items="${SizeList}" var="item">
									<option value="${item.getId() }">${item.getName() }</option>
								</c:forEach>
							</select> <br> <label for="price"><strong>Price:</strong></label> <input
								type="number" min="1000" value="1000" name="price" id="price"
								class="form-control" placeholder="Price..." /> <br> <label
								for="inventory"><strong>Inventory:</strong></label> <input
								type="number" min="1" value="1" name="inventory" id="inventory"
								class="form-control" placeholder="Inventory..." /> <br>
							<button class="btn btn-primary more">More detail</button>
							<br>
						</div>

						<br>
						<button id="addProduct" class="btn btn-primary">Add</button>
					</form>

				</div>
			</div>
		</div>
	</div>
	<br>
</div>