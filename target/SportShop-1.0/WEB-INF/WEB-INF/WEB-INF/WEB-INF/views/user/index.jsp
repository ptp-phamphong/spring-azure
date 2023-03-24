<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!-- Page -->
<div class="page-wrapper">
	<!-- Journal -->
	<div class="overflow">
		<section class="journal">
			<!-- Logo -->
			<div class="logo-center">
				<a href="#">
					<img src="assets/user/images/logo-white.png" alt="#">
				</a>
			</div>
			<!-- /Logo -->
			<article class="journal-category journal-category-left">
				<div class="journal-category journal-category-inner-left">
					<div class="products-grid product-variant-1">
						<div class="title center">
							<h2>featured products</h2>
						</div>

						<c:forEach var="item" items="${index_featuredProduct }">

							<c:url value="/${item.getProductType().getName() }/${item.getSportType().getName() }/${item.getId() }/${fn:replace(item.getName(), '/', '-') }" var="productURL" />
							<!-- Product Item -->
							<div class="product-item large">
								<div class="product-item-inside">
									<!-- Product Label -->
									<div class="product-item-label label-sale">
										<span>-20%</span>
									</div>
									<!-- /Product Label -->
									<div class="product-item-info">
										<!-- Product Photo -->
										<div class="product-item-photo">
											<a href="${fn:replace(productURL, ' ', '-')}">
												<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/${item.getImages()[0].getName()}.jpg"></c:url>' alt="${item.getName()}">
											</a>
										</div>
										<!-- /Product Photo -->
										<!-- Product Details -->
										<div class="product-item-details">
											<div class="product-item-name">
												<a title="#" href="${fn:replace(productURL, ' ', '-')}" class="product-item-link">${item.getName()}</a>
											</div>
											<div class="product-item-description">CS Night Blue Denim - Light Skim Used</div>
											<div class="price-box">
												<span class="price-container">
													<span class="price-wrapper">
														<%-- <span class="old-price">VND ${item.getProductDetails()[0].getPrice()}</span> --%>
														<span class="special-price">VND ${item.getProductDetails()[0].getPrice()}</span>
													</span>
												</span>
											</div>
											<!-- Product Actions -->
											<div class="product-item-actions">
												<div class="actions-primary">
													<button class="btn btn-sm btn-invert add-to-cart" onclick="addToCart(${item.getId()})">
														<i class="icon icon-cart"></i>
														<span>Add to Cart</span>
													</button>
												</div>
											</div>
											<!-- /Product Actions -->
										</div>
										<!-- /Product Details -->
										<!-- Product Actions -->
										<div class="product-item-actions">
											<div class="actions-secondary">
												<a href='<c:url value="/ajax/quickView/${item.getId() }"/>' title="Quick View" class="quick-view-link quick-view-btn">
													<i class="icon icon-eye"></i>
													<span>Quick View</span>
												</a>
											</div>
										</div>
										<!-- /Product Actions -->
									</div>
								</div>
							</div>
							<!-- /Product Item -->
						</c:forEach>
					</div>
				</div>
				<div class="journal-category journal-category-inner">
					<div class="toggle-panel">
						<i class="icon icon-angle-left"></i>
					</div>
					<div class="toggle-panel-mobile">
						<span class="show-icon">
							<i class="icon icon-dots-three-horizontal"></i>
						</span>
						<span class="close-icon">
							<i class="icon icon-close"></i>
						</span>
					</div>
					<div class="irregular-grid">

						<c:forEach var="item" items="${index_listProduct }" begin="0" end="1" varStatus="index">
							<c:url value="/${item.getProductType().getName() }/${item.getSportType().getName() }/${item.getId() }/${fn:replace(item.getName(), '/', '-') }" var="productURL" />
							<div class="product-preview">
								<div class="product-photo">
									<a href="${fn:replace(productURL, ' ', '-')}" class="product-link">
										<img src='<c:url value = "/assets/user/images/products/${item.getImages()[0].getName()}.jpg"></c:url>' alt="${item.getName()}">
									</a>
								</div>
								<div class="product-details">
									<a href="${fn:replace(productURL, ' ', '-')}" class="product-name" style="font-size: 100%">${item.getName()}</a>
									<div class="price-box">
										<span class="price-container">
											<span class="price-wrapper">
												<span class="special-price">VND ${item.getProductDetails()[0].getPrice()}</span>
												<!-- <span class="old-price">$290.00</span> -->
											</span>
										</span>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</article>
			<article class="journal-category journal-category-right">
				<div class="journal-category journal-category-inner">
					<div class="toggle-panel">
						<i class="icon icon-angle-right"></i>
					</div>
					<div class="toggle-panel-mobile">
						<span class="show-icon">
							<i class="icon icon-dots-three-horizontal"></i>
						</span>
						<span class="close-icon">
							<i class="icon icon-close"></i>
						</span>
					</div>
					<div class="irregular-grid">

						<c:forEach var="item" items="${index_listProduct }" begin="2" end="3" varStatus="index">
							<c:url value="/${item.getProductType().getName() }/${item.getSportType().getName() }/${item.getId() }/${fn:replace(item.getName(), '/', '-') }" var="productURL" />
							<div class="product-preview">
								<div class="product-photo">
									<a href="${fn:replace(productURL, ' ', '-')}" class="product-link">
										<img src='<c:url value = "/assets/user/images/products/${item.getImages()[0].getName()}.jpg"></c:url>' alt="${item.getName()}">
									</a>
								</div>
								<div class="product-details">
									<a href="${fn:replace(productURL, ' ', '-')}" class="product-name" style="font-size: 100%">${item.getName()}</a>
									<div class="price-box">
										<span class="price-container">
											<span class="price-wrapper">
												<span class="special-price">VND ${item.getProductDetails()[0].getPrice()}</span>
												<!-- <span class="old-price">$290.00</span> -->
											</span>
										</span>
									</div>
								</div>
							</div>
						</c:forEach>


					</div>
				</div>
				<div class="journal-category journal-category-inner-right">
					<div class="products-grid product-variant-1">
						<div class="title center">
							<h2>newest products</h2>
						</div>
						<c:forEach var="item" items="${index_newestProduct }">

							<c:url value="/${item.getProductType().getName() }/${item.getSportType().getName() }/${item.getId() }/${fn:replace(item.getName(), '/', '-') }" var="productURL" />
							<!-- Product Item -->
							<div class="product-item large">
								<div class="product-item-inside">
									<!-- Product Label -->
									<div class="product-item-label label-sale">
										<span>-20%</span>
									</div>
									<!-- /Product Label -->
									<div class="product-item-info">
										<!-- Product Photo -->
										<div class="product-item-photo">
											<a href="${fn:replace(productURL, ' ', '-')}">
												<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/${item.getImages()[0].getName()}.jpg"></c:url>' alt="${item.getName()}">
											</a>
										</div>
										<!-- /Product Photo -->
										<!-- Product Details -->
										<div class="product-item-details">
											<div class="product-item-name">
												<a title="#" href="${fn:replace(productURL, ' ', '-')}" class="product-item-link">${item.getName()}</a>
											</div>
											<div class="product-item-description">CS Night Blue Denim - Light Skim Used</div>
											<div class="price-box">
												<span class="price-container">
													<span class="price-wrapper">
														<%-- <span class="old-price">VND ${item.getProductDetails()[0].getPrice()}</span> --%>
														<span class="special-price">$${item.getProductDetails()[0].getPrice()}</span>
													</span>
												</span>
											</div>
											<!-- Product Actions -->
											<div class="product-item-actions">
												<div class="actions-primary">
													<button class="btn btn-sm btn-invert add-to-cart" onclick="addToCart(${item.getId()})">
														<i class="icon icon-cart"></i>
														<span>Add to Cart</span>
													</button>
												</div>
											</div>
											<!-- /Product Actions -->
										</div>
										<!-- /Product Details -->
										<!-- Product Actions -->
										<div class="product-item-actions">
											<div class="actions-secondary">
												<a href='<c:url value="/ajax/quickView/${item.getId() }"/>' title="Quick View" class="quick-view-link quick-view-btn">
													<i class="icon icon-eye"></i>
													<span>Quick View</span>
												</a>
											</div>
										</div>
										<!-- /Product Actions -->
									</div>
								</div>
							</div>
							<!-- /Product Item -->
						</c:forEach>
					</div>
				</div>
			</article>
		</section>
	</div>
	<!-- /Journal -->

	<!-- Page Content -->
</div>

<a class="back-to-top back-to-top-mobile" href="#">
	<i class="icon icon-angle-up"></i>
	To Top
</a>







