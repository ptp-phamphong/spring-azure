<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Page Content -->
<main class="page-main">
	<div class="block">
		<div class="container">
			<div class="form-card">
				<h3>Personal Information</h3>

				<form:form class="account-create" action="/SportShop/updateAccountHandelling" modelAttribute="customer">
					<form:input path="id" id="id" type="hidden" class="form-control input-lg" required="required" readonly="true"/>
					<label>
						E-mail
						<span class="required">*</span>
					</label>
					<form:input path="email" id="Email" type="email" class="form-control input-lg" required="required" />

					<input type="button" data-toggle="modal" data-target="#changePassword" class="btn btn-xs" value="Change password"></input>
					<br>
					<%-- <label>
						Password
						<span class="required">*</span>
					</label>--%>
					<form:input id="password_input" path="password" type="hidden" class="form-control input-lg" required="required" readonly="true"/>

					<label>Full Name</label>
					<form:input path="fullName" class="form-control input-lg" />

					<label>Phone</label>
					<form:input path="phoneNumber" class="form-control input-lg" />

					<label>Address</label>
					<form:input path="address" class="form-control input-lg" />
					<div>
						<button type="submit" class="btn btn-lg">Update</button>
						<span class="required-text">* Required Fields</span>
					</div>
					<div class="back">
						or
						<a href="#">
							Return to Store
							<i class="icon icon-undo"></i>
						</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</main>
<!-- /Page Content -->

<!-- Modal -->
<div class="modal modal-countdown fade zoom info error" data-interval="0" id="changePassword">
	<div class="modal-dialog">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">&#10006;</button>
		</div>
		<div class="modal-content">
			<div class="modal-body">
				<div class="text-center">
					<p>Change Password</p>
					<form class="account-create" onsubmit="confirmChangePassword(); return false">
						<label>
							Old Password
							<span class="required">*</span>
						</label>
						<input type="hidden" id="customerId" value="${customer.getId() }" />
						<input id="oldPassword" type="password" class="form-control input-lg" required="required" onfocusout="checkOldPassword()" />
						<input type="hidden" id="oldPassword_status" value="fail" />
						<label>
							New Password
							<span class="required">*</span>
						</label>
						<input id="newPassword" type="password" class="form-control input-lg" required="required" onfocusout="checkNewPassword()" />
						<input type="hidden" id="newPassword_status" value="fail" />
						<label>
							Confirm new Password
							<span class="required">*</span>
						</label>
						<input id="confirmNewPassword" type="password" class="form-control input-lg" required="required" oninput="checkConfirmNewPassword()" />
						<input type="hidden" id="confirmNewPassword_status" value="fail" />
						<span id="noti_changePassword" style="color: red"></span>
						<div>
							<button id="update_Password" disabled type="submit" class="btn btn-lg">Confirm</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Modal -->

<div class="modal modal-countdown fade zoom info success" data-interval="10000" id="changePasswordConfirm">
	<div class="modal-dialog">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">&#10006;</button>
		</div>
		<div class="modal-content">
			<div class="modal-body">
				<div class="text-center">
					<div class="icon-info">
						<i class="icon icon-alert"></i>
					</div>
					<p>Please Click Update to save new Password!!!</p>
				</div>
			</div>
		</div>
	</div>
</div>



