<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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
					<span>All Products</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="container">
		<!-- Two columns -->
		<div class="row row-table">

			<div id="filter_productList" class="col-md-3 filter-col fixed aside">
				<%@include file="/WEB-INF/views/user/productList_Filter.jsp"%>
			</div>


			<!-- Center column -->
			<div id="product_List" class="col-md-9 aside">
				<%@include file="/WEB-INF/views/user/productListHandling.jsp"%>
			</div>
			<!-- /Center column -->
		</div>
		<div class="ymax"></div>
		<!-- /Two columns -->
	</div>
</main>
<!-- /Page Content -->

<!-- <h1 id="Test">Test</h1>
<button onclick="test()">abc</button> -->



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>













