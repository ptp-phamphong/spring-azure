<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Header Cart -->
<div class="header-link dropdown-link header-cart variant-1">
	<a href='<c:url value="/cart"></c:url>'>
		<i class="icon icon-cart"></i>
		<span id="headerCartBadge" class="badge">${sessionScope.curCart.size() }</span>
	</a>
	<!-- minicart wrapper -->
	<div class="dropdown-container right">
		<div id="headerCart">
			<%@include file="/WEB-INF/views/layouts/user/headerCart.jsp"%>
		</div>
	</div>
</div>
<!-- /Header Cart -->

<!-- Header Links -->
<div class="header-links">
	<!-- Header Account -->
	<c:choose>
		<c:when test="${not empty currentCustomer}">
			<div class="header-link header-account"></div>
			<div class="header-link dropdown-link header-account">
				<a href='<c:url value="/account/${currentCustomer.getId()}"></c:url>'>${currentCustomer.getFullName()}</a>
				<div class="dropdown-container right">
					<div class="title">Hello</div>
					<div class="top-text" style="color: green; font-size: 150%">${currentCustomer.getFullName()}</div>
					<button onclick="location.href='<c:url value="/account/${currentCustomer.getId()}"></c:url>'" class="btn btn-lg">View Account</button>
					<button onclick="location.href='<c:url value="/account/${currentCustomer.getId()}/ShoppingHistory"></c:url>'" class="btn btn-lg">Shopping History</button>
					<button onclick="location.href='<c:url value="/logoutHandelling"></c:url>'" class="btn btn-lg" data-toggle="modal" data-target="#logOutPopup">Logout</button>
				</div>
			</div>

		</c:when>
		<c:otherwise>
			<div class="header-link dropdown-link header-account">
				<a href='<c:url value="/login"></c:url>'>
					<i class="icon icon-user"></i>
				</a>
				<div class="dropdown-container right">
					<div class="title">Registered Customers</div>
					<div class="top-text">If you have an account with us, please log in.</div>

					<!-- form login  -->

					<c:url var="action_url" value="/loginHandelling" />
					<form:form method="post" class="account-create" action="${action_url }" modelAttribute="customer">


						<label>
							E-mail
							<span class="required">*</span>
						</label>
						<form:input path="email" type="email" class="form-control input-lg" required="required" />

						<label>
							Password
							<span class="required">*</span>
						</label>
						<form:input path="password" type="password" class="form-control input-lg" required="required" />

						<div>
							<button class="btn btn-lg" type="submit">Login</button>
						</div>
					</form:form>

					<div class="title">OR</div>
					<div class="bottom-text">
						Create a
						<a href='<c:url value="/register"></c:url>'>New Account</a>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>


	<!-- /Header Account -->
</div>
<!-- /Header Links -->
<!-- Header Search -->
<div class="header-link header-search header-search">
	<div class="exp-search">
		<form>
			<input class="exp-search-input " placeholder="Search here ..." type="text" value="">
			<input class="exp-search-submit" type="submit" value="">
			<span class="exp-icon-search">
				<i class="icon icon-magnify"></i>
			</span>
			<span class="exp-search-close">
				<i class="icon icon-close"></i>
			</span>
		</form>
	</div>
</div>
<!-- /Header Search -->

<!-- Mobile Menu -->
<div class="mobilemenu dblclick">
	<div class="mobilemenu-header">
		<div class="title">MENU</div>
		<a href="#" class="mobilemenu-toggle"></a>
	</div>
	<div class="mobilemenu-content">
		<ul class="nav">
			<li>
				<a href='<c:url value="/"></c:url>'">HOME</a>
				<span class="arrow"></span>
			</li>
			<li>
				<a href='<c:url value = "/all-product"></c:url>'>All Products</a>
			</li>
			<li>
				<a href='<c:url value = "/all-product"></c:url>'>Clothes</a>
			</li>
			<li>
				<a href='<c:url value="/all-product"></c:url>'>Equipment</a>
			</li>
		</ul>
	</div>
</div>
<!-- Mobile Menu -->
<!-- Mega Menu -->
<div class="megamenu fadein blackout">
	<ul class="nav">
		<li>
			<a href='<c:url value = "/"></c:url>'>HOME</a>
		</li>
		<li>
			<a href='<c:url value = "/all-product"></c:url>'>All Product</a>
		</li>

		<c:forEach var="productTypeItem" items="${productTypeList}" varStatus="index">
			<li class="mega-dropdown">
				<c:url value="/${fn:replace(productTypeItem.getName(), ' ', '-')}-${productTypeItem.getId() }" var="productTypeURL">
					<%-- <c:param name="productTypeId" value="${productTypeItem.getId() }"></c:param> --%>
				</c:url>
				<a href="${productTypeURL }">
					${productTypeItem.getName() }
					<span class="menu-label">-15%</span>
				</a>
				<div class="sub-menu">
					<div class="container">
						<div class="megamenu-categories column-4">
							<!-- megamenu column -->
							<div class="col">
								<a class="category-image" href="#">
									<img src='<c:url value = "/assets/user/images/category/megamenu-category-03.jpg"></c:url>' alt />
								</a>
								<a class="category-image" href="#">
									<img src='<c:url value = "/assets/user/images/category/megamenu-category-03.jpg"></c:url>' alt />
								</a>
							</div>
							<!-- /megamenu column -->
							<!-- megamenu column -->
							<div class="col">
								<div class="category-title">
									<a href="#">Sport</a>
								</div>
								<ul class="category-links">
									<c:forEach var="sportTypeItem" items="${sportTypeList }" varStatus="index">
										<c:url value="/${fn:replace(productTypeItem.getName(), ' ', '-')}-${productTypeItem.getId() }/${fn:replace(sportTypeItem.getName(), ' ', '-') }-${sportTypeItem.getId() }" var="sportTypeURL">
											<%-- <c:param name="productTypeId" value="${productTypeItem.getId() }"></c:param>
											<c:param name="sportTypeId" value="${sportTypeItem.getId() }"></c:param> --%>
										</c:url>
										<li>
											<a href="${sportTypeURL }">${sportTypeItem.getName() }</a>
										</li>
									</c:forEach>

								</ul>
							</div>
							<!-- /megamenu column -->
						</div>
					</div>
				</div>
			</li>
		</c:forEach>


	</ul>
</div>
<!-- /Mega Menu -->


