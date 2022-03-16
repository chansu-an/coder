<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

</script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<!-- Page content-->
<body>

	<div class="wrapper ">

		<div class="main-panel" id="main-panel">
			<!-- Navbar -->
			<!-- End Navbar -->
			<div class="panel-header panel-header-sm"></div>
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
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
									<c:when test="${map.IDENTI_TYPE == '4' }">
										<h2>건의사항</h2>
									</c:when>
								</c:choose>
								<!-- 게시판 -->

								<div class="card-body">
									<div class="table2-responsive">
										<table class="board_view">
											<colgroup>
												<col width="15%" />
												<col width="25%" />
												<col width="15%" />
												<col width="25%" />
												<col width="10%" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">글 번호</th>
													<td>${map.BOARD_NO }</td>
													<th scope="row">조회수</th>
													<td>${map.READ_COUNT }</td>
													<th rowspan="6" align="center"><a href="#this" id="scrap"><i id="scrap" class="fa fa-bookmark fa-2x" style="color: blue;"></i></a></th>
												</tr>
												<c:if test="${map.IDENTI_TYPE != '4' }">
													<tr>
														<th scope="row">추천수</th>
														<td><div id="recommend_count">${map.RECOMMEND_COUNT }</div></td>
														<th scope="row">신고수</th>
														<td><div id="report_count">${map.REPORT_COUNT }</div></td>
													</tr>
												</c:if>
												<tr>
													<th scope="row">작성자</th>
													<td><a href="../main/Mypage.do?USER_NO=${map.USER_NO }">${map.NICK_NAME }</a></td>
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
													<td colspan="3"><c:forEach var="row" items="${filelist }">
															<input type="hidden" id="FILE_NO" value="${row.FILE_NO }">
															<a href="/net/common/downloadFile.do?FILE_NO=${row.FILE_NO }" name="file">${row.ORIGINAL_FILE_NAME }</a> 
					(${row.FILE_SIZE }kb) 
				</c:forEach></td>
												</tr>
											</tbody>
										</table>
										<br />
										<!-- 작성자만 가능 -->
										<div>
											<c:if test="${sessionScope.session.USER_NO == map.USER_NO}">
												<a href="/net/board/modify.do?IDENTI_TYPE=${map.IDENTI_TYPE}&BOARD_NO=${map.BOARD_NO}" class="btn" id="write"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tools" viewBox="0 0 16 16">
  <path d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.356 3.356a1 1 0 0 0 1.414 0l1.586-1.586a1 1 0 0 0 0-1.414l-3.356-3.356a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0zm9.646 10.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708zM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11z" />
</svg> 수정하기
												</a>
											</c:if>
											<a href="/net/board/openBoardList.do?IDENTI_TYPE=${param.IDENTI_TYPE }" class="btn" id="boardList"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z" />
</svg> 목록보기
											</a>
											<!-- 신고, 추천 -->
											<!-- 신고하기 누르면 REPORT_COUNT + 1, 추천하기 누르면 RECOMMEND_COUNT + 1 -->
											<c:if test="${!empty sessionScope.session.USER_NO && map.IDENTI_TYPE != '4' }">
												<a href="#this" class="btn" id="recommend"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
  <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
</svg> 추천하기</a>
												<a href="#this" class="btn" id="report"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
</svg> 신고하기</a>
											</c:if>
										</div>
										<br />
										<!-- 댓글 리스트 -->

										<section class="mb-5">
											<div class="card bg-light">
												<div id="reply">
													<div class="card-header">
														<i class="far fa-comment-dots"></i> 댓글
														<c:out value="${count}"></c:out>
													</div>
												</div>
												<div class="card-body" >
													<c:if test="${bestcomment.RECOMMAND_COUNT != null }">
														<div class="d-flex">
															<div class="flex-shrink-0">
																<i class="fas fa-star fa-lg" style="color: currentcolor"></i>
															</div>
															<div class="ms-3">
																<div class="fw-bold">${bestcomment.NICK_NAME}/${bestcomment.REPLY_DATE }</div>
																${bestcomment.CONTEXT}
															</div>
														</div>
														<br />
													</c:if>
													<div id="comlist"></div>
													<!-- Comment form-->
													<c:if test="${!empty sessionScope.session.USER_NO }">
														<form id="commentForm" class="mb-4" action="/net/board/commentInsert.do" method="post">
															<div class="input-group">
																<input type="hidden" name="BOARD_NO" value="${map.BOARD_NO}" /> <input type="hidden" name="IDENTI_TYPE" value="${map.IDENTI_TYPE}" /> <input type="hidden" name="USER_NO" value="${session.USER_NO}" />
																<textarea class="form-control" rows="3" id="CONTEXT" name="CONTEXT" placeholder="내용을 입력하세요."></textarea>
																<span class="input-group-btn">
																	<button class="btn btn-default" id="comment">등록</button>
																</span>
															</div>
														</form>
													</c:if>
													<%-- <c:choose>
														<c:when test="${map.IDENTI_TYPE != '4' && !empty sessionScope.session.USER_NO}">
															<form class="mb-4" action="/net/board/commentInsert.do" method="post">
																<div class="input-group">
																	<input type="hidden" name="BOARD_NO" value="${map.BOARD_NO}" /> <input type="hidden" name="IDENTI_TYPE" value="${map.IDENTI_TYPE}" /> <input type="hidden" name="USER_NO" value="${session.USER_NO}" />
																	<textarea class="form-control" rows="3" id="CONTEXT" name="CONTEXT" placeholder="내용을 입력하세요."></textarea>
																	<span class="input-group-btn">
																		<button class="btn btn-default" name="commentInsertBtn">등록</button>
																	</span>
																</div>
															</form>
														</c:when>
														<c:when test="${sessionScope.session.ADMIN == 'Y'}">
															<form class="mb-4" action="/net/board/commentInsert.do" method="post">
																<div class="input-group">
																	<input type="hidden" name="BOARD_NO" value="${map.BOARD_NO}" /> <input type="hidden" name="IDENTI_TYPE" value="${map.IDENTI_TYPE}" /> <input type="hidden" name="USER_NO" value="${session.USER_NO}" />
																	<textarea class="form-control" rows="3" id="CONTEXT" name="CONTEXT" placeholder="내용을 입력하세요."></textarea>
																	<span class="input-group-btn">
																		<button class="btn btn-default" name="commentInsertBtn">등록</button>
																	</span>
																</div>
															</form>
														</c:when>
													</c:choose> --%>
													<div style="padding-left: 50%; padding-right: 50%;">
                <nav>
                    <ul class="pagination" id="paging">
                       
                    </ul>
                </nav>
            </div>
												</div>
											</div>
										</section>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">
	$(function(){
		getCommentList(1)
	});
	function page(ch) {
		var c = 1;
		c =ch
		getCommentList(c);
		/* $("#paging").ready(function(){
		 document.getElementById(c).className = 'active'
		}) */
	  
	    
	  
	};
	function comdelete(no){
		event.preventDefault();
		var no = no;
		$.ajax({
	        type:'GET',
	        url : "<c:url value='/board/commentDelete.do'/>",
	      	data : {
	      		RE_NO : no
	      	},success : function(){
	      		alert(22)
	      		getCommentList(1)
	      	},error : function(){
				alert('11');
				getCommentList(1)
			}
	      	
	})
	}
	function getCommentList(p){
		
	    var p = p;
	    $.ajax({
	        type:'GET',
	        url : "<c:url value='/board/commentList.do'/>",
	        dataType : "json",
	      	data : {
	      		BOARD_NO : ${param.BOARD_NO},
	      		IDENTI_TYPE : ${param.IDENTI_TYPE},
	      		PAG_NUM :  p
	      	},
	        success : function(data){
	        	 var html = "";
	        	 var page = "";
	        	if(data.length > 0){
	        		
	                for(i=0; i<5; i++){
	                	if(data[i].DEL_GB == 'N'){
	                	html += "<div>"
	                    html += "<input type='hidden' id=REF_NO_${var.index } value="+data[i].RE_NO+" />";
	                    html += "<input type='hidden' id=REF_STEP_${var.index } value='"+data[i].REF_STEP+"' />";
	                    html += "<div class='d-flex mb-4'>";
	                    html += "<div class='ms-3'>";
	                    html += "<div class='fw-bold'>"+data[i].NICK_NAME+"|"+ data[i].REPLY_DATE+"</div>";
	                    html += "<div  onclick = 'com("+i+","+data[i].RE_NO+","+data[i].REF_STEP+")'>"+data[i].CONTEXT+"</div>";
	                    html += "</div>";
	                    if(data[i].USER_NO==${sessionScope.session.USER_NO}){
	                    html += "&nbsp;<a onclick = 'comdelete("+data[i].RE_NO+")'><i class='fas fa-trash'></i></a>";
	                    html += "</div>";
	                    html += "<div id='coms"+data[i].RE_NO+"'></div>";
	                    }else if(${sessionScope.session.USER_NO!=null}){
	                    html += "&nbsp;<a href='#this' onclick='fn_recommendComment(${var.index});'><i class='fas fa-thumbs-up'></i></a>";
	                    html += "<div id='coms"+data[i].RE_NO+"'></div>";
	                    }
	                    html += "</div>"
	                    }else{
	                  	   html += "<div class='d-flex mb-4'>";
		                   html += "<div class='ms-3'>";
		                   html += "<div class='fw-bold'>[삭제된 댓글입니다]</div>";
		                   html += "</div>";
		                   html += "</div>";
	                    }
	                   
	                }
	                if(data[5].startpag>1){
	                   var Previous = data[5].startpag-10
	                	page += " <li onclick='page("+Previous+")' ><a aria-label='Previous'><span aria-hidden='tru'>&laquo;</span></a></li>";
	                }for(i=data[5].startpag;i<data[5].endpage;i++){
	                	page += "<li onclick='page("+i+")' id ="+i+" class='tt'><a>"+i+"</a></li>";
	                }if(data[5].endpage<data[5].maxpag){
	                	var next = data[5].startpag+10
	                	page += "<li onclick='page("+next+")' ><a aria-label='Next'><span aria-hidden='true'>&#187;</span></a></li>";
	                }
	                
	                
	            } else {
	                html += "<div>";
	                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
	                html += "</table></div>";
	                html += "</div>";
	                
	            }	$("#comlist").html(html)
	                $("#paging").html(page)
	            }

	        })}
	$('#comment').bind("click",function(e){
		e.preventDefault();
		$.ajax({
			type:'POST',
			url : "<c:url value='/board/commentInsert.do'/>",
			data : $("#commentForm").serialize(),
			success : function(data){
				 getCommentList(1);
				 $("#CONTEXT").val("");
			},
			error : function(){
				alert('11');
			}
			
		})
	})
	
	
	
    let check_recommend = true;
	$(document).ready(function(){
		if(${scrapcheck} == 1){
			$("#scrap").bind("click", function(e){ //스크랩 버튼
				e.preventDefault();
				if(${!empty session.USER_NO}){
					$.ajax({
						 url : "<c:url value='/board/deleteScrap.do?USER_NO=${sessionScope.session.USER_NO}&BOARD_NO=${map.BOARD_NO}'/>",
						 type : "post",
						 dataType : 'json',
						 contentType : "application/json; charset=UTF-8",
						 success : function(result){
							 alert("스크랩 취소");
						 },
						 error : function(){
							 alert("");
						 }
					 })					
				}else{
					alert("로그인후 사용가능합니다.");
				}	
			});
		}else{
			$("#scrap").bind("click", function(e){ //스크랩 버튼
				e.preventDefault();
				if(${!empty session.USER_NO}){
					$.ajax({
						 url : "<c:url value='/board/insertScrap.do?USER_NO=${sessionScope.session.USER_NO}&BOARD_NO=${map.BOARD_NO}'/>",
						 type : "post",
						 dataType : 'json',
						 contentType : "application/json; charset=UTF-8",
						 success : function(result){
							 alert("스크랩 완료");
							 location.reload();
						 },
						 error : function(){
							 alert("서버요청실패");
						 }
					 })					
				}else{
					alert("로그인후 사용가능합니다.");
				}
			});			
		}
		
		$("#recommend").bind("click", function(e){ //추천하기 버튼
			e.preventDefault();
			$.ajax({
				 url : "<c:url value='/board/recommend.do?BOARD_NO=${map.BOARD_NO}'/>",
				 type : "post",
				 dataType : 'json',
				 contentType : "application/json; charset=UTF-8",
				 success : function(){
					 alert("추천완료");
					 $("#recommend").unbind("click");
					 $("#recommend_count").load(window.location.href+ " #recommend_count");
				 },
				 error : function(){
					 alert("서버요청실패");
				 }
			 })
		});
		
		$("#report").bind("click", function(e){ //신고하기 버튼
			e.preventDefault();
			$.ajax({
				 url : "<c:url value='/board/report.do?BOARD_NO=${map.BOARD_NO}'/>",
				 type : "post",
				 dataType : 'json',
				 contentType : "application/json; charset=UTF-8",
				 success : function(){
					 alert("신고완료");
					 $("#report").unbind("click");
					 $("#report_count").load(window.location.href+ " #report_count");
				 },
				 error : function(){
					 alert("서버요청실패");
				 }
			 })
		});
		
	});
	
	function fn_recommendComment(e){
		let REF_NO = $("#REF_NO_" + e).val();
		let REF_STEP = $("#REF_STEP_" + e).val();
		
		if(check_recommend){
			$.ajax({
				 url : "<c:url value='/board/recommandComment.do?REF_NO=" + REF_NO + "&REF_STEP=" + REF_STEP + "'/>",
				 type : "post",
				 dataType : 'json',
				 contentType : "application/json; charset=UTF-8",
				 success : function(result){
					 alert("댓글추천");
					 check_recommend = false;
				 },
				 error : function(){
					 alert("서버요청실패");
				 }
			 })			
		}else{
			alert("추천은 한번");
		}
	}
    
    function fn_addFile(){if(gfv_count>=4){
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


</body>
    <script type="text/javascript">
    function com(x,y,z) {
    	if(document.getElementById('coms'+y+'commet') != null){
    	$('#coms'+y+'commet').empty();
    	document.getElementById('coms'+y+'commet').id = 'coms'+y
    	}else{	
            var str = "<label for='content'>대댓글 작성</label>";
            str +="<form action='../board/commentInsert2.do' method='post'>" ;
            str +="<div class='input-group'>";
            str +="<input type='hidden' name='BOARD_NO' value='${map.BOARD_NO}'/>"
            str +="<input type='hidden' name='IDENTI_TYPE' value='${map.IDENTI_TYPE}'/>"
            str +="<input type='hidden' name='USER_NO' value='${session.USER_NO}'/>"
            str +="<input type='hidden' name='REF_NO' value='"+y+"'/>"
            str +="<input type='hidden' name='REF_STEP' value='"+z+"'/>"
            str +="<textarea class='form-control' rows='3' id='CONTEXT' name='CONTEXT' placeholder='내용을 입력하세요.'></textarea>"
            str +="<span class='input-group-btn'>"
            str +="<button class='btn btn-default' name='commentInsertBtn'>등록</button>"
            str +="</span>"
            str +="</div>"
            str +="<br/>"
            str +="</form>"
        $("#coms"+y).append(str);
            document.getElementById('coms'+y).id = 'coms'+y+'commet'
        }

    };
    </script>

</html>
