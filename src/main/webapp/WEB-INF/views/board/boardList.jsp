<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>


</head>
<style>
    .head-wrapper {
        width: 100vh;
        margin: 100px auto;
        position: relative;
    }

    .head-wrapper #save-Btn {
        position: absolute;
        right: 50px;
        top: 50px;
    }

    .card-wrapper {
        margin: 100px auto;
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
</style>


<body>
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