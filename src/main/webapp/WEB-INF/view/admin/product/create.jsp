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
    <title>Dashboard</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
      rel="stylesheet"
    />
    <link href="/css/admin/dashboard/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
      $(document).ready(() => {
        const avatarFile = $("#avatarFile");
        avatarFile.change(function (e) {
          const imgURL = URL.createObjectURL(e.target.files[0]);
          $("#avatarPreview").attr("src", imgURL);
          $("#avatarPreview").css({ display: "block" });
        });
      });
    </script>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Manage products</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">
                <a href="/admin/product">Products</a>
              </li>
              <li class="breadcrumb-item active">
                <a href="/admin/product/create">Create</a>
              </li>
            </ol>
            <div class="mt-4">
              <div class="row">
                <div class="col-md-6 col-12 mx-auto">
                  <h3>Create a product</h3>
                  <hr />
                  <form:form
                    action="/admin/user/create"
                    method="post"
                    modelAttribute="newProduct"
                    class="row"
                    enctype="multipart/form-data"
                  >
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Name:</label>
                      <form:input
                        type="text"
                        class="form-control"
                        path="name"
                      />
                    </div>
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Price:</label>
                      <form:input
                        type="text"
                        class="form-control"
                        path="price"
                      />
                    </div>
                    <div class="mb-3 col-12">
                      <label class="form-label">Desciptions:</label>
                      <form:textarea
                        class="form-control"
                        rows="2"
                        path="detailDesc"
                      ></form:textarea>
                    </div>
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Short description:</label>
                      <form:input
                        type="text"
                        class="form-control"
                        path="shortDesc"
                      />
                    </div>
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Quantity:</label>
                      <form:input
                        type="text"
                        class="form-control"
                        path="quantity"
                      />
                    </div>
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Factory:</label>
                      <form:select class="form-select" path="factory">
                        <form:option value="Apple">Apple</form:option>
                        <form:option value="Asus">Asus</form:option>
                        <form:option value="Lenovo">Lenovo</form:option>
                        <form:option value="Dell">Dell</form:option>
                        <form:option value="LG">LG</form:option>
                        <form:option value="Acer">Acer</form:option>
                      </form:select>
                    </div>
                    <div class="mb-3 col-12 col-md-6">
                      <label class="form-label">Target:</label>
                      <form:select class="form-select" path="target">
                        <form:option value="Gaming">Gaming</form:option>
                        <form:option value="SINHVIEN-VANPHONG"
                          >Sinh viên - Văn phòng
                        </form:option>
                        <form:option value="THIET-KE-DO-HOA"
                          >Thiết kế đồ họa
                        </form:option>
                        <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                        <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                      </form:select>
                    </div>
                    <div class="mb-3 col-12 col-md-6">
                      <label for="avatarFile" class="form-label">Image:</label>
                      <input
                        class="form-control"
                        type="file"
                        id="avatarFile"
                        accept=".png,.jpg,.jpeg"
                        name="imgFile"
                      />
                    </div>
                    <div class="mb-3 col-12">
                      <img
                        id="avatarPreview"
                        alt="Avatar Preview"
                        style="display: none; max-height: 250px"
                      />
                    </div>

                    <div class="mb-5 col-12">
                      <button type="submit" class="btn btn-primary">
                        Create
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
    <script src="/js/admin/dashboard/scripts.js"></script>
  </body>
</html>
