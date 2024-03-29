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
    <title>Update user</title>
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
            <h1 class="mt-4">Update user</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">
                <a href="/admin/user">User</a>
              </li>
              <li class="breadcrumb-item active">Update/${user.id}</li>
            </ol>
            <div class="mt-4">
              <div class="row">
                <div class="col-md-6 col-12 mx-auto">
                  <h3>Update user</h3>
                  <hr />
                  <form:form
                    action="/admin/user/update"
                    method="post"
                    modelAttribute="newUser"
                  >
                    <div class="mb-3" hidden="true">
                      <label class="form-label">ID:</label>
                      <form:input type="text" class="form-control" path="id" />
                    </div>

                    <div class="mb-3">
                      <label class="form-label">Email:</label>
                      <form:input
                        type="email"
                        class="form-control"
                        path="email"
                        disabled="true"
                      />
                    </div>
                    <div class="mb-3" hidden="true">
                      <label class="form-label">Password:</label>
                      <form:input
                        type="password"
                        class="form-control"
                        path="password"
                      />
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Phone number:</label>
                      <form:input
                        type="text"
                        class="form-control"
                        path="phone"
                      />
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Full Name:</label>
                      <form:input
                        type="text"
                        class="form-control"
                        path="fullName"
                      />
                    </div>
                    <div class="mb-3">
                      <label class="form-label">Address:</label>
                      <form:input
                        type="text"
                        class="form-control"
                        path="address"
                      />
                    </div>
                    <div class="mb-3">
                      <a href="/admin/user" class="btn btn-success me-2"
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
