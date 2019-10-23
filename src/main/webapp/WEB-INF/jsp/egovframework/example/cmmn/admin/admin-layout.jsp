<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
	<head>
		<tiles:insertAttribute name="head"/>
		<script type="text/javascript">
			$(function() {
				var ccode = "${ccode}";
				if (ccode != "2") {
					location.href = "<c:out value='main.do' />";
				}
			});
		</script>
	</head>
	<body id="page-top">
		<tiles:insertAttribute name="loading"/>
		<div class="page">
			<tiles:insertAttribute name="header"/>
		 		<div class="page-content d-flex align-items-stretch">
		 		<tiles:insertAttribute name="left"/>
		 		<div class="content-inner">
	 			<tiles:insertAttribute name="main"/>
				<tiles:insertAttribute name="footer"/>
				<a href="#" class="go-top"><i class="la la-arrow-up"></i></a>
		 		</div>
		 	</div>
		</div>

<script src="assets/vendors/js/base/core.min.js"></script>
<!-- End Vendor Js -->
<!-- Begin Page Vendor Js -->
<script src="assets/vendors/js/nicescroll/nicescroll.min.js"></script>
<script src="assets/vendors/js/app/app.min.js"></script>
<!-- End Page Vendor Js -->
<!-- Tooltip Initialisation -->
<script>
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>

	</body>
</html>


