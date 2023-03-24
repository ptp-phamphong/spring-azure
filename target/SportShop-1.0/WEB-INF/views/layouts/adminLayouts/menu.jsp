
<!-- Sidebar - Brand -->
<a
	class="sidebar-brand d-flex align-items-center justify-content-center"
	href='<c:url value = "/admin/"></c:url>'>
	<div class="sidebar-brand-icon rotate-n-15">
		<i class="fas fa-laugh-wink"></i>
	</div>
	<div class="sidebar-brand-text mx-3">SEIKO</div>
</a>

<!-- Divider -->
<hr class="sidebar-divider my-0">

<!-- Nav Item - Dashboard -->
<li class="nav-item active"><a class="nav-link"
	href='<c:url value = "/admin/"></c:url>'> <i
		class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>

<!-- Divider -->
<hr class="sidebar-divider">

<!-- Heading -->
<div class="sidebar-heading">Warehouse</div>

<li class="nav-item"><a class="nav-link collapsed" href="#"
	data-toggle="collapse" data-target="#collapseUtilities"
	aria-expanded="true" aria-controls="collapseUtilities"> <i
		class="fa fa-list" aria-hidden="true"></i> <span>List of
			products (Type)</span>
</a>
	<div id="collapseUtilities" class="collapse"
		aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">See the list:</h6>

			<a class="collapse-item"
				href='<c:url value = "/admin/product/type/0"></c:url>'>All</a>

			<c:forEach items="${ProductTypeList}" var="item" varStatus="index">
				<a class="collapse-item"
					href='<c:url value = "/admin/product/type/${item.getId()}"></c:url>'>${item.getName()}</a>
			</c:forEach>

		</div>
	</div></li>

<li class="nav-item"><a class="nav-link collapsed" href="#"
	data-toggle="collapse" data-target="#collapseSport"
	aria-expanded="true" aria-controls="collapseUtilities"> <i
		class="fa fa-list" aria-hidden="true"></i> <span>List of
			products (Sport)</span>
</a>
	<div id="collapseSport" class="collapse"
		aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">See the list:</h6>

			<a class="collapse-item"
				href='<c:url value = "/admin/product/sport/0"></c:url>'>All</a>

			<c:forEach items="${SportTypeList}" var="item" varStatus="index">
				<a class="collapse-item"
					href='<c:url value = "/admin/product/sport/${item.getId()}"></c:url>'>${item.getName()}</a>
			</c:forEach>

		</div>
	</div></li>

<li class="nav-item"><a class="nav-link collapsed" href="#"
	data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
	aria-controls="collapseTwo"> <i class="fa fa-archive"
		aria-hidden="true"></i> <span>Import / Export</span>
</a>
	<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
		data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">Warehouse management:</h6>
			<a class="collapse-item"
				href='<c:url value = "/admin/addProduct"></c:url>'>Add new
				product</a> <a class="collapse-item"
				href='<c:url value = "/admin/product/type/0"></c:url>'>Import</a> <a
				class="collapse-item"
				href='<c:url value = "/admin/product/type/0"></c:url>'>Export</a>
		</div>
	</div></li>

<!-- Divider -->
<hr class="sidebar-divider">

<!-- Heading -->
<div class="sidebar-heading">Accounts</div>

<!-- Nav Item - Pages Collapse Menu -->
<li class="nav-item"><a class="nav-link collapsed" href="#"
	data-toggle="collapse" data-target="#collapsePages"
	aria-expanded="true" aria-controls="collapsePages"> <i
		class="fas fa-fw fa-user"></i> <span>Account list</span>
</a>
	<div id="collapsePages" class="collapse" aria-labelledby="headingPages"
		data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">See the list:</h6>
			<a class="collapse-item"
				href='<c:url value = "/admin/customerList"></c:url>'>Customer</a> <a
				class="collapse-item"
				href='<c:url value = "/admin/staffAccountList"></c:url>'>Staff</a>
		</div>
	</div></li>

<hr class="sidebar-divider">

<div class="sidebar-heading">Invoice management</div>

<li class="nav-item"><a class="nav-link collapsed" href="#"
	data-toggle="collapse" data-target="#collapsePages1"
	aria-expanded="true" aria-controls="collapsePages1"> <i
		class="fas fa-fw fa-file"></i> <span>Invoices</span>
</a>
	<div id="collapsePages1" class="collapse" aria-labelledby="headingPages"
		data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">See the list:</h6>
			<a class="collapse-item"
				href='<c:url value = "/admin/invoiceList"></c:url>'>Invoice</a>
		</div>
	</div></li>

<!-- Divider -->
<hr class="sidebar-divider d-none d-md-block">


<!-- Sidebar Message -->
<div class="sidebar-card d-none d-lg-flex">
	<img class="sidebar-card-illustration mb-2"
		src='<c:url value = "/assets/themes/img/undraw_rocket.svg"></c:url>'
		alt="...">
	<p class="text-center mb-2">
		<strong>SB Admin Pro</strong> is packed with premium features,
		components, and more!
	</p>
	<a class="btn btn-success btn-sm"
		href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to
		Pro!</a>
</div>

</ul>
<!-- End of Sidebar -->