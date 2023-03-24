<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<h1>
				<strong>Profile</strong>
			</h1>
			<h8> <Strong>Username:</Strong> <a href='<c:url value = "/admin/profile/${currentStaff.getId() }"></c:url>' >${Staff.getUsername() }</a> </h8>
			<hr>
			<div class="row customerDetail">
				<div class="col-6">
					<form id="formEditAccountAdmin">
						<input type="hidden" value="${Staff.getId() }" name="id" id="id" />
						<label for="name"><strong>Full name:</strong></label> <input
							type="text" value="${Staff.getFullName() }" name="name" id="name"
							class="form-control" placeholder="Your full name..." /> <br>
						<label for="other"><strong>Email:</strong></label> <input
							type="email" name="email" value="${Staff.getEmail() }" id="email"
							class="form-control" placeholder="Email..." /> <br> <label
							for="phone"><strong>Phone number:</strong></label> <input
							type="text" name="phone" value="${Staff.getPhoneNumber() }"
							id="phone" class="form-control" placeholder="Phone number..." />
						<br> <label for="address"><strong>Address:</strong></label> <input
							type="text" name="address" value="${Staff.getAddress() }"
							id="address" class="form-control" placeholder="Phone number..." />
						<br>
						<button id="editAccount" class="btn btn-primary">Edit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
