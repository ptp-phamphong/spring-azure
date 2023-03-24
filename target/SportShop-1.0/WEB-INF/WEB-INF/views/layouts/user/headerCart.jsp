<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!-- minicart content -->
<div class="block block-minicart">
	<div class="minicart-content-wrapper">
		<div class="block-title">
			<span>Recently added item(s)</span>
		</div>
		<a class="btn-minicart-close" title="Close">&#10060;</a>
		<div class="block-content">
			<div class="minicart-items-wrapper overflowed">
				<ol class="minicart-items">

					<c:if test="${sessionScope.curCart.size() == 0}">
						<h1>Nothing in here</h1>
					</c:if>

					<c:if test="${sessionScope.curCart != null }">
						<c:set var="subTotal" value="${0 }"></c:set>
						<!-- Vòng lặp ở đây -->
						<c:forEach var="item" items="${sessionScope.curCart}">
							<li class="item product product-item">
								<div class="product">
									<a class="product-item-photo" href="#" title="Long sleeve overall">
										<span class="product-image-container">
											<span class="product-image-wrapper">
												<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/${item.getProductDetail().getProduct().getImages()[0].getName()}.jpg"></c:url>' alt="Long sleeve overall">
											</span>
										</span>
									</a>
									<div class="product-item-details">
										<div class="product-item-name">
											<a href="#">
												<span style="font-size: 75%">${item.getProductDetail().getProduct().getName() }</span>
											</a>
										</div>
										<div class="product-item-qty">
											<label class="label">Qty</label>
											<input class="item-qty cart-item-qty" maxlength="12" value="${item.getQuantity() }">
											<button class="update-cart-item" style="display: none" title="Update">
												<span>Update</span>
											</button>
										</div>
										<div class="product-item-pricing">
											<div class="price-container">
												<span class="price-wrapper">
													<span class="price-excluding-tax">
														<span class="minicart-price">
															<span class="price" style="font-size: 75%">
																<fmt:formatNumber type="number" value="${item.getPrice()}" />
																<!-- <span style="font-size: 50%">VND</span> -->
															</span>
														</span>
													</span>
												</span>
											</div>
											<div class="product actions">
												<div class="secondary">
													<a href="#" onclick="return removeItemCart(${item.getProductDetail().getId()});" class="action delete" title="Remove item">
														<span>Delete</span>
													</a>
												</div>
												<div class="primary">
													<a class="action edit" href="#" title="Edit item">
														<span>Edit</span>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<c:set var="subTotal" value="${subTotal + item.getPrice() * item.getQuantity() }"></c:set>
						</c:forEach>
						<!-- Kết thúc vòng lặp -->
					</c:if>


				</ol>
			</div>
			<div class="subtotal">
				<span class="label">
					<span>Subtotal</span>
				</span>
				<div class="amount price-container">
					<span class="price-wrapper">
						<span class="price">
							<fmt:formatNumber type="number" value="${subTotal }" />
							<span style="font-size: 50%">VND</span>
						</span>
					</span>
				</div>
			</div>
			<div class="actions">
				<div class="secondary">
					<a href='<c:url value = "/cart" />' class="btn btn-alt">
						<i class="icon icon-cart"></i>
						<span>View and edit cart</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /minicart content -->

