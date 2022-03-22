<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>

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
						<div class="card card-plain">
							<div class="card-header">
								<br />
								<h4 class="card-title">신고글 목록</h4>
							</div>
							<div class="card-body">
								<div class="table2-responsive">
									<table class="table">
										<thead class=" text2-primary">
											<tr>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>
												<th scope="col">신고수</th>
												<th scope="col">작성일</th>
												<th scope="col">복구하기</th>
											</tr>
										</thead>
										<tbody id="r_list">
											
										</tbody>
									</table>
									<div style="padding-left: 50%; padding-right: 50%;">
        <nav>
            <ul class="pagination" id="r_page">
               
            </ul>
        </nav>
    </div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="content">
					<div class="row">
						<div class="col-md-12">
							<div class="card card-plain">
								<div class="card-header">
									<br />
									<h4 class="card-title">삭제글 목록</h4>
								</div>
								<div class="card-body">
									<div class="table2-responsive">
										<table class="table">
											<thead class=" text2-primary">
												<tr>
													<th scope="col">제목</th>
													<th scope="col">작성자</th>
													<th scope="col">작성일</th>
													<th scope="col">복구하기</th>
												</tr>
											</thead>
											<tbody id="d_list">
												
											</tbody>
										</table>
										<div style="padding-left: 50%; padding-right: 50%;">
        <nav>
            <ul class="pagination" id="d_page">
               
            </ul>
        </nav>
    </div>
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
    $(function() {
    	d_page(1);
    	r_page(1);
    });
    function d_reset(b){
    	event.preventDefault();
    	var b = b;
    	 $.ajax({
 	        type:'GET',
 	        url : "<c:url value='/board/restore.do'/>",
 	        dataType : "json",
 	      	data :{
 	        	BOARD_NO : b
 	      	}
 	      	,success : function(){
	      		d_page(1)
	      	},error : function(){
				d_page(1)
			}
 	        })
    }
    function r_reset(b){
    	var b = b;
    	 $.ajax({
 	        type:'GET',
 	        url : "<c:url value='/board/reset.do'/>",
 	        dataType : "json",
 	      	data :{
 	      		BOARD_NO : b
 	      	}
 	      	,success : function(){
	      		r_page(1)
	      	},error : function(){
				r_page(1)
			}
 	        })
    }
function d_page(p){
		
		var p = p;
	    $.ajax({
	        type:'GET',
	        url : "<c:url value='/board/adminpage.do'/>",
	        dataType : "json",
	      	data :{
	        	D_PAG_NUM : p
	      	},
	        success : function(data){
	        	 let html = "";
	        	 let page = "";
	        	if(data.length > 0){	
	                for(i=0; i<data.length-1; i++){
	                	html += "<tr><td><a href='/net/board/adminDetail.do?BOARD_NO="+data[i].BOARD_NO+"'>"+data[i].TITLE+"</a></td>";
	                	html += "<td>"+data[i].NICK_NAME+"</td>";

	                	html += "<td>"+data[i].BOARD_DATE+"</td>";
	                	html += "<td><a onclick='d_reset("+data[i].BOARD_NO+")' class='btn' id='reset'>복구하기</a></td></tr>";
	                    
	                }
	                if(data[data.length-1].startpag>1){
	                   var Previous = data.startpag-10
	                	page += " <li onclick='d_page("+Previous+")' ><a aria-label='Previous'><span aria-hidden='tru'>&laquo;</span></a></li>";
	                }for(var i=data[data.length-1].startpag;i<=data[data.length-1].endpage;i++){
	                	if(p == i){
	                		page += "<li onclick='d_page("+i+")' id =b_"+i+" class='action'><a>"+i+"</a></li>";
	                	}else{
	                	page += "<li onclick='d_page("+i+")' id =b_"+i+" class=''><a>"+i+"</a></li>";}
	                }if(data[data.length-1].endpage<data[data.length-1].maxpag){
	                	var next = data[data.length-1].startpag+10
	                	page += "<li onclick='d_page("+next+")' ><a aria-label='Next'><span aria-hidden='true'>&#187;</span></a></li>";
	                }
	                
	                
	            } else {
	                html += "<tr><td colspan='4'>조회된 결과가 없습니다</td></tr>";
	             
	                
	            }	$("#d_list").html(html)
	                $("#d_page").html(page)
	            }, error : function(request,error){
	            	alert("code:"+request.status+"\n"+"error:"+error);
				 }

	        })
	     }
	     function r_page(p){
	 		
	 		var p = p;
	 	    $.ajax({
	 	        type:'GET',
	 	        url : "<c:url value='/board/adminpage.do'/>",
	 	        dataType : "json",
	 	      	data :{
	 	      		R_PAG_NUM : p
	 	      	},
	 	        success : function(data){
	 	        	 let html = "";
	 	        	 let page = "";
	 	        	if(data.length > 0){	
	 	                for(i=0; i<data.length-1; i++){
	 	                	html += "<tr><td><a href='/net/board/adminDetail.do?BOARD_NO="+data[i].BOARD_NO+"'>"+data[i].TITLE+"</a></td>";
		                	html += "<td>"+data[i].NICK_NAME+"</td>";
		                	html += "<td>"+data[i].REPORT_COUNT+"</td>";
		                	html += "<td>"+data[i].BOARD_DATE+"</td>";
		                	html += "<td><a onclick='r_reset("+data[i].BOARD_NO+")' class='btn' id='reset'>복구하기</a></td></tr>";
	 	                    
	 	                }
	 	                if(data[data.length-1].startpag>1){
	 	                   var Previous = data.startpag-10
	 	                	page += " <li onclick='r_page("+Previous+")' ><a aria-label='Previous'><span aria-hidden='tru'>&laquo;</span></a></li>";
	 	                }for(var i=data[data.length-1].startpag;i<=data[data.length-1].endpage;i++){
	 	                	if(p == i){
	 	                		page += "<li onclick='r_page("+i+")' id =b_"+i+" class='action'><a>"+i+"</a></li>";
	 	                	}else{
	 	                	page += "<li onclick='r_page("+i+")' id =b_"+i+" class=''><a>"+i+"</a></li>";}
	 	                }if(data[data.length-1].endpage<data[data.length-1].maxpag){
	 	                	var next = data[data.length-1].startpag+10
	 	                	page += "<li onclick='r_page("+next+")' ><a aria-label='Next'><span aria-hidden='true'>&#187;</span></a></li>";
	 	                }
	 	                
	 	                
	 	            } else {
	 	                html += "<tr><td colspan='4'>조회된 결과가 없습니다</td></tr>";
	 	             
	 	                
	 	            }	$("#r_list").html(html)
	 	                $("#r_page").html(page)
	 	            }, error : function(request,error){
	 	            	alert("code:"+request.status+"\n"+"error:"+error);
	 				 }

	 	        })
	 	     }
    
    </script>
</body>
</html>