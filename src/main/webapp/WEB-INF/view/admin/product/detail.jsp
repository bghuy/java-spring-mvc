<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    <title>Product detail with id = ${product.id}</title>
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
            <h1 class="mt-4">Product detail</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">
                <a href="/admin/product">Product</a>
              </li>
              <li class="breadcrumb-item active">${product.id}</li>
            </ol>
            <div class="mt-4">
              <div class="row">
                <div class="user-container col-12 mx-auto">
                  <div
                    class="d-flex justify-content-between align-items-center"
                  >
                    <h1>Product detail with id=${product.id}</h1>
                  </div>
                  <hr />
                  <div class="card" style="width: 60%">
                    <div class="card-header">Product information</div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">
                        <img
                          src="/images/product/${product.image}"
                          style="max-width: 100%; height: auto"
                        />
                      </li>
                      <li class="list-group-item">ID: ${product.id}</li>
                      <li class="list-group-item">Name: ${product.name}</li>
                      <li class="list-group-item">
                        Price: ${String.format("%.0f", product.price)}
                      </li>
                      <li class="list-group-item">
                        Full description: ${product.detailDesc}
                      </li>
                      <li class="list-group-item">
                        Short description: ${product.shortDesc}
                      </li>
                      <li class="list-group-item">
                        Quantity: ${product.quantity}
                      </li>
                      <li class="list-group-item">Sold: ${product.sold}</li>
                      <li class="list-group-item">
                        Factory: ${product.factory}
                      </li>
                      <li class="list-group-item">Target: ${product.target}</li>
                    </ul>
                  </div>
                  <a class="btn btn-success mt-3" href="/admin/product">Back</a>
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
