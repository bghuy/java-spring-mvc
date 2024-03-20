<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Latest compiled JavaScript-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>Delete user</title>
  </head>
  <body>
    <!-- center the form bellow -->
    <div class="container mt-4">
      <div class="row">
        <div class="col-12 mx-auto">
          <h3>Delete user with id = ${id}</h3>
          <hr />
          <div class="alert alert-danger">
            <p>Are you sure to delete this user?</p>
          </div>
          <div class="d-flex justify-content-start align-items-center">
            <div>
              <a class="btn btn-success me-2" href="/admin/user">Back</a>
            </div>
            <div>
              <form:form
                action="/admin/user/delete"
                method="post"
                class="d-inline"
                modelAttribute="user"
              >
                <div class="mb-3" style="display: none">
                  <label class="form-label">ID:</label>
                  <form:input type="text" class="form-control" path="id" />
                </div>
                <button type="submit" class="btn btn-danger">Confirm</button>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
