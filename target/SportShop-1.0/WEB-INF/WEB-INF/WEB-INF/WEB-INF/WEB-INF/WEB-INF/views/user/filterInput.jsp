<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
	<c:when test="${sessionScope.productFilterList.size() > 0 }">
		<c:set var="div_display" value=" style ='display: '"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="div_display" value=" style ='display: none;'"></c:set>
	</c:otherwise>
</c:choose>

<div class="sidebar-block-top" ${div_display }>
	<h2>Shoping By</h2>
	<ul class="selected-filters">
		<c:forEach var="filterInputItem" items="${sessionScope.productFilterList }">
			<li>
				<a href="#" onclick="return removeFilter(${filterInputItem.getFilterItemId()}, '${filterInputItem.getFilterItemType() }')">
					<span>${filterInputItem.getFilterItemName() }</span>
					<span class="remove">
						<i class="icon icon-close"></i>
					</span>
				</a>
				<div class="bg-striped"></div>
			</li>
		</c:forEach>
	</ul>
</div>