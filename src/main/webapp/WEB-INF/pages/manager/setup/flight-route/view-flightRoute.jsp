
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Flight Route</title>
    <jsp:include page="/WEB-INF/pages/include/management/css-page.jsp"/>
</head>
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
<div class="page-wrapper">
    <!-- start header -->
    <jsp:include page="/WEB-INF/pages/include/management/header.jsp" />
    <!-- end header -->
    <!-- start page container -->
    <div class="page-container">
        <!-- start sidebar menu -->
        <jsp:include page="/WEB-INF/pages/include/management/sidebar-menu.jsp" />
        <!-- end sidebar menu -->
        <!-- start page content -->
        <div class="page-content-wrapper">
            <div class="page-content">
                <div class="page-bar">
                    <div class="page-title-breadcrumb">
                        <div class=" pull-left">
                            <div class="page-title">All Airport</div>
                        </div>
                        <ol class="breadcrumb page-breadcrumb pull-right">
                            <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                            </li>
                            <li><a class="parent-item" href="">Airport</a>&nbsp;<i class="fa fa-angle-right"></i>
                            </li>
                            <li class="active">All Airport</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-box">
                            <div class="card-head">
                                <header>All Airport</header>
                                <div class="tools">
                                    <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                    <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                    <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                </div>
                            </div>
                            <div class="card-body ">
                                <div class="row p-b-20">
                                    <div class="col-md-6 col-sm-6 col-6">
                                        <div class="btn-group">
                                            <a href='<c:url value="/manager/flight-route/add"/>' id="addRow" class="btn btn-info">
                                                Add New <i class="fa fa-plus"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-scrollable">
                                    <table class="table table-hover table-checkable order-column full-width" id="example4">
                                        <thead>
                                        <tr>
                                            <th class="center"> Departure </th>
                                            <th class="center"> Destination </th>
                                            <th class="center"> Distance </th>
                                            <th class="center"> Duration </th>
                                            <th class="center"> Price </th>
                                            <th class="center"> Status </th>
                                            <th class="center"> Action </th>
                                        </tr>
                                        </thead>
                                        <c:forEach items="${flightRoutes.content}" var="f">
                                            <c:set var="price" value="${f.price}"/>
                                            <tbody>
                                            <tr class="odd gradeX">
                                                <td class="center">${f.departure.city.cityName}</td>
                                                <td class="center">${f.destination.city.cityName}</td>
                                                <td class="center">${f.distance}</td>
                                                <td class="center">
                                                    <fmt:formatDate type = "time" value = "${f.duration}" />
                                                </td>
                                                <td class="center">
                                                    <fmt:formatNumber type = "number"
                                                                                     maxFractionDigits = "0" value = "${price}" /> VND
                                                </td>
                                                <td class="center">${f.status}</td>
                                                <td class="center">
                                                    <a href="<c:url
                                                        value="/manager/flight-route/edit/${f.id}"/> "
                                                       class="btn btn-tbl-edit btn-xs">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
<%--                                                    <button onclick="location.href='<c:url value="/manager/flight-route/delete/${f.id}"/>'" class="btn btn-tbl-delete btn-xs">--%>
<%--                                                        <i class="fa fa-trash-o "></i>--%>
<%--                                                    </button>--%>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                                <div class="row p-b-20">
                                    <nav aria-label="Page navigation example" style="text-align: center">
                                        <ul class="pagination">
                                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manager/flight-route/view?page=0">First</a></li>
                                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manager/flight-route/view?page=${flightRoutes.number - 1}">Previous</a></li>
                                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manager/flight-route/view?page=${flightRoutes.number + 1}">Next</a></li>
                                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manager/flight-route/view?page=${flightRoutes.totalPages - 1}">Last</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end page content -->
        <!-- start chat sidebar -->

        <!-- end chat sidebar -->
    </div>
    <!-- end page container -->
    <!-- start footer -->
    <jsp:include page="/WEB-INF/pages/include/management/footer.jsp" />
    <!-- end footer -->
</div>
<jsp:include page="/WEB-INF/pages/include/management/js-page.jsp" />
</body>
</html>
