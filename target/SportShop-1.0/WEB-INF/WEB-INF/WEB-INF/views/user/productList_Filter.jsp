<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!-- Left column -->

<div class="filter-container">
	<div class="fstart"></div>
	<div class="fixed-wrapper">
		<div class="fixed-scroll">
			<div class="filter-col-header">
				<div class="title">Filters</div>
				<a href="#" class="filter-col-toggle"></a>
			</div>
			<div class="filter-col-content">
				<div id="filter_Input">
					<%@include file="/WEB-INF/views/user/filterInput.jsp"%>
				</div>
				<div class="sidebar-block collapsed open">
					<div class="block-title">
						<span>Sports</span>
						<div class="toggle-arrow"></div>
					</div>
					<div class="block-content">
						<ul class="category-list">
							<c:forEach var="sportTypeItem" items="${sportTypeList }">
								<li>
									<a id="filter_Sport_${sportTypeItem.getId() }" href="#" onclick="return addFilter(${sportTypeItem.getId()}, 'SportTypeId')" class="value">${sportTypeItem.getName() }</a>
									<a href="#" onclick="return removeFilter(${sportTypeItem.getId()}, 'SportTypeId')" class="clear"></a>
								</li>
							</c:forEach>
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
							<c:forEach var="productTypeItem" items="${productTypeList}" varStatus="index">
								<li>
									<a  id="filter_Type_${productTypeItem.getId() }" href="#" onclick="return addFilter(${productTypeItem.getId()}, 'ProductTypeId')" class="value">${productTypeItem.getName() }</a>
									<a href="#" onclick="return removeFilter(${productTypeItem.getId()}, 'ProductTypeId')" class="clear"></a>
								</li>
							</c:forEach>
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
			</div>
		</div>
	</div>
	<div class="fend"></div>
</div>

<!-- /Left column -->