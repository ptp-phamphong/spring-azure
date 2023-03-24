<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="products-list-wrapper">
	<ul class="products-list">
		<c:if test="${sessionScope.curCart.size() == 0}">
			<h1>Nothing in here</h1>
		</c:if>
		<c:if test="${sessionScope.curCart != null }">
			<c:set var="subTotal" value="${0 }"></c:set>
			<!-- Vòng lặp ở đây -->
			<c:forEach var="item" items="${sessionScope.curCart}">
				<c:set var="subTotal" value="${subTotal + item.getPrice() * item.getQuantity() }"></c:set>
				<li>
					<a href="#" title="${item.getProductDetail().getProduct().getName() }">
						<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/${item.getProductDetail().getProduct().getImages()[0].getName()}.jpg"></c:url>' alt="">
					</a>
					<span class="item-qty">${item.getQuantity() } </span>
					<div class="actions">
						<a href="#" class="action edit" title="Edit item">
							<i class="icon icon-pencil"></i>
						</a>
						<a class="action delete" onclick="return removeItemCart(${item.getProductDetail().getId()});" href="#" title="Delete item">
							<i class="icon icon-trash-alt"></i>
						</a>
						<div class="edit-qty">
							<input type="number" value="${item.getQuantity() }">
							<button type="button" class="btn">Apply</button>
						</div>
					</div>
				</li>
			</c:forEach>
		</c:if>
	</ul>
</div>

<div class="action-cart">
	<button type="button" class="btn" title="Go to Cart" onclick="location.href='<c:url value="/cart"/>'">
		<span>Go to Cart</span>
	</button>
</div>
<div class="total-cart">
	<div class="items-total">
		Items
		<span class="count">${sessionScope.curCart.size() }</span>
	</div>
	<div class="subtotal">
		Subtotal
		<span class="price">
			<fmt:formatNumber type="number" value="${subTotal}" />
			<span style="font-size: 50%">VND</span>
		</span>
	</div>
</div>
