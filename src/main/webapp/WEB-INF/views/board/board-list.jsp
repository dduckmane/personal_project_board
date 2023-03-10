<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="../include/static-head.jsp" %>
    <title>π΄Matjip</title>
    <%--  custom css--%>
    <link rel="stylesheet" href="/css/boardList.css">
</head>
<style>
    .btn {
        height: 2.4rem;
    }
    .btn {
        font-size: 1rem;
    }
    #content {
        width: 20rem;
      }
    #image {
        width: 25vw;
        height: 20vw;
        object-fit: fill;
    }
    .card {
        border: 0px;
    }
    .filter {
        width: 95vw;
    }
    @media (max-width: 768px) {
        #image {
            width: 100vw;
            height: 90vw;
            object-fit: fill;
        }
    }
    @media (min-width: 768px) {
        .filter {
            width: 750px;
        }
    }

    @media (min-width: 992px) {
        .filter {
            width: 970px;
        }
    }

    @media (min-width: 1200px) {
        .filter {
            width: 50vw;
        }
    }

</style>
<body>

<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<%--top μμ­--%>
<section id="top">
    <div class="section-content overlay d-flex justify-content-center align-items-center">
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="col-md-9 welcome main-title">
                    <h1 class="welcome-title fw-light">
                        &nbsp ${title} νμ΄μ§μ μ€μ κ±Έ νμν©λλ€.
                    </h1>
                </div>
            </div>
        </div>
    </div>
</section>

<%--filter μμ­--%>
<section id="filterList">
    <div class="d-flex container-fluid mt-2 pe-0">
        <div class="dropdown">
            <%--λν νν° λ²νΌ--%>
            <button class="btn btn-outline-success dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                νν° μ μ©
            </button>
<%--            νν° λͺ©λ‘ λμ΄--%>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li class="dropdown-item">
<%--                    form λ°μ΄ν°λ‘ μλ²μ μ μ‘--%>
                    <form class="" action="">
                        <input type="hidden" name="${requestParam}" value="${Param}">
<%--                        κ°μ₯ μμ row--%>
                        <div class="filter row">
<%--                            νν° 3κ°λ₯Ό κ΄λ¦¬--%>
                            <div class="col-lg-6 col-12 pe-2">
<%--                                νν° 3κ°μ row--%>
                                <div class="row">
<%--                                    νν° 1--%>
                                    <div class="col-md-4 pe-md-0" >
                                        <div id="money">
                                            <select class="form-select" id="inputGroupSelect4"
                                                    aria-label="Example select with button addon"
                                                    name="price">

                                                <option value="">κ°κ²© λ</option>
                                                <option value="10000">~10000</option>
                                                <option value="20000">10000 ~ 20000</option>
                                                <option value="30000">20000 ~ 30000</option>
                                                <option value="excess">30000 ~</option>

                                            </select>
                                        </div>
                                    </div>
    <%--                                    νν° 2--%>
                                    <div class="col-md-4 p-md-0">
                                        <div id="tag">
                                            <select class="form-select" id="inputGroupSelect3"
                                                    aria-label="Example select with button addon"
                                                    name="tag">

                                                <option value="">νκ·Έλ‘ κ²μ</option>
                                                <c:forEach var="tag" items="${tags}">
                                                    <option value="${tag}">${tag.description}</option>
                                                </c:forEach>

                                            </select>
                                        </div>
                                    </div>
    <%--                                    νν° 3--%>
                                    <div class="col-md-4 p-md-0">
                                        <div id="sortBox">
                                            <select class="form-select" id="inputGroupSelect2"
                                                    aria-label="Example select with button addon"
                                                    name="sort">

                                                <option value="">μ λ ¬</option>
                                                <option value="createdDateDESC">μ΅κ·Ό μ</option>
                                                <option value="createdDateASC">μ€λλ μ</option>
                                                <option value="viewCnt">μ‘°νμ μ</option>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
<%--                            κ²μ μͺ½ νν° λΆλΆ--%>
                            <div class="col-lg-6 pt-2 pt-lg-0 col-12 pe-2">
                                <div class="row d-flex  align-items-center">
<%--                                    νν° 1 κ²μ-λ²νΌ --%>
                                    <div class="col-3 p-lg-0 pe-0">
                                        <div id="searchBox">
                                            <select class="form-select" id="inputGroupSelect"
                                                    aria-label="Example select with button addon"
                                                    onchange="searchCondition()">

                                                <option class="opt" value="">κ²μ νν°</option>
                                                <option class="opt" value="title">μ λͺ©</option>
                                                <option class="opt" value="name">μμ±μ</option>
                                                <option class="opt" value="all">μμ±μ+μ λͺ©</option>

                                            </select>
                                        </div>
                                    </div>
<%--                                    νν° 2: input μμ­--%>
                                    <div class="col-6 p-0">
                                        <div id="content d-flex w-100">
                                            <input id="filterInput" name="" class="form-control input" type="search" placeholder="Search" aria-label="Search">
                                        </div>
                                    </div>
<%--                                    νν° 3: λ²νΌ--%>
                                    <div class="col-3 pe-3">
                                        <button class="d-flex w-100 btn btn-outline-success justify-content-center align-items-center" type="submit">Search</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </li>
            </ul>
        </div>
<%--μ€λ₯Έ μͺ½ νν° μμ--%>
        <div class="ms-auto">
            <c:choose>
<%--                1. λ©μΈ μΉ΄νκ³ λ¦¬ μμ­μμ κΈμ μμ± μ--%>
                <c:when test="${listParam.groupId!=null}">
                    <a class="btn btn-outline-success navbar-brand me-0" href="/user/board/save/${listParam.groupId}">κΈμ°κΈ°</a>
                </c:when>
<%--                2. λ©μΈ μΉ΄νκ³ λ¦¬ μΈμμ κΈμ μμ±μ --> λͺ¨λ¬ μμ± ν μΉ΄νκ³ λ¦¬λ₯Ό μ ν --%>
                <c:otherwise>
                    <button type="button" class="btn btn-outline-success navbar-brand me-0" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        κΈμ°κΈ°
                    </button>

                    <!-- Modal μμ­ -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">κΈμ°κΈ°</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    μΉ΄νκ³ λ¦¬λ₯Ό κ³ λ₯΄μΈμ
                                </div>

                                <div class="modal-footer">
                                    <a class="btn btn-outline-success navbar-brand me-0" href="/user/board/save/1">νμ</a>
                                    <a class="btn btn-outline-success navbar-brand me-0" href="/user/board/save/2">μΌμ</a>
                                    <a class="btn btn-outline-success navbar-brand me-0" href="/user/board/save/3">μ€μ</a>
                                    <a class="btn btn-outline-success navbar-brand me-0" href="/user/board/save/4">μμ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            <a class="m-0 btn btn-outline-success navbar-brand" href="/user/board/list?${requestParam}=${Param}">νν° μ΄κΈ°ν</a>
        </div>

    </div>
</section>


<div style = "padding: 3rem 3rem;"></div>

<!-- λ¦¬μ€νΈ μμ -->
<section id="boardList">
    <div class="row">
        <c:forEach var="item" varStatus="status" items="${BoardDtoList}">
            <div class="col-md-3 col-sm-6 p-0">
                <div class="col-md">
                    <div class="card mb-3 p-0 d-flex justify-content-center align-items-center">
                        <a href="/user/board/${item.id}">
                            <img id="image" data-item-id="${item.id}" class="card-img card-img-center img-fluid img-thumbnail" src="" alt="Card image" >
                        </a>
                        <div class="card-body p-1 m-0 d-flex flex-column justify-content-center align-items-center">
                            <h5 class="card-title">${item.subTitle} <c:if test="${item.newArticle}"><img src="https://img.icons8.com/office/16/null/new.png"/></c:if></h5>
                            <p class="card-text p-0 m-0 text-align">
                                μ‘°νμ: ${item.viewCnt}
                            </p>
                            <input type="checkbox" class="btn-check" name="options" id="${item.id}">
                            <label class="btn btn-outline-danger p-0 d-flex justify-content-center align-items-center" for="${item.id}">π</label>
                        </div>
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>
</section>


<!-- pagination μμ -->
<section>
    <div class="container mt-3">
        <ul class="pagination justify-content-center">
            <c:if test="${not pageMaker.first}">
                <li class="page-item"><a id="prevPage" class="page-link" href="">μ΄μ </a></li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item ${pageMaker.nowPage == num ? 'active' : ''}"><a data-id="${num-1}" class="page-link pageList" href="">${num}</a></li>
            </c:forEach>

            <c:if test="${not pageMaker.last}">
                <li class="page-item"><a id="postPage" class="page-link" href="">λ€μ</a></li>
            </c:if>
        </ul>
    </div>
</section>
<!-- pagination μ’λ£ -->

<!-- footer μμ -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<!-- footer μ’λ£ -->

<script>

  function showImage(){

    const $thumbList = document.querySelectorAll('img[data-item-id]');
    for (let $thumb of [...$thumbList]) {
      let itemId = $thumb.dataset.itemId;
        fetch('/images?itemId=' + itemId)
                .then(res => res.blob())
                .then(img => {
                  const url = URL.createObjectURL(img);
                  $thumb.src = url;
                });
    }
  }

  function searchCondition(){
      let select = document.getElementById('inputGroupSelect');
      let condition1 = select.options[select.selectedIndex].value;

      let filterInput = document.getElementById('filterInput');
      filterInput.name=condition1;
  }

  function choiceBoard(){
      let choices = document.querySelectorAll('#boardList .btn-check');

      for(let choice of [...choices]){
          choice.addEventListener("click",e=>{

              console.log(choice.id)

              const choiceData = {
                  boardId: choice.id
              }
              const reqInfo = {
                  method: 'POST'
                  , headers: {
                      'content-type': 'application/json'

                  }
                  , body: JSON.stringify(choiceData)

              }
              fetch('/user/choice',reqInfo);
          })
      }

  }
  function checkedChoiceButton(){
      fetch('/user/choice')
          .then(res => res.json())
          .then(checkedIdList => {
              for(let boardId of [...checkedIdList]){
                  let board = document.getElementById(boardId);
                  board.checked=true;
              }
          })
  }
  function setPageUrl(){
      const url =  document.location.href;

      let pageList = document.querySelectorAll('.pageList');

      //νμ΄μ§ λ§ν¬ κ±ΈκΈ°
      for (let page of [...pageList]) {
          let id = page.dataset.id;
          if(!url.includes('page')){
              page.href=url+"&page="+id;
          }else {
              let index = url.indexOf('page');
              let originUrl = url.substring(0,index-1);

              page.href=originUrl+"&page="+id;
          }
      }
      //μ΄μ  νμ΄μ§ λ§ν¬ κ±ΈκΈ°
      let prevPage = document.getElementById('prevPage');

      if(prevPage!=null){
          let lastIndex = url.lastIndexOf('=');
          let prevUrl = url.substring(0,lastIndex+1);
          let number =Number(url.substring(lastIndex+1));
          prevPage.href=prevUrl+(number-1);

      }

      //λ€μ νμ΄μ§λ§ν¬ κ±ΈκΈ°
      let postPage = document.getElementById('postPage');
      if (!url.includes('page')){
          postPage.href=url+"&page=1";
      } else {
          let lastIndex = url.lastIndexOf('=');
          let postUrl = url.substring(0,lastIndex+1);
          let number =Number(url.substring(lastIndex+1));
          postPage.href=postUrl+(number+1);
      }
  }



  (function (){
    choiceBoard();
    showImage();
    checkedChoiceButton();
    setPageUrl();

  })();
</script>
</body>
</html>