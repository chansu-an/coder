<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내활동</title>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>

</head>
<body class=''>
	<div class="main-panel" id="main-panel">
		<div class="panel-header panel-header-sm"></div>
		<div class="content">
			<div class="card">
				<div class="card-header">
					<br />
					<h4 class="card-title"><span style="color: black">스크랩 리스트<a></a></h4>
				</div>
				<div class="card-body">
					<div class="table2-responsive">
						<table class="table">
							<colgroup>
								<col width="*%" />
								<col width="20%" />
								<col width="20%" />
							</colgroup>
							<thead class=" text2-primary">
								<tr>
									<th scope="col">제목</th>
									<th scope="col">작성일</th>
									<th scope="col">추천수</th>
								</tr>
							</thead>
							<tbody id="s_list">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div style="padding-left: 50%; padding-right: 50%;">
				<nav>
					<ul class="pagination" id="s_page">
						
					</ul>
				</nav>
			</div>




			<div class="card">
				<div class="card-header">
					<br />
					<h4 class="card-title"><span style="color: black">팔로우 리스트</span></h4>
				</div>
				<div class="card-body">
					<div class="table2-responsive">
						<table class="table">
							<colgroup>
								<col width="*%" />
							</colgroup>
							<thead class=" text2-primary">
								<tr>
									<th scope="col">닉네임</th>
								</tr>
							</thead>
							<tbody id="f_list">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div style="padding-left: 50%; padding-right: 50%;">
				<nav>
					<ul class="pagination" id="f_page">
					
					</ul>
				</nav>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">
	$(function(){
		s_page(1)
		f_page(1)
	})

	
	function f_page(p){
		
		var p = p;
	    $.ajax({
	        type:'GET',
	        url : "<c:url value='../Mypage/Mypageing.do'/>",
	        dataType : "json",
	      	data :{
	      		USER_NO : ${param.USER_NO},
	        	F_PAG_NUM : p
	      	},
	        success : function(data){
	        	 let html = "";
	        	 let page = "";
	        	if(data.length > 0){	
	                for(i=0; i<data.length-1; i++){
	                	html += "<tr><td><a href'../main/Mypage.do?USER_NO="+data[i].FOLLOWER+"'>"+data[i].NICK_NAME+"</a><c:if test='${sessionScope.session.USER_NO == param.USER_NO }'><a  class='btn' href='../Mypage/DeleteFollower.do?USER_NO=${sessionScope.session.USER_NO}&FOLLOWER="+data[i].FOLLOWER+"'>팔로우 해제</a></c:if></td></tr>";
	                    
	                }
	                if(data[data.length-1].startpag>1){
	                   var Previous = data.startpag-10
	                	page += " <li onclick='f_page("+Previous+")' ><a aria-label='Previous'><span aria-hidden='tru'>&laquo;</span></a></li>";
	                }for(i=data[data.length-1].startpag;i<data[data.length-1].endpage;i++){
	                	if(p == i){
	                		page += "<li onclick='f_page("+i+")' id =b_"+i+" class='action'><a>"+i+"</a></li>";
	                	}else{
	                	page += "<li onclick='f_page("+i+")' id =b_"+i+" class=''><a>"+i+"</a></li>";}
	                }if(data[data.length-1].endpage<data[data.length-1].maxpag){
	                	var next = data[data.length-1].startpag+10
	                	page += "<li onclick='f_page("+next+")' ><a aria-label='Next'><span aria-hidden='true'>&#187;</span></a></li>";
	                }
	                
	                
	            } else {
	                html += "<tr><td colspan='4'>조회된 결과가 없습니다</td></tr>";
	             
	                
	            }	$("#f_list").html(html)
	                $("#f_page").html(page)
	            }, error : function(request,error){
	            	alert("code:"+request.status+"\n"+"error:"+error);
				 }

	        })
	     }
	
	function s_page(p){
		
		var p = p;
	    $.ajax({
	        type:'GET',
	        url : "<c:url value='../Mypage/Mypageing.do'/>",
	        dataType : "json",
	      	data : {
	      		USER_NO : ${param.USER_NO},
	      		S_PAG_NUM : p
	      	},
	        success : function(data){
	        	let html = "";
	        	let page = "";
	        	if(data.length > 0){
	        		alert(data.length)
	                for(i=0; i<data.length-1; i++){
	                	html += "<tr><td><a href='../board/detail.do?BOARD_NO="+data[i].BOARD_NO+"&IDENTI_TYPE="+data[i].IDENTI_TYPE+"'>"+data[i].TITLE+"</a><c:if test='${sessionScope.session.USER_NO == param.USER_NO }'><a class='btn' href='../Mypage/DeleteScarap.do?USER_NO=${sessionScope.session.USER_NO}&BOARD_NO="+data[i].BOARD_NO+"'>스크랩 해제</a></c:if></td><td>"+data[i].BOARD_DATE+"</td><td>"+data[i].RECOMMEND_COUNT+"</td></tr>";
	                    
	                }
	                if(data[data.length-1].startpag>1){
	                   var Previous = data[data.length-1].startpag-10
	                	page += " <li onclick='s_page("+Previous+")' ><a aria-label='Previous'><span aria-hidden='tru'>&laquo;</span></a></li>";
	                }for(i=data[data.length-1].startpag;i<data[data.length-1].endpage;i++){
	                	if(p == i){
	                		page += "<li onclick='s_page("+i+")' id =p_"+i+" class='action'><a>"+i+"</a></li>";
	                	}else{
	                	page += "<li onclick='s_page("+i+")' id =p_"+i+" class='tt'><a>"+i+"</a></li>";}
	                }if(data[data.length-1].endpage<data[data.length-1].maxpag){
	                	var next = data[data.length-1].startpag+10
	                	page += "<li onclick='s_page("+next+")' ><a aria-label='Next'><span aria-hidden='true'>&#187;</span></a></li>";
	                }
	                
	                
	            } else {
	                html += "<tr><td colspan='4'>조회된 결과가 없습니다</td></tr>";
	             
	                
	            }	$("#s_list").html(html)
	                $("#s_page").html(page)
	            }, error : function(request,error){
	            	alert("code:"+request.status+"\n"+"error:"+error);
				 }

	        })}
	</script>
</body>
</html>