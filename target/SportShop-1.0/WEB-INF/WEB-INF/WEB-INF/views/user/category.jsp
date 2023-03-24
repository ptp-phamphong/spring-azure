<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
					<span>WOMEN’S</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="container">
		<!-- Two columns -->
		<div class="row row-table">
			<!-- Left column -->
			<div class="col-md-3 filter-col fixed aside">
				<div class="filter-container">
					<div class="fstart"></div>
					<div class="fixed-wrapper">
						<div class="fixed-scroll">
							<div class="filter-col-header">
								<div class="title">Filters</div>
								<a href="#" class="filter-col-toggle"></a>
							</div>
							<div class="filter-col-content">
								<div class="sidebar-block-top">
									<h2>Shoping By</h2>
									<ul class="selected-filters">
										<li>
											<a href="#">
												<span>Shoes</span>
												<span class="remove">
													<i class="icon icon-close"></i>
												</span>
											</a>
											<div class="bg-striped"></div>
										</li>
										<li>
											<a href="#">
												<span>$10-30$</span>
												<span class="remove">
													<i class="icon icon-close"></i>
												</span>
											</a>
											<div class="bg-striped"></div>
										</li>
										<li>
											<a href="#">
												<span>Size 36</span>
												<span class="remove">
													<i class="icon icon-close"></i>
												</span>
											</a>
											<div class="bg-striped"></div>
										</li>
									</ul>
								</div>
								<div class="sidebar-block collapsed">
									<div class="block-title">
										<span>Sports</span>
										<div class="toggle-arrow"></div>
									</div>
									<div class="block-content">
										<ul class="category-list">
											<li class="active">
												<a href="#" class="value">Football</a>
												<a href="#" class="clear"></a>
											</li>
											<li>
												<a href="#">Running</a>
												<a href="#" class="clear"></a>
											</li>
											<li>
												<a href="#">Badminton</a>
												<a href="#" class="clear"></a>
											</li>
											<li>
												<a href="#">Swimming</a>
												<a href="#" class="clear"></a>
											</li>
											<li>
												<a href="#">Bicyle</a>
												<a href="#" class="clear"></a>
											</li>
										</ul>
										<div class="bg-striped"></div>
									</div>
								</div>

								<div class="sidebar-block collapsed">
									<div class="block-title">
										<span>Types</span>
										<div class="toggle-arrow"></div>
									</div>
									<div class="block-content">
										<ul class="category-list">
											<li class="active">
												<a href="#" class="value">Footwear</a>
												<a href="#" class="clear"></a>
											</li>
											<li>
												<a href="#">Tops</a>
												<a href="#" class="clear"></a>
											</li>
											<li>
												<a href="#">Bottoms</a>
												<a href="#" class="clear"></a>
											</li>
											<li>
												<a href="#">Swimwear</a>
												<a href="#" class="clear"></a>
											</li>
										</ul>
										<div class="bg-striped"></div>
									</div>
								</div>
								<div class="sidebar-block collapsed">
									<div class="block-title">
										<span>Price</span>
										<div class="toggle-arrow"></div>
									</div>
									<div class="block-content">
										<ul class="category-list">
											<li>
												<a href="#">$10-$30</a>
												<a href="#" class="clear"></a>
											</li>
											<li class="active">
												<a href="#">$30-$60</a>
												<a href="#" class="clear"></a>
											</li>
											<li>
												<a href="#">$60-$120</a>
												<a href="#" class="clear"></a>
											</li>
										</ul>
										<div class="price-slider-wrapper">
											<div class="price-values">
												<div class="pull-left">
													$
													<span id="priceMin"></span>
												</div>
												<div class="pull-right">
													$
													<span id="priceMax"></span>
												</div>
											</div>
											<div id="priceSlider" class="price-slider"></div>
										</div>
										<div class="bg-striped"></div>
									</div>
								</div>
								<div class="sidebar-block collapsed">
									<div class="block-title">
										<span>Size</span>
										<div class="toggle-arrow"></div>
									</div>
									<div class="block-content">
										<ul class="size-list">
											<li class="active">
												<a href="#">
													<span class="clear"></span>
													<span class="value">38</span>
												</a>
											</li>
											<li>
												<a href="#">
													<span class="clear"></span>
													<span class="value">38</span>
												</a>
											</li>
											<li>
												<a href="#">
													<span class="clear"></span>
													<span class="value">40</span>
												</a>
											</li>
											<li>
												<a href="#">
													<span class="clear"></span>
													<span class="value">42</span>
												</a>
											</li>
										</ul>
										<div class="bg-striped"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="fend"></div>
				</div>
			</div>
			<!-- /Left column -->
			<!-- Center column -->
			<div class="col-md-9 aside">
				<!-- Page Title -->
				<div class="page-title">
					<div class="title center">
						<h1>WOMEN’S</h1>
					</div>
				</div>
				<!-- /Page Title -->
				<!-- Categories Info -->
				<div class="info-block">
					<p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
						laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet conse ctetur
						adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui.</p>
				</div>
				<!-- Categories Info -->
				<!-- Categories -->
				<div class="categories">
					<div class="row">
						<div class="col-xs-6 col-sm-3">
							<a href="#" class="category-block">
								<div class="category-image">
									<img src='<c:url value="/assets/user/images/category/category-img-01.jpg"></c:url>' alt="#">
								</div>
								<div class="category-title">Dresses</div>
							</a>
						</div>
						<div class="col-xs-6 col-sm-3">
							<a href="#" class="category-block">
								<div class="category-image">
									<img src='<c:url value = "/assets/user/images/category/category-img-02.jpg"></c:url>' alt="#">
								</div>
								<div class="category-title">Jackets</div>
							</a>
						</div>
						<div class="col-xs-6 col-sm-3">
							<a href="#" class="category-block">
								<div class="category-image">
									<img src='<c:url value = "/assets/user/images/category/category-img-03.jpg"></c:url>' alt="#">
								</div>
								<div class="category-title">Trousers</div>
							</a>
						</div>
						<div class="col-xs-6 col-sm-3">
							<a href="#" class="category-block">
								<div class="category-image">
									<img src='<c:url value = "/assets/user/images/category/category-img-04.jpg"></c:url>' alt="#">
								</div>
								<div class="category-title">T-shirts</div>
							</a>
						</div>
					</div>
				</div>
				<!-- /Categories -->
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
					<!-- Product Item -->
					<div class="product-item large colorvariants category2">
						<div class="product-item-inside">
							<div class="product-item-info">
								<!-- Product Photo -->
								<div class="product-item-photo">
									<!-- Product Label -->
									<div class="product-item-label label-sale">
										<span>-20%</span>
									</div>
									<!-- /Product Label -->
									<!-- product main photo -->
									<!-- product inside carousel -->
									<div class="carousel-inside slide" data-ride="carousel">
										<div class="carousel-inner" role="listbox">
											<div class="item active">
												<a href='<c:url value="/category/product"></c:url>'>
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-20.jpg"></c:url>' alt="">
												</a>
											</div>
											<div class="item">
												<a href='<c:url value="/category/product"></c:url>'>
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-20-1.jpg"></c:url>' alt="">
												</a>
											</div>
											<div class="item">
												<a href='<c:url value="/category/product"></c:url>'>
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-20-2.jpg"></c:url>' alt="">
												</a>
											</div>
										</div>
										<a class="carousel-control next"></a>
										<a class="carousel-control prev"></a>
									</div>
									<!-- /product inside carousel -->
									<a href="quick-view.html" title="Quick View" class="quick-view-link quick-view-btn">
										<i class="icon icon-eye"></i>
										<span>Quick View</span>
									</a>
									<!-- /product main photo  -->
									<div class="countdown-box hidden-xs">
										<div class="countdown-wrapper">
											<div class="countdown-title">special price expires in</div>
											<div class="countdown" data-promodate="2021/12/04"></div>
										</div>
									</div>
									<!-- Product Actions -->
									<a href="#" title="Add to Wishlist" class="wishlist active">
										<i class="icon icon-heart"></i>
										<span>Add to Wishlist</span>
									</a>
								</div>
								<!-- /Product Photo -->
								<!-- Product Details -->
								<div class="product-item-details">
									<div class="product-item-name">
										<a title="Long sleeve overall" href='<c:url value="/category/product"></c:url>' class="product-item-link">Long sleeve overall</a>
									</div>
									<div class="product-item-description">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia nonkdni numquam eius modi tempora incidunt
										ut labore</div>
									<div class="price-box">
										<span class="price-container">
											<span class="price-wrapper">
												<span class="old-price">$190.00</span>
												<span class="special-price">$149.00</span>
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
									<button class="btn add-to-cart" data-product="789123">
										<i class="icon icon-cart"></i>
										<span>Add to Cart</span>
									</button>
								</div>
								<!-- /Product Details -->
							</div>
						</div>
					</div>
					<!-- /Product Item -->
					<!-- Product Item -->
					<div class="product-item large category1">
						<div class="product-item-inside">
							<div class="product-item-info">
								<!-- Product Photo -->
								<div class="product-item-photo">
									<!-- Product Label -->
									<div class="product-item-label label-new">
										<span>New</span>
									</div>
									<!-- /Product Label -->
									<!-- product main photo -->
									<!-- product inside carousel -->
									<div class="carousel-inside slide" data-ride="carousel">
										<div class="carousel-inner" role="listbox">
											<div class="item active">
												<a href="#">
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-20.jpg"></c:url>' alt="">
												</a>
											</div>
											<div class="item">
												<a href="#">
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-20-1.jpg"></c:url>' alt="">
												</a>
											</div>
											<div class="item">
												<a href="#">
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-20-2.jpg"></c:url>' alt="">
												</a>
											</div>
										</div>
										<a class="carousel-control next"></a>
										<a class="carousel-control prev"></a>
									</div>
									<!-- /product inside carousel -->
									<a href="quick-view.html" title="Quick View" class="quick-view-link quick-view-btn">
										<i class="icon icon-eye"></i>
										<span>Quick View</span>
									</a>
									<!-- /product main photo  -->
									<!-- Product Actions -->
									<a href="#" title="Add to Wishlist" class="no_wishlist">
										<i class="icon icon-heart"></i>
										<span>Add to Wishlist</span>
									</a>
									<div class="product-item-actions">
										<div class="share-button toBottom">
											<span class="toggle"></span>
											<ul class="social-list">
												<li>
													<a href="#" class="icon icon-google google"></a>
												</li>
												<li>
													<a href="#" class="icon icon-fancy fancy"></a>
												</li>
												<li>
													<a href="#" class="icon icon-pinterest pinterest"></a>
												</li>
												<li>
													<a href="#" class="icon icon-twitter-logo twitter"></a>
												</li>
												<li>
													<a href="#" class="icon icon-facebook-logo facebook"></a>
												</li>
											</ul>
										</div>
									</div>
									<!-- /Product Actions -->
								</div>
								<!-- /Product Photo -->
								<!-- Product Details -->
								<div class="product-item-details">
									<div class="product-item-name">
										<a title="Lace back mini dress" href="product.html" class="product-item-link">Lace back mini dress</a>
									</div>
									<div class="product-item-description">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia nonkdni numquam eius modi tempora incidunt
										ut labore</div>
									<div class="price-box">
										<span class="price-container">
											<span class="price-wrapper">
												<span class="price">$239.00</span>
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
									<button class="btn add-to-cart" data-product="789123">
										<i class="icon icon-cart"></i>
										<span>Add to Cart</span>
									</button>
								</div>
								<!-- /Product Details -->
							</div>
						</div>
					</div>
					<!-- /Product Item -->
					<!-- Product Item -->
					<div class="product-item large category2">
						<div class="product-item-inside">
							<div class="product-item-info">
								<!-- Product Photo -->
								<div class="product-item-photo">
									<!-- Product Label -->
									<div class="product-item-label label-sale">
										<span>-20%</span>
									</div>
									<!-- /Product Label -->
									<div class="product-item-gallery">
										<!-- product main photo -->
										<!-- product inside carousel -->
										<div class="carousel-inside slide" data-ride="carousel">
											<div class="carousel-inner" role="listbox">
												<div class="item active">
													<a href="#">
														<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-26.jpg"></c:url>' alt="">
													</a>
												</div>
												<div class="item">
													<a href="#">
														<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-26-1.jpg"></c:url>' alt="">
													</a>
												</div>
												<div class="item">
													<a href="#">
														<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-26-2.jpg"></c:url>' alt="">
													</a>
												</div>
											</div>
											<a class="carousel-control next"></a>
											<a class="carousel-control prev"></a>
										</div>
										<!-- /product inside carousel -->
										<a href="quick-view.html" title="Quick View" class="quick-view-link quick-view-btn">
											<i class="icon icon-eye"></i>
											<span>Quick View</span>
										</a>
										<!-- /product main photo  -->
									</div>
									<div class="countdown-box hidden-xs">
										<div class="countdown-wrapper">
											<div class="countdown-title">special price expires in</div>
											<div class="countdown" data-promoperiod="100000000"></div>
										</div>
									</div>
									<!-- Product Actions -->
									<!-- Product Actions -->
									<a href="#" title="Add to Wishlist" class="no_wishlist">
										<i class="icon icon-heart"></i>
										<span>Add to Wishlist</span>
									</a>
									<div class="product-item-actions">
										<div class="share-button toBottom">
											<span class="toggle"></span>
											<ul class="social-list">
												<li>
													<a href="#" class="icon icon-google google"></a>
												</li>
												<li>
													<a href="#" class="icon icon-fancy fancy"></a>
												</li>
												<li>
													<a href="#" class="icon icon-pinterest pinterest"></a>
												</li>
												<li>
													<a href="#" class="icon icon-twitter-logo twitter"></a>
												</li>
												<li>
													<a href="#" class="icon icon-facebook-logo facebook"></a>
												</li>
											</ul>
										</div>
									</div>
									<!-- /Product Actions -->
								</div>
								<!-- /Product Photo -->
								<!-- Product Details -->
								<div class="product-item-details">
									<div class="product-item-name">
										<a title="Grey T-shirt fashion Sportex" href="product.html" class="product-item-link">Grey T-shirt fashion Sportex</a>
									</div>
									<div class="product-item-description">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia nonkdni numquam eius modi tempora incidunt
										ut labore</div>
									<div class="price-box">
										<span class="price-container">
											<span class="price-wrapper">
												<span class="old-price">$300.00</span>
												<span class="special-price">$249.00</span>
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
									<button class="btn add-to-cart" data-product="789123">
										<i class="icon icon-cart"></i>
										<span>Add to Cart</span>
									</button>
								</div>
								<!-- /Product Details -->
							</div>
						</div>
					</div>
					<!-- /Product Item -->
					<!-- Product Item -->
					<div class="product-item  large category1 category2">
						<div class="product-item-inside">
							<div class="product-item-info">
								<!-- Product Photo -->
								<div class="product-item-photo">
									<!-- Product Label -->
									<div class="product-item-label label-new">
										<span>New</span>
									</div>
									<div class="product-item-label label-sale">
										<span>-20%</span>
									</div>
									<!-- /Product Label -->
									<!-- product main photo -->
									<!-- product inside carousel -->
									<div class="carousel-inside slide" data-ride="carousel">
										<div class="carousel-inner" role="listbox">
											<div class="item active">
												<a href="#">
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-25.jpg"></c:url>' alt="">
												</a>
											</div>
											<div class="item">
												<a href="#">
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-25-1.jpg"></c:url>' alt="">
												</a>
											</div>
										</div>
										<a class="carousel-control next"></a>
										<a class="carousel-control prev"></a>
									</div>
									<!-- /product inside carousel -->
									<a href="quick-view.html" title="Quick View" class="quick-view-link quick-view-btn">
										<i class="icon icon-eye"></i>
										<span>Quick View</span>
									</a>
									<!-- /product main photo  -->
									<div class="countdown-box hidden-xs">
										<div class="countdown-wrapper">
											<div class="countdown-title">special price expires in</div>
											<div class="countdown" data-promodate="2016/12/01"></div>
										</div>
									</div>
									<!-- Product Actions -->
									<a href="#" title="Add to Wishlist" class="no_wishlist">
										<i class="icon icon-heart"></i>
										<span>Add to Wishlist</span>
									</a>
									<div class="product-item-actions">
										<div class="share-button toBottom">
											<span class="toggle"></span>
											<ul class="social-list">
												<li>
													<a href="#" class="icon icon-google google"></a>
												</li>
												<li>
													<a href="#" class="icon icon-fancy fancy"></a>
												</li>
												<li>
													<a href="#" class="icon icon-pinterest pinterest"></a>
												</li>
												<li>
													<a href="#" class="icon icon-twitter-logo twitter"></a>
												</li>
												<li>
													<a href="#" class="icon icon-facebook-logo facebook"></a>
												</li>
											</ul>
										</div>
									</div>
									<!-- /Product Actions -->
								</div>
								<!-- /Product Photo -->
								<!-- Product Details -->
								<div class="product-item-details">
									<div class="product-item-name">
										<a title="Mesh bodycon dress" href="product.html" class="product-item-link">Mesh bodycon dress</a>
									</div>
									<div class="product-item-description">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia nonkdni numquam eius modi tempora incidunt
										ut labore</div>
									<div class="price-box">
										<span class="price-container">
											<span class="price-wrapper">
												<span class="old-price">$290.00</span>
												<span class="special-price">$229.00</span>
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
									<button class="btn add-to-cart" data-product="789123">
										<i class="icon icon-cart"></i>
										<span>Add to Cart</span>
									</button>
								</div>
								<!-- /Product Details -->
							</div>
						</div>
					</div>
					<!-- /Product Item -->

					<!-- Product Item -->
					<div class="product-item  large category1">
						<div class="product-item-inside">
							<div class="product-item-info">
								<!-- Product Photo -->
								<div class="product-item-photo">
									<!-- Product Label -->
									<div class="product-item-label label-new">
										<span>New</span>
									</div>
									<!-- /Product Label -->
									<!-- product main photo -->
									<!-- product inside carousel -->
									<div class="carousel-inside slide" data-ride="carousel">
										<div class="carousel-inner" role="listbox">
											<div class="item active">
												<a href="#">
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-17.jpg"></c:url>' alt="">
												</a>
											</div>
											<div class="item">
												<a href="#">
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-17-1.jpg"></c:url>' alt="">
												</a>
											</div>
											<div class="item">
												<a href="#">
													<img class="product-image-photo" src='<c:url value = "/assets/user/images/products/product-17-2.jpg"></c:url>' alt="">
												</a>
											</div>
										</div>
										<a class="carousel-control next"></a>
										<a class="carousel-control prev"></a>
									</div>
									<!-- /product inside carousel -->
									<a href="quick-view.html" title="Quick View" class="quick-view-link quick-view-btn">
										<i class="icon icon-eye"></i>
										<span>Quick View</span>
									</a>
									<a href="product.html" class="product-item-not-available">
										<span class="vert-wrapper">
											<span class="vert">
												<span class="text">Not Available</span>
											</span>
										</span>
									</a>
									<!-- /product main photo  -->
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
										<a title="Floral sleeveless dress" href="product.html" class="product-item-link">Floral sleeveless dress</a>
									</div>
									<div class="product-item-description">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia nonkdni numquam eius modi tempora incidunt
										ut labore</div>
									<div class="price-box">
										<span class="price-container">
											<span class="price-wrapper">
												<span class="price">$289.00</span>
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
									<button class="btn add-to-cart" data-product="789123">
										<i class="icon icon-cart"></i>
										<span>Add to Cart</span>
									</button>
								</div>
								<!-- /Product Details -->
							</div>
						</div>
					</div>
					<!-- /Product Item -->

				</div>
				<!-- /Products Grid -->
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
				</div>
				<!-- /Filter Row -->
				<!-- Total -->
				<div class="items-total">Items 1 to 15 of 28 total</div>
				<!-- /Total -->
			</div>
			<!-- /Center column -->
		</div>
		<div class="ymax"></div>
		<!-- /Two columns -->
	</div>
</main>
<!-- /Page Content -->