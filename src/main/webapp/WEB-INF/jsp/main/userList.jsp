<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
</head>

<body>
	<div class="wrapper ">

		<div class="main-panel" id="main-panel">
			<!-- Navbar -->
			<!-- End Navbar -->
			<div class="panel-header panel-header-sm"></div>
			<!-- End Navbar -->

			<!-- content -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-plain">
							<div class="card-header">
								<br />
								<h4 class="card-title">회원 관리</h4>
							</div>
							<div class="card-body">
								<div class="table2-responsive">
									<table class="table">
										<thead class=" text2-primary">
											<tr>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">닉네임</th>
												<th scope="col">이메일</th>
												<th scope="col">탈퇴여부</th>
												<th scope="col">신고복구</th>
											</tr>
										</thead>
										<tbody id="p_list">
											
										</tbody>
									</table>

									<div style="padding-left: 50%; padding-right: 50%;">
										<nav>
											<ul class="pagination" id="p_page">
												
											</ul>
										</nav>
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
	
			$(function() {
				page(1);
			});
			function d_rset(b) {
				var b = b;
		    	 $.ajax({
		 	        type:'GET',
		 	        url : "<c:url value='/main/restoreUser.do'/>",
		 	        dataType : "json",
		 	      	data :{
		 	      		USER_NO : b
		 	      	}
		 	      	,success : function(){
			      		page(1)
			      	},error : function(){

						page(1)
					}
		 	        })
			}
			function s_rset(b) {
				var b = b;
		    	 $.ajax({
		 	        type:'GET',
		 	        url : "<c:url value='/main/returnUserDisabled.do'/>",
		 	        dataType : "json",
		 	      	data :{
		 	      		USER_NO : b
		 	      	}
		 	      	,success : function(){
			      		page(1)
			      	},error : function(){
		
						page(1)
					}
		 	        })
			}
		function page(p){
				
				var p = p;
			    $.ajax({
			        type:'GET',
			        url : "<c:url value='/main/Userpage.do'/>",
			        dataType : 'json',
			      	data : {
			      		PAG_NUM : p
			      	},
			        success : function(data){
			        	let html = "";
			        	let page = "";
			        	if(data.length > 0){
			                for(i=0; i<data.length-1; i++){
			                	html += "<tr><td>"+data[i].ROWNUM+"</td>";
			                	html += "<td><a href='../main/Mypage.do?USER_NO=${row.USER_NO }'>"+data[i].NICK_NAME+"</a></td>";
			                	html += "<td>"+data[i].EMAIL+"</td><td>";
			                	
			                	if(data[i].DEL_GB=='Y'){
			                		html += "<a onclick='d_rset("+data[i].USER_NO+")' class='btn' id='restore'>복구하기</a>";
			                	}else if(data[i].ADMIN=='Y'){
			                		html += "<input type='button' disabled='disabled' value='관리자' />";
			                	}else{
			                		html += "<input type='button' disabled='disabled' value='일반회원' />";
			                	}
			                	html += "</td><td>";
			                	if(data[i].USER_STOP == 'Y'){
			                		html += "<a onclick='s_rset("+data[i].USER_NO+")' class='btn'id='return'>정지복구</a>";
			                	}
			                	html += "</td></tr>";
			                
			                    
			                }
			                if(data[data.length-1].startpag>1){
			                   var Previous = data[data.length-1].startpag-10
			                	page += " <li onclick='s_page("+Previous+")' ><a aria-label='Previous'><span aria-hidden='tru'>&laquo;</span></a></li>";
			                }for(var i=data[data.length-1].startpag;i<=data[data.length-1].endpage;i++){
			                	if(p == i){
			                		page += "<li onclick='page("+i+")' id =p_"+i+" class='action'><a>"+i+"</a></li>";
			                	}else{
			                	page += "<li onclick='page("+i+")' id =p_"+i+" class='tt'><a>"+i+"</a></li>";}
			                }if(data[data.length-1].endpage<data[data.length-1].maxpag){
			                	var next = data[data.length-1].startpag+10
			                	page += "<li onclick='page("+next+")' ><a aria-label='Next'><span aria-hidden='true'>&#187;</span></a></li>";
			                }
			                
			                
			            } else {
			                html += "<tr><td colspan='4'>조회된 결과가 없습니다</td></tr>";
			             
			                
			            }	$("#p_list").html(html)
			                $("#p_page").html(page)
			            }, error : function(request,error){
			            	alert("code:"+request.status+"\n"+"error:"+error);
						 }

			        })}
	</script>
</body>
</html>