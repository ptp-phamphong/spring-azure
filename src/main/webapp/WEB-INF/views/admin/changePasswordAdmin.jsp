<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<h1>
				<strong>Change password</strong>
			</h1>
			<h8> <Strong>Username:</Strong> <a href='<c:url value = "/admin/profile/${currentStaff.getId() }"></c:url>' >${Staff.getUsername() }</a> </h8>
			<hr>
			<div class="row customerDetail">
				<div class="col-6">
				<h3 class="text-danger">${Error}</h3>
					<form id="changePasswordAdmin" method="post" action="">
						<input type="hidden" value="${Staff.getId() }" name="id" id="id" />
						<label for="old"><strong>Old password:</strong></label> <input
							type="password" name="old" id="old"
							class="form-control" placeholder="Your old password..." /> <br>
						<label for="newp"><strong>New password:</strong></label> <input
							type="password" name="newp" id="newp"
							class="form-control" placeholder="New password..." /> <br> <label
							for="confirm"><strong>Confirm new password:</strong></label> <input
							type="password" name="confirm"
							id="confirm" class="form-control" placeholder="Confirm your new password..." />
						<br> 
						<button id="changePassword" class="btn btn-primary">Change password</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
