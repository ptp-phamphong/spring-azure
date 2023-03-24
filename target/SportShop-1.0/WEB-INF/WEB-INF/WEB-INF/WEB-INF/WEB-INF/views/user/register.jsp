<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
					<span>Faq</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="block">
		<div class="container">
			<div class="form-card">
				<h3>Personal Information</h3>

				<form:form class="account-create" action="registerHandelling" modelAttribute="customer">
					<label>
						E-mail
						<span class="required">*</span>
					</label>
					<form:input path="email" id="Email" type="email" class="form-control input-lg" required="required" />
					<input type="button" onclick="sendEmail()" class="btn btn-xs" value="Validate this Email (Required)"></input>
					<br>

					<div style="display: none" id="divOTP">
						<label>
							OTP Code
							<span class="required">*</span>
						</label>
						<input type="number" type="text" name="OTPCode" class="form-control input-lg" required />
					</div>


					<label>
						Password
						<span class="required">*</span>
					</label>
					<form:input path="password" type="password" class="form-control input-lg" required="required" />

					<label>Full Name</label>
					<form:input path="fullName" class="form-control input-lg" />

					<label>Phone</label>
					<form:input path="phoneNumber" class="form-control input-lg" />

					<label>Address</label>
					<form:input path="address" class="form-control input-lg" />
					<div>
						<button type="submit" class="btn btn-lg">Create</button>
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


<div id="test"></div>



<script>
	
</script>
