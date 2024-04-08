<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="Dự án laptopshop" />
    <meta name="author" content="Bạch Gia Huy" />
    <title>Order detail with id = ${order.id}</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
      rel="stylesheet"
    />
    <link href="/css/admin/dashboard/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Order detail</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">
                <a href="/admin/order">Order</a>
              </li>
              <li class="breadcrumb-item active">${order.id}</li>
            </ol>
            <div class="mt-4">
              <div class="row">
                <div class="order-container col-12 mx-auto">
                  <table class="table table-hover table-bordered">
                    <thead class="table-dark">
                      <tr>
                        <th scope="col">Product</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total price</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="orderDetail" items="${orderDetails}" varStatus="loop">
                        <tr>
                          <th scope="row">
                            
                            <img src="/images/product/${orderDetail.product.image}" alt="product image" class="img-fluid me-5 rounded-circle"
                            style="width: 80px; height: 80px;">
                          </th>
                          <td>
                            <a href="/product/${orderDetail.product.id}" target="_blank">
                              ${orderDetail.product.name}
                            </a>
                            
                          </td>
                          <td>
                            <fmt:formatNumber
                              type="number"
                              value="${orderDetail.price}"
                            />
                            đ
                          </td>
                          <td>${orderDetail.quantity}</td>
                          <td>
                            <fmt:formatNumber
                              type="number"
                              value="${orderDetail.price* orderDetail.quantity}"
                            />
                            đ
                          </td>
                        </tr>
                      </c:forEach>
                      
                    </tbody>
                  </table>
                  <div>
                    <a class="btn btn-success" href="/admin/order">
                      Back
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/admin/dashboard/scripts.js"></script>
  </body>
</html>
