<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>


    <%@include file="../include/static-head.jsp" %>

    <style>


        .form-container {
            width: 500px;
            margin: auto;
            padding: 20px;
            background-image: linear-gradient(135deg, #a1c4fd, #fbc2eb);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            font-size: 18px;
        }

        .form-container h1 {
            font-size: 40px;
            font-weight: 700;
            letter-spacing: 10px;
            text-align: center;
            margin-bottom: 20px;
            color: #ffffff;
        }

        .form-container h2 {
            font-size: 30px;
            color: #222;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-size: 20px;
        }

        #title, #writer {
            font-size: 18px;
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 2px solid #ffffff;
            border-radius: 8px;
            margin-bottom: 10px;
            background-color: rgba(255, 255, 255, 0.8);
        }

        #content {
            height: 400px;
            font-size: 18px;
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 2px solid #ffffff;
            border-radius: 8px;
            margin-bottom: 10px;
            background-color: rgba(255, 255, 255, 0.8);
        }

        textarea {
            resize: none;
            height: 200px;
        }

        .buttons {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        button {
            font-size: 20px;
            padding: 10px 20px;
            border: none;
            margin-right: 10px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
        }

        button.list-btn {
            background: #e61e8c;
        }

        button:hover {
            background-color: #3d8b40;
        }

        button.list-btn:hover {
            background: #e61e8c93;
        }

        /* 페이지 css */
        /* 페이지 액티브 기능 */
        .pagination .page-item.p-active a {
            background: #333 !important;
            color: #fff !important;
            cursor: default;
            pointer-events: none;
        }

        .pagination .page-item:hover a {
            background: #888 !important;
            color: #fff !important;
        }

        /* 댓글 프로필 */
        .profile-box {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            overflow: hidden;
            margin: 10px auto;
        }

        .profile-box img {
            width: 100%;
        }

        .reply-profile {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 10px;

        }


    </style>
</head>
<body>

<%@include file="../include/header.jsp" %>

<div id="wrap" class="form-container">
    <h1>${b.boardNo}번 게시물 내용~ </h1>
    <h2># 작성일자: ${b.regDate}</h2>

    <label for="writer">작성자</label>
    <input type="text" id="writer" name="writer" value="${b.writer}" readonly>

    <label for="title">제목</label>
    <input type="text" id="title" name="title" value="${b.title}" readonly>

    <label for="content">내용</label>
    <div id="content">${b.content}</div>
    <div class="buttons">
        <button class="list-btn" type="button"
                onclick="location.href='/board/list?pageNo=${s.pageNo}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}'">
            목록
        </button>
    </div>

    <!-- 댓글 영역 -->

    <div id="replies" class="row">
        <div class="offset-md-1 col-md-10">
            <!-- 댓글 쓰기 영역 -->
            <div class="card">
                <div class="card-body">


                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label for="newReplyText" hidden>댓글 내용</label>
                                    <textarea rows="3" id="newReplyText" name="replyText" class="form-control"
                                              placeholder="댓글을 입력해주세요."></textarea>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">


                                    <div class="profile-box">
                                                <img src="/assets/img/anonymous.jpg" alt="프사">
                                    </div>


                                    <label for="newReplyWriter" hidden>댓글 작성자</label>
                                    <input id="newReplyWriter" name="replyWriter" type="text"
                                           class="form-control" placeholder="작성자 이름"
                                           style="margin-bottom: 6px;">
                                    <button id="replyAddBtn" type="button"
                                            class="btn btn-dark form-control">등록
                                    </button>
                                </div>
                            </div>
                        </div>

                </div>
            </div> <!-- end reply write -->

            <!--댓글 내용 영역-->
            <div class="card">
                <!-- 댓글 내용 헤더 -->
                <div class="card-header text-white m-0" style="background: #343A40;">
                    <div class="float-left">댓글 (<span id="replyCnt">0</span>)</div>
                </div>

                <!-- 댓글 내용 바디 -->
                <div id="replyCollapse" class="card">
                    <div id="replyData">
                        <!--
                        < JS로 댓글 정보 DIV삽입 >
                    -->
                    </div>

                    <!-- 댓글 페이징 영역 -->
                    <ul class="pagination justify-content-center">
                        <!--
                        < JS로 댓글 페이징 DIV삽입 >
                    -->
                    </ul>
                </div>
            </div> <!-- end reply content -->
        </div>
    </div> <!-- end replies row -->

    <!-- 댓글 수정 모달 -->
    <div class="modal fade bd-example-modal-lg" id="replyModifyModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header" style="background: #343A40; color: white;">
                    <h4 class="modal-title">댓글 수정하기</h4>
                    <button type="button" class="close text-white" data-bs-dismiss="modal">X</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-group">
                        <input id="modReplyId" type="hidden">
                        <label for="modReplyText" hidden>댓글내용</label>
                        <textarea id="modReplyText" class="form-control" placeholder="수정할 댓글 내용을 입력하세요."
                                  rows="3"></textarea>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button id="replyModBtn" type="button" class="btn btn-dark">수정</button>
                    <button id="modal-close" type="button" class="btn btn-danger"
                            data-bs-dismiss="modal">닫기
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- end replyModifyModal -->


</div>

    <script>

        const URL = 'api/v1/replies'; // 댓글과 관련된 요청 url을 전역변수화.
        const bno = '${b.boardNo}'; // 게시글 번호를 전역변수화.

        // 서버에 실시간으로 비동기 통신을 해서 JSON을 받아오는 함수
        function fetchGetReplies() {
            // fetch 함수를 통해 비동기통신 진행할 때 GET요청은 요청에 관련한 객체를 따로 전달하지 않습니다.
            // method를 get이라고 얘기하지 않고, 데이터 전달 시에는 URL에 포함시켜서 전달.
            fetch(`${URL}/${bno}`)
        }


        const $addBtn = document.getElementById('replyAddBtn');

        $addBtn.onclick = e => {

            const $replyText = document.getElementById('newReplyText'); // 댓글 내용
            const $replyWriter = document.getElementById('newReplyWriter'); // 댓글 작성자

            // 공백이 제거된 값을 얻음.
            const textVal = $replyText.value.trim();
            const writerVal = $replyWriter.value.trim();

            // 사용자 입력값 검증
            if (textVal === '') {
                alert('댓글 내용은 필수값입니다!!');
                return;
            } else if (writerVal === '') {
                alert('댓글 작성자는 필수값입니다!!');
                return;
            } else if (writerVal.length < 2 || writerVal.length > 8) {
                alert('댓글 작성자는 2글자에서 8글자 사이로 작성하세요!');
                return;
            }

            // 서버로 보낼 데이터 준비.
            const payload = {
                text: textVal,
                auth: writerVal,
                bno: bno
            };

            // 요청 방식 및 데이터를 전달할 정보 객체 만들기 (POST)
            const requsetInfo = {
                method: 'POST',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify(payload) // js 객체를 JSON으로 변환해서 body에 추가
            };

            // 서버에 POST 요청 보내기
            fetch(URL, requsetInfo)
                // then(callbackFn) -> 비동기 통신의 결과를 확인하기 위해 then과 콜백함수 전달
                // 콜백 함수의 매개변수로 응답정보가 담긴 Response 객체가 전달되고,
                // Response 객체에서 json 데이터를 꺼내고 싶으면 json(), 단순 텍스트라면 text().
                .then(res => {
                    console.log(res.status); // 서버에서 전달한 응답 상태 코드
                    if (res.status === 200) {
                        alert('댓글이 정상 등록되었습니다.');
                        return res.text();
                    } else {
                        alert('입력값에 문제가 있습니다! 입력값을 다시 확인해 보세요!');
                        return res.text();
                    }
                })
                .then(data => {
                    console.log('응답 성공!', data);
                    // 댓글 작성자 input과 댓글 내용 text를 지워주자.
                    $replyText.value = '';
                    $replyWriter.value = '';

                    // 댓글 목록 비동기 요청이 들어가야 한다.
                    // 따로 함수로 빼 주겠습니다. 
                    // (등록 이후 뿐만 아니라 게시글 상세보기에 처음 들어왔을 때도 호출되어야 하니까)
                    fetchGetReplies();
                });




        }

    </script>



</body>
</html>