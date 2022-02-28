<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
var test = true
function testttt() {
	
	alert(test);
	if(test){
		document.getElementById('test1').className = 'navbar-collapse collapse show';
		 test = false;
	}else{
		document.getElementById('test1').className = 'navbar-collapse collapse';
		 test = true;
		
	}
	
};
</script>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%> 
                <!-- Page content-->
<%--     <c:choose>
    	<c:when test="${map.IDENTI_TYPE == '1' }">
			<h2>공지사항</h2>   	
    	</c:when>
    	<c:when test="${map.IDENTI_TYPE == '2' }">
			<h2>QnA</h2>   	
    	</c:when>
    	<c:when test="${map.IDENTI_TYPE == '3' }">
			<h2>자유게시판</h2>   	
    	</c:when>
    </c:choose> --%>
	<table class="board_list">
		<colgroup>
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">내용</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
				<th scope="col">추천수</th>
				<th scope="col">신고수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty map}">
					<tr>
						<td>${map.BOARD_NO }</td>
 						<td>${map.TITLE }</td>
						<td>${map.NICK_NAME }</td>
						<td>${map.CONTEXT }</td>
						<td>${map.BOARD_DATE }</td>
						<td>${map.READ_COUNT }</td>
						<td>${map.RECOMMEND_COUNT }</td>
						<td>${map.REPORT_COUNT }</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			

		</tbody>
	</table>
	<a href="/net/board/adminList.do" class="btn" id="adminList">목록보기</a>
	
	<!-- 댓글 리스트 -->
	<div id="reply">
	  <div>댓글 <c:out value="${COUNT }"></c:out></div>
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
	    	<c:choose>
	    	
	    		<c:when test="${row.REF_STEP == '0' }">
	    		<div onclick="testttt()">
			        <p>
			        작성자 : ${row.NICK_NAME} / ${row.REF_STEP }<br />
			        작성 날짜 : ${row.REPLY_DATE } 
			        </p>			
			        <p>${row.CONTEXT}               		
			        	<a href="/net/board/commentDelete.do?RE_NO=${row.RE_NO }&BOARD_NO=${map.BOARD_NO}" class="btn">삭제</a>	
			        </p>
			    </div>
			    <div id="test1" class="navbar-collapse collapse " >
			    테스트
			    </div>		        
		        </c:when>
	    		<c:when test="${row.REF_STEP == '1' }">
	    		<div>
			        <p>
			        작성자 : ${row.NICK_NAME} / ${row.REF_STEP }<br />
			        작성 날짜 : ${row.REPLY_DATE } 
			        </p>			
			        <img src="../img/arrow.png" width="30" height="30"/>${row.CONTEXT}
			    </div>			        
		        </c:when>
	    		<c:when test="${row.REF_STEP == '2' }">
	    		<div >
			        <p>
			        작성자 : ${row.NICK_NAME} / ${row.REF_STEP }<br />
			        작성 날짜 : ${row.REPLY_DATE } 
			        </p>			
			        <img src="../img/arrow.png" width="30" height="30"/>${row.CONTEXT}	
			    </div>	        
		        </c:when>
	    		<c:when test="${row.REF_STEP == '3' }">
	    		<div>
			        <p>
			        작성자 : ${row.NICK_NAME} / ${row.REF_STEP }<br />
			        작성 날짜 : ${row.REPLY_DATE } 
			        </p>			
			        <img src="../img/arrow.png" width="30" height="30"/>${row.CONTEXT}
			    </div>		        
		        </c:when>
	        </c:choose>
	    </c:forEach>   
	  </ol>
	</div>
	<div class="container">
        <label for="content">댓글 작성</label>
        <form action="/net/board/commentInsert.do" method="post">
            <div class="input-group">
               <input type="hidden" name="BOARD_NO" value="${map.BOARD_NO}"/>
               <input type="hidden" name="USER_NO" value="${session.USER_NO}"/>
               <input type="text" id="CONTEXT" name="CONTEXT" placeholder="내용을 입력하세요." style="width:60%;;font-size:15px;"/>
               <span class="input-group-btn">
                    <button class="btn btn-default" name="commentInsertBtn">등록</button>
               </span>
            </div>
        </form>
    </div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>