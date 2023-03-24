<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>SportShop</title>

<!-- Custom fonts for this template-->
<link href='<c:url value = "/assets/themes/vendor/fontawesome-free/css/all.min.css"></c:url>'
	rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href='<c:url value = "/assets/themes/css/sb-admin-2.css"></c:url>' rel="stylesheet">
<link href='<c:url value = "/assets/themes/css/sb-admin-2.min.css"></c:url>' rel="stylesheet">
<link href='<c:url value = "/assets/themes/css/mycss.css"></c:url>' rel="stylesheet">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style type="text/css">
div.dataTables_wrapper {
	margin-bottom: 3em;
}
</style>

</head>
<body class="bg-gradient-primary">
	<div class="container">
		<decorator:body />
	</div>

	<script
		src='<c:url value = "/assets/themes/vendor/jquery/jquery.min.js"></c:url>'></script>
	<script
		src='<c:url value = "/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></c:url>'></script>

	<!-- Custom scripts for all pages-->
	<script
		src='<c:url value = "/assets/themes/js/sb-admin-2.min.js"></c:url>'></script>

	<!-- Page level plugins -->
	<script
		src='<c:url value = "/assets/themes/vendor/chart.js/Chart.min.js"></c:url>'></script>

	<script src='<c:url value = "/assets/themes/js/myjs.js"></c:url>'></script>

	<!-- Page level custom scripts -->
	<script
		src='<c:url value = "/assets/themes/js/demo/chart-area-demo.js"></c:url>'></script>
	<script
		src='<c:url value = "/assets/themes/js/demo/chart-pie-demo.js"></c:url>'></script>

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

</body>