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
    <meta name="author" content="Hỏi Dân IT" />
    <title>User detail with id = ${user.id}</title>
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
            <h1 class="mt-4">User detail</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">
                <a href="/admin/user">User</a>
              </li>
              <li class="breadcrumb-item active">${user.id}</li>
            </ol>
            <div class="mt-4">
              <div class="row">
                <div class="user-container col-12 mx-auto">
                  <div
                    class="d-flex justify-content-between align-items-center"
                  >
                    <h1>User detail with id=${user.id}</h1>
                  </div>
                  <hr />
                  <div class="card" style="width: 60%">
                    <div class="card-header">User information</div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">ID: ${user.id}</li>
                      <li class="list-group-item">Email: ${user.email}</li>
                      <li class="list-group-item">
                        FullName: ${user.fullName}
                      </li>
                      <li class="list-group-item">Address: ${user.address}</li>
                    </ul>
                  </div>
                  <a class="btn btn-success mt-3" href="/admin/user">Back</a>
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
