<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
		<div class="main-panel" id="main-panel">
		<div class="panel-header panel-header-sm"></div>
	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-plain">
					<div class="card-header">
						<br />
						<h4 class="card-title">게시판 알림</h4>
					</div>
					<div class="card-body" id = "content">
						<div class="table2-responsive">
							<table class="table">
								<thead class=" text2-primary">
									<tr>
										<th scope="col">글제목</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody id="b_comlist">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	<div  align="center">
	<nav>
		<ul class="pagination" id="b_paging">
	</ul>
		</nav>
		</div>
	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-plain">
					<div class="card-header">
						<br />
						<h4 class="card-title">프로젝트 알림</h4>
					</div>
					<div class="card-body">
						<div class="table2-responsive">
							<table class="table">
								<thead class=" text2-primary">
									<tr>
										<th scope="col">프로젝트명</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody id="p_comlist">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div align="center">
	<nav>
	
		<ul class="pagination" id="p_comlist">
	</ul>
		</nav>
		</div>
		</div>
		</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">
	$(function(){
		b_page(1)
		p_page(1)
	})

function b_page(p){
	
		    var p = p;
		    $.ajax({
		        type:'GET',
		        url : "<c:url value='/Mypage/Notpage.do'/>",
		        dataType : "json",
		      	data :{
		      		USER_NO : ${sessionScope.session.USER_NO},
		        	B_PAG_NUM : p
		      	},
		        success : function(data){
		        	 var html = "";
		        	 var page = "";
		        	if(data.length > 0){
		        		
		                for(i=0; i<5; i++){
		                	html += "<tr><td><a href='../Mypage/ArlistClick.do?BOARD_NO="+data[i].BOARD_NO+"&IDENTI_TYPE="+data[i].IDENTI_TYPE+"'>"+data[i].TITLE+"</a></td><td>새로운 댓글이 달렸습니다</td></tr>";
		                    
		                }
		                if(data[5].startpag>1){
		                   var Previous = data[5].startpag-10
		                	page += " <li onclick='b_page("+Previous+")' ><a aria-label='Previous'><span aria-hidden='tru'>&laquo;</span></a></li>";
		                }for(i=data[5].startpag;i<data[5].endpage;i++){
		                	if(p == i){
		                		page += "<li onclick='p_page("+i+")' id =b_"+i+" class='action'><a>"+i+"</a></li>";
		                	}else{
		                	page += "<li onclick='b_page("+i+")' id =b_"+i+" class=''><a>"+i+"</a></li>";}
		                }if(data[5].endpage<data[5].maxpag){
		                	var next = data[5].startpag+10
		                	page += "<li onclick='b_page("+next+")' ><a aria-label='Next'><span aria-hidden='true'>&#187;</span></a></li>";
		                }
		                
		                
		            } else {
		                html += "<tr><td></td><td>알림이 없습니다</td></tr>";
		             
		                
		            }	$("#b_comlist").html(html)
		                $("#b_paging").html(page)
		            }

		        })
		     }
		
		function p_page(p){
			
		    var p = p;
		    $.ajax({
		        type:'GET',
		        url : "<c:url value='/Mypage/Notpage.do'/>",
		        dataType : "json",
		      	data : {
		      		USER_NO : ${sessionScope.session.USER_NO},
		      		P_PAG_NUM : p
		      	},
		        success : function(data){
		        	 var html = "";
		        	 var page = "";
		        	if(data.length > 0){
		        		
		                for(i=0; i<5; i++){
		                	html += "<tr><td><a href='../Mypage/ProjectArClick.do?PROJECT_NO=${"+data[i].PROJECT_NO+"}'>${"+data[i].PROJECT_NAME+"}</a></td><td>새로운 작업일지가 작성되었습니다</td></tr>";
		                    
		                }
		                if(data[5].startpag>1){
		                   var Previous = data[5].startpag-10
		                	page += " <li onclick='p_page("+Previous+")' ><a aria-label='Previous'><span aria-hidden='tru'>&laquo;</span></a></li>";
		                }for(i=data[5].startpag;i<data[5].endpage;i++){
		                	if(p == i){
		                		page += "<li onclick='p_page("+i+")' id =p_"+i+" class='action'><a>"+i+"</a></li>";
		                	}else{
		                	page += "<li onclick='p_page("+i+")' id =p_"+i+" class='tt'><a>"+i+"</a></li>";}
		                }if(data[5].endpage<data[5].maxpag){
		                	var next = data[5].startpag+10
		                	page += "<li onclick='p_page("+next+")' ><a aria-label='Next'><span aria-hidden='true'>&#187;</span></a></li>";
		                }
		                
		                
		            } else {
		                html += "<tr><td></td><td>알림이 없습니다</td></tr>";
		             
		                
		            }	$("#p_comlist").html(html)
		                $("#p_paging").html(page)
		            }

		        })}
		    
	</script>
</body>
<script type="text/javascript">

		
</script>
</html>
