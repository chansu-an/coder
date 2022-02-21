<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
var test = true
function testttt(n) {
	if(test){
		document.getElementById('test'+n).className = 'navbar-collapse collapse show';
		 test = false;
	}else{
		document.getElementById('test'+n).className = 'navbar-collapse collapse';
		 test = true;
		
	}
};


</script>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
                <!-- Page content-->
    <c:choose>
    	<c:when test="${map.IDENTI_TYPE == '1' }">
			<h2>공지사항</h2>   	
    	</c:when>
    	<c:when test="${map.IDENTI_TYPE == '2' }">
			<h2>QnA</h2>   	
    	</c:when>
    	<c:when test="${map.IDENTI_TYPE == '3' }">
			<h2>자유게시판</h2>   	
    	</c:when>
    </c:choose>
	<table class="board_view"> 
		<colgroup> 
			<col width="15%"/> 
			<col width="35%"/> 
			<col width="15%"/> 
			<col width="35%"/>
		</colgroup>
		<tbody> 
			<tr> 
				<th scope="row">글 번호</th> 
				<td>${map.BOARD_NO }</td> 
				<th scope="row">조회수</th> 
				<td>${map.READ_COUNT }</td>				  			
			</tr>
			<tr>
				<th scope="row">추천수</th> 
				<td>${map.RECOMMEND_COUNT }</td>
				<th scope="row">신고수</th> 
				<td>${map.REPORT_COUNT }</td>
			</tr> 
			<tr> 
				<th scope="row">작성자</th> 
				<td>${map.NICK_NAME }</td> 
				<th scope="row">작성시간</th> 
				<td>${map.BOARD_DATE }</td> 
			</tr> 
			<tr> 
				<th scope="row">제목</th> 
				<td colspan="3">${map.TITLE }</td> 
			</tr> 
			<tr> 
				<td colspan="4">${map.CONTEXT }</td> 
			</tr> 
			<tr> 
				<th scope="row">첨부파일</th> 
				<td colspan="3"> 
				<c:forEach var="row" items="${filelist }"> 
					<input type="hidden" id="FILE_NO" value="${row.FILE_NO }"> 
					<a href="/net/common/downloadFile.do?FILE_NO=${row.FILE_NO }" name="file">${row.ORIGINAL_FILE_NAME }</a> 
					(${row.FILE_SIZE }kb) 
				</c:forEach> 
				</td> 
			</tr> 
		</tbody> 
	</table> 
	<br/>
	<!-- 작성자만 가능 -->
	<a href="/net/board/modify.do?IDENTI_TYPE=${map.IDENTI_TYPE}&BOARD_NO=${map.BOARD_NO}" class="btn" id="write">수정하기</a>
	<a href="/net/board/delete.do?IDENTI_TYPE=${map.IDENTI_TYPE}&BOARD_NO=${map.BOARD_NO}" class="btn" id="delete">삭제하기</a>
	<a href="/net/board/openBoardList.do?IDENTI_TYPE=${map.IDENTI_TYPE }" class="btn" id="boardList">목록보기</a>
	
	<!-- 스크랩하기 -->
	
	
	<!-- 신고, 추천 -->
	<!-- 신고하기 누르면 REPORT_COUNT + 1, 추천하기 누르면 RECOMMEND_COUNT + 1 -->
	<div>
	<a href="/net/board/recommend.do?IDENTI_TYPE=${map.IDENTI_TYPE}&BOARD_NO=${map.BOARD_NO}" class="btn" id="recommend">추천하기</a>
	<a href="/net/board/report.do?IDENTI_TYPE=${map.IDENTI_TYPE}&BOARD_NO=${map.BOARD_NO}" class="btn" id="report">신고하기</a>	
	</div>
	
	<!-- 댓글 리스트 -->
	<div id="reply">
	  <div>댓글 <c:out value="${count.COUNT }"></c:out></div>
	  <c:if test="${bestcomment.RECOMMAND_COUNT != '0' }">
	  <div>
	  	<p>
			작성자 : ${bestcomment.NICK_NAME}<br />
			작성 날짜 : ${bestcomment.REPLY_DATE } 
		</p>			
		<p>${bestcomment.CONTEXT}               		
			<a href="/net/board/commentDelete.do?RE_NO=${bestcomment.RE_NO }&BOARD_NO=${map.BOARD_NO}" class="btn">삭제</a>	
		</p>
	  </div>
	  </c:if>
	  <ol class="replyList">
	    <c:forEach items="${list}" var="row">
	    		<div  onclick="testttt(${row.RE_NO})">
			        <p>
			        작성자 : ${row.NICK_NAME} / ${row.REF_STEP }<br />
			        작성 날짜 : ${row.REPLY_DATE } 
			        </p>			
			        <p>${row.CONTEXT}               		
			        	<a href="/net/board/commentDelete.do?RE_NO=${row.RE_NO }&BOARD_NO=${map.BOARD_NO}" class="btn">삭제</a>	
			        </p>
			    </div>
			    <div id="test${row.RE_NO}" class="navbar-collapse collapse " >
			    	<label for="content">댓글 작성</label>
        				<form action="../board/commentInsert.do" method="post">
            			<div class="input-group">
             		  	<input type="hidden" name="BOARD_NO" value="${map.BOARD_NO}"/>
               			<input type="hidden" name="IDENTI_TYPE" value="${map.IDENTI_TYPE}"/>
               			<input type="hidden" name="USER_NO" value="${session.USER_NO}"/>
               			<input type="hidden" name="REF_NO" value="${row.REF_NO}"/>
               			<input type="hidden" name="REF_STEP" value="${row.REF_STEP}"/>
               			<input type="text" id="CONTEXT" name="CONTEXT" placeholder="내용을 입력하세요." style="width:60%;;font-size:15px;"/>
              			 <span class="input-group-btn">
                    <button class="btn btn-default" name="commentInsertBtn">등록</button>
               </span>
            </div>
        </form>
			    </div>		        
	    </c:forEach>   
	  </ol>
	</div>
	<div class="container">
        <label for="content">댓글 작성</label>
        <form action="/net/board/commentInsert.do" method="post">
            <div class="input-group">
               <input type="hidden" name="BOARD_NO" value="${map.BOARD_NO}"/>
               <input type="hidden" name="IDENTI_TYPE" value="${map.IDENTI_TYPE}"/>
               <input type="hidden" name="USER_NO" value="${session.USER_NO}"/>
               <input type="text" id="CONTEXT" name="CONTEXT" placeholder="내용을 입력하세요." style="width:60%;;font-size:15px;"/>
               <span class="input-group-btn">
                    <button class="btn btn-default" name="commentInsertBtn">등록</button>
               </span>
            </div>
        </form>
    </div>
    <script type="text/javascript">
    function fn_addFile(){if(gfv_count>=4){
		alert("ㅊㄴㅇㄴ")
		return;
	}alert(gfv_count)
		var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
		
		$("#fileDiv").append(str);
		
		
		$("a[name='delete']").on("click", function(e){ //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
			
		});
		++gfv_count
	}
    </script>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>

</body>
</html>