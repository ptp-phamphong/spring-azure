<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Page Content -->
<main class="page-main">
	<div class="block">
		<div class="container">
			<ul class="breadcrumbs">
				<li>
					<a href='<c:url value="/"></c:url>'>
						<i class="icon icon-home"></i>
					</a>
				</li>
				<li>
					/
					<a href='<c:url value="/category"></c:url>'>Women</a>
				</li>
				<li>
					/
					<span>${item.getName() }</span>
				</li>

				<c:url value="/${prevProduct.getProductType().getName() }/${prevProduct.getSportType().getName() }/${prevProduct.getId()}/${fn:replace(prevProduct.getName(), '/', '-') }" var="prevURL" />
				<c:url value="/${nextProduct.getProductType().getName() }/${nextProduct.getSportType().getName() }/${nextProduct.getId()}/${fn:replace(nextProduct.getName(), '/', '-') }" var="nextURL" />

				<li class="product-nav">
					<i class="icon icon-angle-left"></i>
					<a href="${fn:replace(prevURL, ' ', '-')}" class="product-nav-prev">
						prev product
						<span class="product-nav-preview">
							<span class="image">
								<img src='<c:url value="/assets/user/images/products/${prevProduct.getImages()[0].getName()}.jpg"></c:url>' alt="">
								<span class="price">
									$100
									<!-- {prevProduct.getPrice() } -->
								</span>
							</span>
							<span class="name">${prevProduct.getName() }</span>
						</span>
					</a>
					/
					<a href=${fn:replace(nextURL, ' ', '-')} class="product-nav-next">
						next product
						<span class="product-nav-preview">
							<span class="image">
								<img src='<c:url value="/assets/user/images/products/${nextProduct.getImages()[0].getName()}.jpg"></c:url>' alt="">
								<span class="price">
									$100
									<%-- ${nextProduct.getPrice() } --%>
								</span>
							</span>
							<span class="name">${nextProduct.getName() }</span>
						</span>
					</a>
					<i class="icon icon-angle-right"></i>
				</li>
			</ul>
		</div>
	</div>
	<div class="block product-block fullwidth full-nopad">
		<div class="container">
			<!-- Product Slider -->
			<div class="product-slider-wrapper">
				<div class="product-creative-slider">

					<!-- Hình ảnh -->
					<c:forEach items="${item.getImages()}" var="imageName" varStatus="indexImage">
						<c:choose>
							<c:when test="${imageName.getName() != '' }">
								<div class="item">
									<img src='<c:url value="/assets/user/images/products/${imageName.getName()}.jpg"></c:url>' class="inner-zoom"
										data-zoom-image='<c:url value="/assets/user/images/products/${imageName.getName()}.jpg"></c:url>' alt="">
								</div>
							</c:when>
							<c:otherwise>
								<div class="item">
									<img src='<c:url value = "/assets/user/images/products/product-creative-2.jpg"></c:url>' class="inner-zoom"
										data-zoom-image='<c:url value = "/assets/user/images/products/large/product-creative-2.jpg"></c:url>' alt="">
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- Hình ảnh -->
				</div>
				<div class="product-creative-slider-control"></div>
				<div class="dblclick-text">
					<span>Double click for enlarge</span>
				</div>
			</div>
			<!-- /Product Slider -->
		</div>
	</div>
	<div class="block product-block fullboxed bg white">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-push-2">
					<div class="product-info-block creative">

						<h1 class="product-name">${item.getName() }</h1>
						<div class="product-meta">
							<span class="product-labels">
								<span class="product-label sale">SALE</span>
								<span class="product-label new">NEW</span>
							</span>
							<span class="availability">
								Availability:
								<b>In stock</b>
							</span>
							<span class="rating">
								<i class="icon icon-star fill"></i>
								<i class="icon icon-star fill"></i>
								<i class="icon icon-star fill"></i>
								<i class="icon icon-star fill"></i>
								<i class="icon icon-star"></i>
								<span class="count">248</span>
							</span>
							<span>
								<a href="#">
									<i class="icon icon-heart"></i>
									Add to wishlist
								</a>
							</span>
							<span class="product-sku">
								SKU:
								<span>Stock Keeping Unit</span>
							</span>

						</div>
						<div class="product-description">
							<p>${item.getDetails() }</p>
						</div>
						<!-- remove class more-options if less than three -->
						<div class="product-options more-options">
							<div class="product-size swatches">
								<span class="option-label">Size:</span>
								<div class="select-wrapper-sm">
									<select class="form-control input-sm size-variants" id="listProductDetails">
										<c:forEach items="${listProductDetails }" var="productDetailsItem">
											<option value="${productDetailsItem.getId()}"></option>
										</c:forEach>
									</select>
								</div>
								<ul class="size-list">
									<c:forEach items="${listProductDetails }" var="productDetailsItem">
										<!-- Hiển thị list size -->
										<li>
											<a data-value='${productDetailsItem.getId()}' onclick="changeSize(${productDetailsItem.getId()}, ${ productDetailsItem.getPrice()})">
												<span class="value">${productDetailsItem.getSize().getName() }</span>
											</a>
										</li>
										<!-- Hiển thị list size -->
									</c:forEach>
								</ul>
							</div>

						</div>
						<div class="product-qty">
							<span class="option-label">Qty:</span>
							<div class="qty qty-changer">
								<fieldset>
									<input type="button" value="&#8210;" class="decrease">
									<input type="text" class="qty-input" value="1" data-min="0" readonly="readonly" id="quantity">
									<input type="button" value="+" class="increase">
								</fieldset>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="product-actions">
							<div class="countdown-circle">
								<div class="countdown-wrapper">
									<div class="countdown" data-promoperiod="604800000"></div>
									<div class="countdown-text">
										<div class="text1">Discount 20% OFF</div>
										<div class="text2">
											Hurry, there are only
											<span>14</span>
											item(s) left!
										</div>
									</div>
								</div>
							</div>
							<div class="actions">
								<div class="price">
									<span>
										$
										<span id="priceOfItem">
											<fmt:formatNumber type="number" value="${listProductDetails.get(0).getPrice()}" />
										</span>
									</span>
								</div>
								<button class="btn add-to-cart" onclick="addToCartInDetail()">
									<i class="icon icon-cart"></i>
									<span>Add to Cart</span>
								</button>
								<a href="#" class="btn product-details">
									<i class="icon icon-external-link"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="block">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<!-- Blog Carousel -->
					<div class="title">
						<h2>Benefits of choosing us</h2>
						<div class="carousel-arrows"></div>
					</div>
					<div class="col-md-6 col-lg-10 hidden-quickview">
						<div class="box-icon-row">
							<div class="box-left-icon-bg">
								<div class="box-icon">
									<i class="icon icon-gift"></i>
								</div>
								<div class="box-text">
									<div class="title">Special offer: 1+2=4</div>
									Get a gift!
								</div>
							</div>
							<div class="box-left-icon-bg">
								<div class="box-icon">
									<i class="icon icon-dollar-bills"></i>
								</div>
								<div class="box-text">
									<div class="title">Free Reward Card</div>
									Worth $10, $50, $100
								</div>
							</div>
							<div class="box-left-icon-bg">
								<div class="box-icon">
									<i class="icon icon-undo"></i>
								</div>
								<div class="box-text">
									<div class="title">Order return</div>
									Returns within 5 days
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- /Page Content -->


<!-- Footer -->
<footer class="page-footer variant2 fullboxed">
	<div class="footer-top">
		<div class="container">
			<!-- newsletter -->
			<div class="newsletter variant2 row">
				<div class="col-sm-3">
					<a href='<c:url value="/"></c:url>' title="Logo">
						<img src='<c:url value="/assets/user/images/logo-footer.png"></c:url>' alt class="img-responsive" />
					</a>
				</div>
				<div class="col-sm-9">
					<!-- input-group -->
					<form action="#">
						<div class="input-group">
							<input type="text" class="form-control">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<i class="icon icon-close-envelope"></i>
								</button>
							</span>
						</div>
					</form>
					<!-- /input-group -->
				</div>
			</div>
			<!-- /newsletter -->
		</div>
	</div>
</footer>
<!-- /Footer -->





<script>
	function changeSize(id, price){
		$('#priceOfItem').html(Intl.NumberFormat('de-DE').format(price));
	}
</script>




