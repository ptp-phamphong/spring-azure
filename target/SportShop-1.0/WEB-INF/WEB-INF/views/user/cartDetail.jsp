<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <c:choose>
	<c:when test="${not empty currentCustomer }"><!-- Nếu đã đăng nhập --> --%>
<c:choose>
	<c:when test="${sessionScope.curCart.size() > 0}">
		<!-- Nếu có gì đó trong giỏ hàng, xử lý ở cái when này -->
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
							<span>Shopping Cart</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="block">
				<div class="container">
					<div class="cart-table">
						<div class="table-header">
							<div class="photo">Product Image</div>
							<div class="name">Product Name</div>
							<div class="price">Unit Price</div>
							<div class="qty">Qty</div>
							<div class="subtotal">Subtotal</div>
							<div class="remove">
								<span class="hidden-sm hidden-xs">Remove</span>
							</div>
						</div>

						<c:set var="subTotal" value="${0 }"></c:set>
						<c:forEach var="item" items="${sessionScope.curCart}">
							<div class="table-row">
								<div class="photo">

									<a href='<c:url value="/category/product"></c:url>'>
										<img src='<c:url value = "/assets/user/images/products/${item.getProductDetail().getProduct().getImages()[0].getName()}.jpg"></c:url>' alt="">
									</a>
								</div>
								<div class="name">
									<a href='<c:url value="/category/product"></c:url>'>${item.getProductDetail().getProduct().getName()}</a>

								</div>
								<div class="price">
									<fmt:formatNumber type="number" value="${item.getPrice()}" />
									<span style="font-size: 50%">VND</span>
								</div>
								<div class="qty qty-changer">
									<fieldset>
										<input type="button" value="&#8210;" onclick="decrease(${item.getProductDetail().getId()})">
										<input type="text" class="qty-input" value="${item.getQuantity() }" data-min="1" data-max="20" readonly="readonly">
										<input type="button" value="+" onclick="increase(${item.getProductDetail().getId()})">
									</fieldset>
								</div>
								<div class="subtotal">
									<fmt:formatNumber type="number" value="${item.getPrice() * item.getQuantity() }" />
									<span style="font-size: 50%">VND</span>
									<c:set var="subTotal" value="${subTotal + item.getPrice() * item.getQuantity() }"></c:set>
								</div>
								<div class="remove">
									<a href="#" class="icon icon-close-2" onclick="removeItemCart(${item.getProductDetail().getId()});"></a>
								</div>
							</div>
						</c:forEach>
						<div class="table-footer">
							<button onclick="location.href='<c:url value="/all-product"/>'" class="btn btn-alt">CONTINUE SHOPPING</button>
							<button onclick="clearAllCart()" class="btn btn-alt pull-right">
								<i class="icon icon-bin"></i>
								<span>Clear Shopping Cart</span>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 total-wrapper">
							<table class="total-price">
								<tr>
									<td>Subtotal</td>
									<td>
										<fmt:formatNumber type="number" value="${subTotal }" />
										<span style="font-size: 50%">VND</span>
									</td>
								</tr>
								<!-- <tr>
									<td>Discount</td>
									<td>$12.00</td>
								</tr> -->
								<tr class="total">
									<td>Grand Total</td>
									<td>
										<fmt:formatNumber type="number" value="${subTotal }" />
										<span style="font-size: 50%">VND</span>
									</td>
								</tr>
							</table>
							<div class="cart-action">
								<div>
									<c:if test="${not empty sessionScope.currentCustomer}">
										<a href="checkOutHandelling">
											<button class="btn">Checkout</button>
										</a>
									</c:if>
									<c:if test="${empty sessionScope.currentCustomer}">
										<a href="login">
											<button class="btn">Please Login To Checkout</button>
										</a>
									</c:if>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-5"></div>
						<div class="col-sm-6 col-md-4">
							<h2>Discount Codes</h2>
							<form class="white" action="#">
								<label>Enter your coupon code if you have one.</label>
								<input type="text" class="form-control dashed">
								<div>
									<button class="btn btn-alt">Apply Coupon</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</main>
		<!-- /Page Content -->
	</c:when>
	<c:otherwise>
		<main class="page-main">
			<div class="block empty-cart">
				<div class="container">
					<div class="image-empty-cart">
						<img src='<c:url value="/assets/user/images/empty-basket.png"></c:url>' alt="">
						<div class="text-empty-cart-1">SHOPPING CART IS</div>
						<div class="text-empty-cart-2">EMPTY</div>
					</div>
					<div>
						<a href='<c:url value="/all-product"/>'" class="btn">back to previous page</a>
					</div>
				</div>
			</div>
		</main>
	</c:otherwise>
</c:choose>

<%-- </c:when>
	<c:otherwise>
		<main class="page-main">
			<div class="block empty-cart">
				<div class="container">
					<div class="image-empty-cart">
						<img src='<c:url value="/assets/user/images/empty-basket.png"></c:url>' alt="">
						<div class="text-empty-cart-1">Please Login</div>
						<div class="text-empty-cart-2">Sorry</div>
					</div>
					<div>
						<a href='<c:url value="/login"></c:url>' class="btn">Login</a>
						<a href='<c:url value="/all-product"></c:url>' class="btn btn-invert">Continue shopping</a>
					</div>

				</div>
			</div>
		</main>
	</c:otherwise>
</c:choose> --%>







