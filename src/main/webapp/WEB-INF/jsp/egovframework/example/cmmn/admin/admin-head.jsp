<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>
    
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Elisyam - Components Tooltips</title>
<meta name="description" content="Elisyam is a Web App and Admin Dashboard Template built with Bootstrap 4">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Google Fonts -->
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
<script>
  WebFont.load({
    google: {"families":["Montserrat:400,500,600,700","Noto+Sans:400,700"]},
    active: function() {
        sessionStorage.fonts = true;
    }
  });
</script>
<!-- Favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="assets/img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicon-16x16.png">
<!-- Stylesheet -->
<link rel="stylesheet" href="assets/vendors/css/base/bootstrap.min.css">
<link rel="stylesheet" href="assets/vendors/css/base/elisyam-1.5.min.css">
<link rel="stylesheet" href="assets/css/animate/animate.min.css">

<script src="assets/vendors/js/base/jquery.min.js"></script>
<script src="assets/vendors/js/progress/circle-progress.min.js"></script>
<script src="assets/vendors/js/waypoints/waypoints.min.js"></script>
<script src="assets/vendors/js/chart/chart.min.js"></script>
<script src="assets/js/components/chartjs/chartjs.min.js"></script>
<script src="assets/vendors/js/chart/chart.min.js"></script>

<script src="assets/vendors/js/base/core.min.js"></script>
<script src="assets/vendors/js/nicescroll/nicescroll.min.js"></script>
<script src="assets/vendors/js/datepicker/moment.min.js"></script>
<script src="assets/vendors/js/datepicker/daterangepicker.js"></script>
<script src="assets/js/components/datepicker/datepicker.js"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/common/css/animate.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/common/css/admin/common.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/common/css/admin/contents.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/common/css/admin/jquery-ui.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/common/css/admin/ui.jqgrid.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/custom.css'/>" >
<link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery.minicolors.css'/>" >
<link rel="stylesheet" type="text/css" href="<c:url value='/common/js/datepicker/datepicker.css'/>">

<script type="text/javascript" src="<c:url value='/common/js/selectric/jquery.selectric.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/common/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="<c:url value='/common/js/datepicker/datepicker.ko-KR.js'/>"></script>
<script type="text/javascript" src="<c:url value='/common/js/admin/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='/common/js/admin/picker.js'/>"></script>
<script type="text/javascript" src="<c:url value='/common/js/admin/valid.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jqgrid/Guriddo_jqGrid_JS_5_3_2/js/trirand/i18n/grid.locale-kr.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jqgrid/Guriddo_jqGrid_JS_5_3_2/js/trirand/src/jquery.jqGrid.js'/>"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.alphanum.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jqgrid/cmmnJqgrid.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/cmmn.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/cmmnDatePicker.js' />"></script>
    <script type="text/javascript" src="<c:url value='/common/js/admin/sign.js'/>"></script>
