<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="kor">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>SAMJO SANGSA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/header.css">
    <link rel="stylesheet" href="/assets/css/fixed.css">
</head>
<style>
    .head-wrapper {
        width: 100vh;
        margin: 50px auto;
        position: relative;
    }

    .head-wrapper #save-Btn {
        position: absolute;
        right: 50px;
        top: 50px;
    }

    .card-wrapper {
        margin: 10px auto;
        border: 2px solid #000;
        width: 1000px;
        display: flex;
        justify-content: center;
        flex-wrap: wrap;

    }

    .main-box {
        border: 1px solid #000;
        width: 200px;
        height: 200px;
        padding: 20px;
        margin: 50px 10px;
    }

    .main-box #title {
        border: 1px solid #000;
        height: 20px;
        margin-bottom: 10px;
    }

    .main-box #viewCount {
        border: 1px solid #000;
        height: 20px;
    }

    .main-box .date-count-wrapper {
        display: flex;
        justify-content: space-around;
    }

    .main-box #date {
        border: 1px solid #000;
        height: 20px;
    }

    .main-box #content {
        margin-top: 10px;
        border: 1px solid #000;
        height: 100px;
    }

    .search {
        display: flex;
        justify-content: center;

    }

    .select-wrapper {
        margin-top: 20px;
        height: 50px;
    }

    .search_box {
        width: 520px;
        height: 50px;
        border: 2px solid #03cf5d;
        display: flex;
        margin-top: 20px;
    }

    .search_box input {
        width: 90%;
        height: 46px;
        padding-left: 12px;
        padding-right: 12px;
        border: none;
        outline: none;
        font-size: 18px;

    }

    .search_box button {
        width: 10%;
        height: 46px;
        margin: 0;
        padding: 0;
        border: none;
        background: #03cf5d;
    }

    .search_box i {
        color: white;
        font-size: 22px;
        text-align: center;
    }

    #keyboard {
        color: lightgray;
        font-size: 20px;
        text-align: center;
        width: 10%;
        padding-top: 12px;
    }

    .showPage {
        display: flex;
        justify-content: center;
    }
</style>

<body>

    <header class="common_wrap">
        <section class="section-header">
            <div class="head">
                <ul>
                    <li>
                        <div class="logo-img">
                            <a href="#">
                                <img src="/assets/img/samjo-logo.png" alt="로고">
                            </a>
                        </div>
                    </li>
                    <li>삼조상사에 오신 것을 환영합니다.</li>
                    <li><a href="#"><span id="logout-button">로그아웃</span></a></li>
                </ul>
            </div>
        </section>
        <section class="section-sub-header">
            <div class="nav-bar">
                <ul>
                    <li><a href="#">HOME</a></li>
                    <li><a href="/hrms/board-list">게시판</a></li>
                    <li><a href="#">결재</a></li>
                    <li><a href="#">메일</a></li>
                    <li><a href="#">동호회</a></li>
                </ul>
            </div>
        </section>

    </header>
    <section class="section-left-body">
        <div id="left-body">
            <div class="left-fix">
                <div class="line">
                    <div class="information-box">
                        <ul id="profile">
                            <li id="photo"><a href="#">사원사진</a></li>
                        </ul>
                        <ul id="information">
                            <li>사원번호</li>
                            <li>이름</li>
                            <li>휴대폰번호</li>
                            <li>부서</li>
                            <li>직책</li>
                            <li>
                                <button id="change-info" type="submit">수정</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!--title -->
    <header class="head-wrapper">
        <ol>
            <h1>요것은 테스트용 페이지입니다~</h1>
            <button id="save-Btn" type="button">새글 추가</button>
        </ol>

    </header>

    <!-- search bar -->
    <header class="search">
        <form action="/hrms/board-list" method="get">
            <select class="select-wrapper" name="boardType">
                <option value="title">제목</option>
                <option value="boardType">공지유형</option>
                <option value="boardContent">내용</option>
            </select>
            <div class="search_box">
                <input type="text" name="boardKeyWord" maxlength="225"> <i id="keyboard" class="fa fa-keyboard-o"></i>
                <button type="submit">검색</button>
            </div>
        </form>
    </header>


    <!-- end card container -->

    <div class="card-wrapper">
        <c:forEach var="a" items="${allList}">
            <div class="main-box">
                <button id="detail-btn" data-href="/hrms/board-detail/?boardNo=${a.boardNo}">상세보기</button>
                <button id="delete-btn" data-href="/hrms/board-delete/?boardNo=${a.boardNo}">삭제</button>
                <div id="title">${a.shortTitle}</div>
                <div class="date-count-wrapper">
                    <div id="viewCount">${a.bdType}</div>
                    <div id="date">${a.stringDate}</div>
                </div>
                <div id="content">${a.shortContent}</div>
            </div>
        </c:forEach>
    </div>

    <!-- PAGINATION -->
    <nav class="showPage" aria-label="Page navigation example">
        <ul class="pagination">
            <a class="page-link" href="/hrms/board-list/?boardPageNo=1" aria-label="Previous"><span
                    aria-hidden="true">&laquo;</span>
            </a>
            <c:if test="${boardPageMaker.prev}">
                <li class="page-item"><a class="page-link"
                        href="/hrms/board-list/?boardPageNo=${boardPageMaker.start-1}">Previous</a></li>
            </c:if>
            <c:forEach var="i" begin="${boardPageMaker.start}" end="${boardPageMaker.end}">
                <li class="page-item"><a class="page-link" href="/hrms/board-list/?boardPageNo=${i}">${i}</a></li>
            </c:forEach>
            <c:if test="${boardPageMaker.next}">
                <li class="page-item"><a class="page-link"
                        href="/hrms/board-list/?boardPageNo=${boardPageMaker.end+1}">Next</a></li>
            </c:if>
            <a class="page-link" href="/hrms/board-list/?boardPageNo=${boardPageMaker.final_page}"
                aria-label="Next"><span aria-hidden="true">&raquo;</span>
            </a>
        </ul>
    </nav>

<!-- 

    <%--    <section class="calendar">--%>
    <%--        <div id="calendar">--%>
    <%--            <table>--%>
    <%--                <tr>--%>
    <%--                    <th colspan="7">--%>
    <%--                        <button onclick="prevMonth()">&#8249;</button>--%>
    <%--                        <span id="currentMonth"></span>--%>
    <%--                        <button onclick="nextMonth()">&#8250;</button>--%>
    <%--                    </th>--%>
    <%--                </tr>--%>
    <%--                <tr>--%>
    <%--                    <th>일</th>--%>
    <%--                    <th>월</th>--%>
    <%--                    <th>화</th>--%>
    <%--                    <th>수</th>--%>
    <%--                    <th>목</th>--%>
    <%--                    <th>금</th>--%>
    <%--                    <th>토</th>--%>
    <%--                </tr>--%>
    <%--            </table>--%>
    <%--        </div>--%>
    <%--    </section>--%>
    </div>
    <%--<script src="calendar.js"></script>--%>
    <%--<script>--%>
    <%--    var calendar = new Calendar({--%>
    <%--        target: '#calendar',--%>
    <%--        date: new Date(),--%>
    <%--        onSelect: function(date) {--%>
    <%--            console.log(date);--%>
    <%--        }--%>
    <%--    });--%>
    <%--</script>--%>

    <%--<script src="calendar.js"></script>--%>
    <%--<script>--%>
    <%--    var calendar = new Calendar({--%>
    <%--        target: '#calendar',--%>
    <%--        date: new Date(),--%>
    <%--        onSelect: function(date) {--%>
    <%--            console.log(date);--%>
    <%--        }--%>
    <%--    });--%>
    <%--</script>--%> -->
    <script>
        //저장기능
        const $save = document.getElementById('save-Btn');
        $save.onclick = function () {
            window.location.href = '/hrms/board-save/'
        };

        //삭제기능
        const $cardWrapper = document.querySelector('.card-wrapper')
        const $mainBox = document.querySelector('.main-box');

        $cardWrapper.addEventListener('click', e => {
            if (e.target.matches('.main-box *')) {
                const $delBtn = e.target.closest('#delete-btn');
                window.location.href = $delBtn.dataset.href;
            }

        })

        //디테일 기능

        $cardWrapper.addEventListener('click', e => {
            if (e.target.matches('.main-box *')) {
                const $detail = e.target.closest('#detail-btn');
                window.location.href = $detail.dataset.href;
            }

        })
    </script>

</body>

</html>