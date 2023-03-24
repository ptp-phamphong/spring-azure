<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Filter Row -->
<div class="filter-row">
	<div class="row">
		<div class="col-xs-8 col-sm-7 col-lg-5 col-left">
			<div class="filter-button">
				<a href="#" class="btn filter-col-toggle">
					<i class="icon icon-filter"></i>
					<span>FILTER</span>
				</a>
			</div>
			<div class="form-label">Sort by:</div>
			<div class="select-wrapper-sm">
				<select class="form-control input-sm">
					<option value="featured">Featured</option>
					<option value="rating">Rating</option>
					<option value="price">Price</option>
				</select>
			</div>
			<div class="directions">
				<a href="#">
					<i class="icon icon-arrow-down"></i>
				</a>
				<a href="#">
					<i class="icon icon-arrow-up"></i>
				</a>
			</div>
		</div>
		<div class="col-sm-2 col-lg-2 hidden-xs">
			<div class="view-mode">
				<a href="#" class="grid-view">
					<i class="icon icon-th"></i>
				</a>
				<a href="#" class="list-view">
					<i class="icon icon-th-list"></i>
				</a>
			</div>
		</div>
		<div class="col-xs-4 col-sm-3 col-lg-5 col-right">
			<div class="form-label">Show:</div>
			<div class="select-wrapper-sm">
				<select class="form-control input-sm">
					<option value="featured">12</option>
					<option value="rating">36</option>
					<option value="price">100</option>
				</select>
			</div>
		</div>
	</div>
	<div class="bg-striped"></div>
</div>
<!-- /Filter Row -->
<!-- Total -->
<div class="items-total">Items 1 to 15 of 28 total</div>
<!-- /Total -->

<!-- Products Grid -->
<div class="products-grid three-in-row product-variant-5">
	<c:forEach items="${listProduct}" var="item" varStatus="index">
		<!-- Vòng lặp ở đây -->
		<!-- Product Item -->
		<div class="product-item large category2" id="Product${index.index+1 }" style="display: none;">
			<div class="product-item-inside">
				<div class="product-item-info">
					<!-- Product Photo -->
					<div class="product-item-photo">
						<!-- Product Label -->
						<div class="product-item-label label-sale">
							<span>${index.index + 1 }</span>
						</div>
						<!-- /Product Label -->
						<div class="product-item-gallery">
							<!-- product main photo -->

							<c:url value="/${item.getProductType().getName() }/${item.getSportType().getName() }/${item.getId() }/${fn:replace(item.getName(), '/', '-') }" var="productURL" />


							<!-- Mấy tấm hình ở đây  -->
							<!-- product inside carousel -->
							<div class="carousel-inside slide" data-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<c:forEach items="${item.getImages()}" var="imageName" varStatus="indexImage">
										<c:if test="${indexImage.index == 0 }">
											<c:set var="div_class" value="item active" />
										</c:if>
										<c:if test="${indexImage.index != 0 }">
											<c:set var="div_class" value="item" />

										</c:if>
										<div class="${div_class }">
											<a href="${fn:replace(productURL, ' ', '-')}">
												<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/${imageName.getName()}.jpg"></c:url>' alt="${imageName.getName()}">
											</a>
										</div>
									</c:forEach>
								</div>
								<a class="carousel-control next"></a>
								<a class="carousel-control prev"></a>
							</div>
							<!-- /product inside carousel -->
							<!-- Xong mấy tấm hình -->

							<a href='<c:url value="/ajax/quickView/${item.getId() }"/>' title="Quick View" class="quick-view-link quick-view-btn">
								<i class="icon icon-eye"></i>
								<span>Quick View</span>
							</a>
							<!-- /product main photo  -->
						</div>
						<!-- Product Actions -->
						<!-- Product Actions -->
						<a href="#" title="Add to Wishlist" class="no_wishlist">
							<i class="icon icon-heart"></i>
							<span>Add to Wishlist</span>
						</a>
						<!-- /Product Actions -->
					</div>
					<!-- /Product Photo -->
					<!-- Product Details -->
					<div class="product-item-details">
						<div class="product-item-name">
							<a href="${fn:replace(productURL, ' ', '-')}" class="product-item-link">${item.getName() }</a>
						</div>
						<div class="price-box">
							<span class="price-container">
								<span class="price-wrapper">
									<span class="special-price"><fmt:formatNumber type="number" value="${item.getProductDetails()[0].getPrice() }" /> <span style="font-size: 50%">VND</span></span>
								</span>
							</span>
						</div>
						<div class="product-item-rating">
							<i class="icon icon-star-fill"></i>
							<i class="icon icon-star-fill"></i>
							<i class="icon icon-star-fill"></i>
							<i class="icon icon-star-fill"></i>
							<i class="icon icon-star-fill"></i>
						</div>
						<button class="btn add-to-cart" onclick="addToCart(${item.getId()})">
							<i class="icon icon-cart"></i>
							<span>Add to Cart</span>
						</button>
					</div>
					<!-- /Product Details -->
				</div>
			</div>
		</div>
		<!-- /Product Item -->
		<!-- Kết thúc Vòng lặp-->
	</c:forEach>
</div>
<!-- Cái này dùng để biết là có bao nhiêu sản phẩm, đéo hiểu sao dùng dưới js format lại nó cứ lỗi hoài, đcm cs luôn  -->
<input type="hidden" id="numberProduct" value="${listProduct.size() }">


<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center" id="pagination">
	</ul>
</nav>
<!-- Hết danh sách rồi đm trang xong -->

<!--có 1 cái input hidden ở đây để biết đang ở trang nào-->
<input type="hidden" id="currentPage" value="1">


<!-- /Products Grid -->


<script>
//Định nghĩa mỗi trang có bao nhiêu sản phẩm
var numPerPage = 9;


//Lấy ra số lượng sản phẩm trong db 
var numberProduct = document.getElementById("numberProduct").value;

//Lấy ra tổng số trang
var numPage = 0;
if (numberProduct % numPerPage == 0) {
	numPage = numberProduct / numPerPage;
} else {
	numPage = Math.floor(numberProduct / numPerPage) + 1;
}
//Okay lấy ra được tổng số trang

//Giờ phải in ra cái danh sách trang, cái đống html hiển thị đó
document.getElementById("pagination").innerHTML += "<li class='page-item'><button class='page-link' onclick='changePage("
	+ 0 + ")'>Previous</button></li>";
for (var i = 1; i <= numPage; i++) {
	document.getElementById("pagination").innerHTML += "<li class='page-item'><button id='pag"
		+ i
		+ "' class='page-link' onclick='changePage("
		+ i
		+ ")'>"
		+ i + "</button></li>";
}
document.getElementById("pagination").innerHTML += "<li class='page-item'><button class='page-link' onclick='changePage("
	+ (parseInt(numPage) + 1) + ")'>Next</button></li>";
//In dell gì nhìn dài thế thôi mà kệ đi

function changePage(pageTo) {
	var currentPage = document.getElementById("currentPage").value;

	//Mặc định là trang trước là 0, trang kế thì là trang cuối cùng
	if (pageTo == (parseInt(numPage) + 1)) {
		if (currentPage == numPage) {
			return;
		}
		//Trường hợp còn lại thì pageTo = currentPage + 1
		pageTo = parseInt(currentPage) + 1;
	}

	if (pageTo == 0) { //Hiển thị trước đó hoặc là trang đầu tiên
		if (currentPage == 1) {//Nếu đã là trang đầu thì bỏ thôi, ko cần làm gì cả
			return;
		}
		//Trường hợp còn lại thì pageTo = currentPage - 1
		pageTo = currentPage - 1;
	}

	//Xóa màu cho cái trang cũ
	document.getElementById("pag" + currentPage).style.backgroundColor = "";

	//Đầu tiên chuyển cái page current thành page to
	document.getElementById("currentPage").value = pageTo;

	//Tô màu cho cái ô hiển thị số trang active
	document.getElementById("pag" + pageTo).style.backgroundColor = "yellow";

	//ẩn đi những sản phẩm ở trang trước đó
	for (var i = ((currentPage - 1) * numPerPage + 1); i <= currentPage
		* numPerPage; i++) {
		if (document.getElementById("Product" + i)) {
			document.getElementById("Product" + i).style.display = "none";
		}
	}
	//Hiện lên những sản phẩm ở trang muốn đến
	for (var i = ((pageTo - 1) * numPerPage + 1); i <= pageTo * numPerPage; i++) {
		document.getElementById("Product" + i).style.display = "";
	}//Lưu ý, từ đây xuống sẽ bị lỗi đấy đm

	//Mặc định là trang trước là 0, trang kế thì là trang cuối cùng
	if (pageTo == (parseInt(numPage) + 1)) {
		if (currentPage == numPage) {
			return;
		}
		//Trường hợp còn lại thì pageTo = currentPage + 1
		pageTo = parseInt(currentPage) + 1;
	}

	if (pageTo == 0) { //Hiển thị trước đó hoặc là trang đầu tiên
		if (currentPage == 1) {//Nếu đã là trang đầu thì bỏ thôi, ko cần làm gì cả
			return;
		}
		//Trường hợp còn lại thì pageTo = currentPage - 1
		pageTo = currentPage - 1;
	}

	//Xóa màu cho cái trang cũ
	document.getElementById("pag" + currentPage).style.backgroundColor = "";

	//Đầu tiên chuyển cái page current thành page to
	document.getElementById("currentPage").value = pageTo;

	//Tô màu cho cái ô hiển thị số trang active
	document.getElementById("pag" + pageTo).style.backgroundColor = "yellow";

	//ẩn đi những sản phẩm ở trang trước đó
	for (var i = ((currentPage - 1) * numPerPage + 1); i <= currentPage
		* numPerPage; i++) {
		if (document.getElementById("Product" + i)) {
			document.getElementById("Product" + i).style.display = "none";
		}
	}
	//Hiện lên những sản phẩm ở trang muốn đến
	for (var i = ((pageTo - 1) * numPerPage + 1); i <= pageTo * numPerPage; i++) {
		document.getElementById("Product" + i).style.display = "";
	}//Lưu ý, từ đây xuống sẽ bị lỗi đấy đm

	//Xong rồi, ez vl
}


changePage(1);

//Lúc mới vào thì xử lý cái số trang trước.
/* window.onload = function() {
	changePage(1);
}; */
</script>
