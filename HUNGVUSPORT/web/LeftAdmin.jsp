<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white" style="padding: 0px">
    <div class="position-sticky">
        <div class="list-group list-group-flush mx-3 mt-4">

            <a href="statistic" class="list-group-item list-group-item-action py-2 ripple" aria-current="true">
                <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Main dashboard</span>
            </a>
            <a href="doanhsosanpham" class="list-group-item list-group-item-action py-2 ripple">
                <i class="fas fa-chart-pie fa-fw me-3"></i><span>Số lượng theo từng sản phẩm</span>
            </a>
            <a href="monthlyrevenue" class="list-group-item list-group-item-action py-2 ripple">
                <i class="fas fa-chart-bar fa-fw me-3"></i><span>Doanh thu tháng</span>
            </a>
            <a href="invoicecontroller" class="list-group-item list-group-item-action py-2 ripple"><i class="fas fa-file-invoice-dollar fa-fw me-3"></i><span>Hóa Đơn</span></a>

            <a href="manageruser?user_id=${sessionScope.user.getId()}" class="list-group-item list-group-item-action py-2 ripple">
                <i class="fas fa-user-circle fa-fw me-3"></i><span>List user</span>
            </a>
            <a href="managerproduct" class="list-group-item list-group-item-action py-2 ripple">
                <i class="fas fa-user-circle fa-fw me-3"></i><span>List product</span>
            </a>
            <a href="menu?user_id=${sessionScope.user.getId()} " class="" aria-current="true">
                <i class="fa-fw me-3"></i><span>Return shop</span>
            </a>
        </div>
    </div>
</nav>
<!-- Sidebar -->