<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html lang="en">

<head>

<%@ include file="./include/static-head.jsp" %>

<%--  slick--%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"
        integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<%--  slick--%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"
        integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<%--  custom css--%>
  <link rel="stylesheet" href="css/app.css">

  <style>
    #image {
      object-fit: fill;
    }

  </style>

  <title>๐ดMatjip</title>
</head>

<body>

<%@ include file="/WEB-INF/views/include/nav.jsp" %>

<div class="b-example-divider"></div>


<section id="top">
  <div class="section-content overlay d-flex justify-content-center align-items-center">
    <div class="container-xxl">
      <div class="row align-items-center">
        <div class="col-md-9 welcome main-title">
          <h1 class="welcome-title fw-light">์์งํ ๋ฆฌ๋ทฐ, ๋ฏฟ์ ์ ์๋ ํ์ !</h1>
          <div class="divider"></div>
          <div class="row welcome-desc">
            <p class="col-col-sm-10 col-md-12 lead">๋ฏฟ๊ณ  ๋ณด๋ ๋ง์ง ๋ฆฌ์คํธ, ์ง์ญ๋ณ ์ธ๊ธฐ ๋ง์ง, ์ธ๊ณ์์ ๋ง์ง ๋ฆฌ์คํธ๋ฅผ ์๊ฐ ํฉ๋๋ค.</p>
            <p class="col-col-sm-10 col-md-12 lead">๊น๋ฏผ์ฑ์ ์ฒซ ๋ฒ์งธ ํ๋ก์ ํธ ๋ง์ง ๋ธ๋ก๊ทธ์ ์์ฃผ์์ ๊ฐ์ฌํฉ๋๋ค.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="services">
  <div class="section-content">
    <div class="container services">
      <div class="services-header text-center mb-5">
        <h1 class="display-5">๋ง์ง BEST</h1>
        <div class="divider"></div>
      </div>
      <div id="slick-slide" class="sercives-body">
        <c:forEach var="item" items="${items}">
          <a href="/user/board/${item.itemId}">
            <div class="services-col mx-2 my-3">
              <div class="card" style="width: 35vh; height: 35vh;">
                <div id="imageBox" class="overlay d-flex flex-column justify-content-center align-items-center">
                  <h3>${item.name}</h3>
                  <p>์กฐํ์ ${item.viewCnt}</p>
                </div>
                  <img id="image" src="/images?itemId=${item.itemId}" alt="" class="card-img-top img-thumbnail w-100 h-100">
              </div>
            </div>
          </a>
        </c:forEach>
      </div>
    </div>
  </div>
</section>

<section id="gallery">
  <div class="section-content">
    <div class="container gallery">
      <div class="gallery-header text-center mb-5">
        <h1 class="display-4">์ง์ญ๋ณ ๋ง์ง</h1>
        <div class="divider"></div>
        <p class="lead text-secondary">์ง์ญ ๋ณ ๋ง์ง์ ์๊ฐ ํฉ๋๋ค</p>
      </div>
      <div class="row gallery-body">

        <c:forEach var="region" items="${regions}">

            <div class="col-md-4 col-sm-6 mb-4 gallery-item">
              <a href="/user/board/list?param=${region}">
                <div class="card card-body border-0 p-0">
                  <div data-id="${region}" class="overlay d-flex flex-column justify-content-center align-items-center h-100 w-100 border-2">
                    <h2 class="gallery-title">${region.description}</h2>
                    <h6>${region.description} ๋ง์ง ๋ฆฌ์คํธ</h6>
                  </div>
                </div>
              </a>
            </div>

        </c:forEach>

      </div>
    </div>
  </div>
</section>

<%--footer--%>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%--footer--%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.slim.min.js" integrity="sha512-6ORWJX/LrnSjBzwefdNUyLCMTIsGoNP6NftMy2UAm1JBm6PRZCO1d7OHBStWpVFZLO+RerTvqX/Z9mBFfCJZ4A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"
        integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="js/app.js"></script>
</body>

</html>