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
    <title>Update order</title>
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
            <h1 class="mt-4">Update order</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">
                <a href="/admin/order">Order</a>
              </li>
              <li class="breadcrumb-item active">Update/${newOrder.id}</li>
            </ol>
            <div class="mt-4">
              <div class="row">
                <div class="col-md-6 col-12 mx-auto">
                  <h3>Update order</h3>
                  <hr />
                  <div class="d-flex">
                    <p>Order id: ${newOrder.id}</p>
                    <p class="mx-4">
                      Total price:
                      <fmt:formatNumber
                        type="number"
                        value="${newOrder.totalPrice}"
                      />
                      đ
                    </p>
                  </div>
                  <form:form
                    action="/admin/order/update"
                    method="post"
                    modelAttribute="newOrder"
                    class="row"
                  >
                    <div class="mb-3" hidden="true">
                      <label class="form-label">ID:</label>
                      <form:input type="text" class="form-control" path="id" />
                    </div>

                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">User:</label>
                      <form:input
                        type="text"
                        class="form-control"
                        path="user.fullName"
                        disabled="true"
                      />
                    </div>
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Status:</label>
                      <form:select class="form-select" path="status">
                        <form:option value="PENDING">PENDING</form:option>
                        <form:option value="SHIPPING">SHIPPING</form:option>
                        <form:option value="COMPLETE">COMPLETE</form:option>
                        <form:option value="CANCEL">CANCEL</form:option>
                      </form:select>
                    </div>
                    <div class="mb-3">
                      <a href="/admin/order" class="btn btn-success me-2"
                        >Back</a
                      >
                      <button type="submit" class="btn btn-warning">
                        Update
                      </button>
                    </div>
                  </form:form>
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
