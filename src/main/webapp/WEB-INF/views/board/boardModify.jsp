<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>
    <style>
        .write-wrapper {
            border: 1px solid #000;
            margin: 100px auto;
            width: 60vh;
            padding: 10px;
        }

        .write-wrapper .write-header {
            text-align: center;
            margin-bottom: 10px;
            font-size: 2em;
        }

        .write-wrapper .head-wrapper {
            display: flex;
            justify-content: start;
        }

        #content-label {
            display: block;
        }

        textarea {
            margin: 10px auto;
            resize: none;
            height: 200px;
            width: 400px;
        }

        .write-wrapper #buttons {
            display: flex;
            justify-content: end;

        }

        #buttons button {
            margin: 5px;

        }
    </style>
</head>

<body>

    <div class="write-wrapper">

        
        <form action="/hrms/board-modify" method="post">
            <input type="hidden" name="boardNo" value="${m.boardNo}">
            <header class="write-header">수정하기</header>
            <div class="head-wrapper">
                <label id="write-title">제목</label>
                <input type="text" name="bdTitle" value="${m.bdTitle}">
                <label id="bdTypeName">타입<label>
                        <select name="bdType" value="${m.bdType}">
                            <option value="NOTICE">공지 게시판</option>
                            <option value="FREE">자유 게시판</option>
                            <option value="NONAME">익명 게시판</option>
                        </select>
            </div>
            <label id="content-label">내용</label>
            <textarea name="bdContent">${m.bdContent}</textarea>
            <div id="buttons">
                <button id="backToList">목록</button>
                <button type="submit">글쓰기</button>
        </form>
    </div>
    <!-- <form action="/test/modify" method="post">
        <div id="wrap" class="form-container">
            <h1>내용 수정 하기 </h1>
            <input type="hidden" name="boardNo" value="${c.boardNo}">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" value="${c.title}">
            <label for="content">내용</label>
            <input type="text" id="content" name="content" value="${c.content}">
            <div class="buttons">
                <button class="list-btn" type="button">목록</button>
                <button type="submit">수정완료</button>
            </div>

        </div>
    </form> -->


</body>

</html>