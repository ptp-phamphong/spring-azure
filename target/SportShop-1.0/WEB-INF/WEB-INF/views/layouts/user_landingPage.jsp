<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>



<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SEIKO eCommerce HTML 5 Template</title>
<meta name="author" content="BigSteps">
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="assets/user/images/favicon.ico">

<!-- Vendor -->
<link href='<c:url value = "/assets/user/js/vendor/bootstrap/bootstrap.min.css"/>' rel="stylesheet">
<link href='<c:url value = "/assets/user/js/vendor/slick/slick.css"/>' rel="stylesheet">
<link href='<c:url value = "/assets/user/js/vendor/swiper/swiper.min.css"/>' rel="stylesheet">
<link href='<c:url value = "/assets/user/js/vendor/magnificpopup/dist/magnific-popup.css"/>' rel="stylesheet">
<link href='<c:url value = "/assets/user/js/vendor/nouislider/nouislider.css"/>' rel="stylesheet">
<link href='<c:url value = "/assets/user/js/vendor/darktooltip/dist/darktooltip.css"/>' rel="stylesheet">
<link href='<c:url value = "/assets/user/css/animate.css"/>' rel="stylesheet">

<!-- Custom -->
<link href='<c:url value = "/assets/user/css/style.css"/>' rel="stylesheet" />
<link href='<c:url value = "/assets/user/css/megamenu.css"/>' rel="stylesheet">

<!-- Color Schemes -->
<!-- your style-color.css here  -->

<!-- Icon Font -->
<link href='<c:url value = "/assets/user/fonts/icomoon-reg/style.css"/>' rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,700|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Roboto:300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">

</head>
<!-- header -->



<body class="fullwidth no-rtl fly_to_cart">
	<!-- Loader -->
	<div id="loader-wrapper">
		<div class="cube-wrapper">
			<div class="cube-folding">
				<span class="leaf1"></span>
				<span class="leaf2"></span>
				<span class="leaf3"></span>
				<span class="leaf4"></span>
			</div>
		</div>
	</div>
	<!-- /Loader -->
	<!-- Menu Toggle -->
	<a href="#" class="toggleHeader">
		<span class="close-icon">
			<i class="icon icon-close"></i>
		</span>
		<span class="open-icon">
			<i class="icon icon-menu"></i>
		</span>
	</a>
	<!-- /Menu Toggle -->
	<!-- Header -->
	<header class="page-header fullboxed variant-3 dark">
		<div class="navbar">
			<div class="container">
				<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>
			</div>
		</div>
	</header>
	<!-- /Header -->

	<decorator:body />
	
	<div class="productStack disable hide_on_scroll">
		<a href="#" class="toggleStack">
			<i class="icon icon-cart"></i>
			(${sessionScope.curCart.size() }) items
		</a>
		<div id="productstack" class="productstack-content">
			<%@include file="/WEB-INF/views/user/productStack.jsp"%>
		</div>
	</div>

	<!-- Modal Quick View -->
	<div class="modal quick-view zoom" id="quickView">
		<div class="modal-dialog">
			<div class="modalLoader-wrapper">
				<div class="modalLoader bg-striped"></div>
			</div>
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">&#10006;</button>
			</div>
			<div class="modal-content">
				<iframe></iframe>
			</div>
		</div>
	</div>
	<!--function location: quickView app.js -->
	<!-- /Modal Quick View -->

</body>


<!-- jQuery Scripts  -->
<script src='<c:url value = "/assets/user/js/user/myScript.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/jquery/jquery.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/bootstrap/bootstrap.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/swiper/swiper.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/slick/slick.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/parallax/parallax.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/isotope/isotope.pkgd.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/magnificpopup/dist/jquery.magnific-popup.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/countdown/jquery.countdown.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/nouislider/nouislider.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/ez-plus/jquery.ez-plus.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/tocca/tocca.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/bootstrap-tabcollapse/bootstrap-tabcollapse.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/scrollLock/jquery-scrollLock.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/darktooltip/dist/jquery.darktooltip.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/imagesloaded/imagesloaded.pkgd.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/vendor/instafeed/instafeed.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/megamenu.min.js"/>'></script>
<script src='<c:url value = "/assets/user/js/app.js"/>'></script>
</html>





