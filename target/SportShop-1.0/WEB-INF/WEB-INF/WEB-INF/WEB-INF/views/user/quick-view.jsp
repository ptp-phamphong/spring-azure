<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SEIKO eCommerce HTML 5 Template</title>
<meta name="author" content="BigSteps">
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="favicon.ico">

<!-- Vendor -->
<link href='<c:url value="/assets/user/js/vendor/bootstrap/bootstrap.min.css"/>' rel="stylesheet">
<link href='<c:url value="/assets/user/js/vendor/slick/slick.css"/>' rel="stylesheet">
<link href='<c:url value="/assets/user/js/vendor/magnificpopup/dist/magnific-popup.css"/>' rel="stylesheet">
<link href='<c:url value="/assets/user/js/vendor/darktooltip/dist/darktooltip.css"/>' rel="stylesheet">
<link href='<c:url value="/assets/user/css/animate.css"/>' rel="stylesheet">

<!-- Custom -->
<link href='<c:url value="/assets/user/css/style.css"/>' rel="stylesheet">

<!-- Icon Font -->
<link href='<c:url value="/assets/user/fonts/icomoon-reg/style.css"/>' rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,700|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Roboto:300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">

</head>

<body class="quickview">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-5">
				<!-- Product Gallery -->
				<div class="main-image">
					<img src='<c:url value="/assets/user/images/products/${product.getImages()[0].getName()}.jpg"/>' class="zoom" alt=""
						data-zoom-image=<c:url value="/assets/user/images/products/${product.getImages()[0].getName()}.jpg"/> ' />
					<div class="dblclick-text">
						<span>Double click for enlarge</span>
					</div>
				</div>
				<div class="product-previews-wrapper">
					<div class="product-previews-carousel" id="previewsGallery">
						<c:forEach items="${product.getImages()}" var="imageName" varStatus="indexImage">
							<a href="#" data-image='<c:url value="/assets/user/images/products/${imageName.getName()}.jpg"/>'>
								<img src='<c:url value="/assets/user/images/products/${imageName.getName()}.jpg"/>' alt="" />
							</a>
						</c:forEach>
					</div>
				</div>
				<!-- /Product Gallery -->
			</div>
			<div class="col-sm-7">
				<div class="product-info-block classic">
					<div class="product-info-top">
						<div class="product-sku">
							SKU:
							<span>Stock Keeping Unit</span>
						</div>
						<div class="rating">
							<i class="icon icon-star fill"></i>
							<i class="icon icon-star fill"></i>
							<i class="icon icon-star fill"></i>
							<i class="icon icon-star fill"></i>
							<i class="icon icon-star"></i>
							<span class="count">248 reviews</span>
						</div>
					</div>
					<div class="product-name-wrapper">
						<h1 class="product-name">${product.getName() }</h1>
						<div class="product-labels">
							<span class="product-label new">NEW</span>
						</div>
					</div>
					<div class="product-availability">
						Availability:
						<span>In stock</span>
					</div>
					<div class="product-description">
						<p>${product.getDetails() }</p>
					</div>
					<div class="product-options">
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
										<a data-value='${productDetailsItem.getId()}' onclick="changeSizeinQuickView(${productDetailsItem.getId()}, ${ productDetailsItem.getPrice()})">
											<span class="value">${productDetailsItem.getSize().getName() }</span>
										</a>
									</li>
									<!-- Hiển thị list size -->
								</c:forEach>
							</ul>
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
					</div>
					<div class="product-actions">
						<div class="row">
							<div class="col-md-6">
								<div class="product-meta">
									<span>
										<a href="#">
											<i class="icon icon-heart"></i>
											Add to wishlist
										</a>
									</span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="price">
									<span class="special-price">
										
										<span id="priceOfItem">
											<fmt:formatNumber type="number" value="${listProductDetails[0].getPrice()}" />
										</span>
										<span style="font-size: 50%">VND</span>
									</span>
								</div>
								<div class="actions">
									<button class="btn btn-lg add-to-cart" onclick="addToCartInDetail()" data-toggle="modal" data-target="#modal2">
										<i class="icon icon-cart"></i>
										<span>Add to Cart</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Error -->
	<div class="modal modal-countdown fade zoom info error" data-interval="0" id="modal2">
		<div class="modal-dialog">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">&#10006;</button>
			</div>
			<div class="modal-content">
				<div class="modal-body">
					<div class="text-center">
						<div class="icon-info"><i class="icon icon-check-square"></i></div>
						<p>Added to cart successfully!</p>
					</div>
					<div class="modal-countdown">Window will close in <b class="count"></b> sec</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /Modal Error -->
	
</body>




<script>
	function changeSizeinQuickView(id, price){
		$('#priceOfItem').html(Intl.NumberFormat('de-DE').format(price));
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='<c:url value = "/assets/user/js/user/myScript.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/jquery/jquery.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/bootstrap/bootstrap.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/swiper/swiper.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/slick/slick.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/parallax/parallax.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/isotope/isotope.pkgd.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/magnificpopup/dist/jquery.magnific-popup.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/countdown/jquery.countdown.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/nouislider/nouislider.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/ez-plus/jquery.ez-plus.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/tocca/tocca.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/bootstrap-tabcollapse/bootstrap-tabcollapse.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/scrollLock/jquery-scrollLock.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/darktooltip/dist/jquery.darktooltip.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/imagesloaded/imagesloaded.pkgd.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/vendor/instafeed/instafeed.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/megamenu.min.js"></c:url>'></script>
<script src='<c:url value = "/assets/user/js/app.js"></c:url>'></script>
</body>

</html>