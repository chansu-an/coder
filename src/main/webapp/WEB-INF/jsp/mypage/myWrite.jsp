<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="ko">
<head>
<title>작성글</title>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

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
						<h4 class="card-title">작성글</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<colgroup>
									<col width="*" />
									<col width="*" />
									<col width="*" />
									<col width="*" />
								</colgroup>
								<thead class=" text2-primary">
									<tr>
										<th scope="col">글제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
										<th scope="col">조회수</th>

									</tr>
								</thead>
								<tbody id="writelist">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	<div align="center">
	<nav>
		<ul class="pagination" id="writepage">
	</ul>
		</nav>
		</div>
		</div>
		</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">
	$(function() {
		page(1);
	});
function page(p){
		var p = p;
	    $.ajax({
	        type:'GET',
	        url : "<c:url value='/Mypage/Writepage.do'/>",
	        dataType : 'json',
	      	data : {
	      		USER_NO : ${param.USER_NO},
	      		PAG_NUM : p
	      	},
	        success : function(data){
	        	let html = "";
	        	let page = "";
	        	if(data.length > 0){
	                for(i=0; i<data.length-1; i++){
	                	html += "<tr><td><a href='../board/detail.do?BOARD_NO="+data[i].BOARD_NO+"&IDENTI_TYPE="+data[i].IDENTI_TYPE+"'>"+data[i].TITLE+"</a></td>";
	                	html +="<td>"+data[i].NICK_NAME+"</td>";
	                		html +="<td>"+data[i].BOARD_DATE+"</td>";
	                			html +="<td>"+data[i].READ_COUNT+"</td></tr>";
	                    
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
	             
	                
	            }	$("#writelist").html(html)
	                $("#writepage").html(page)
	            }, error : function(request,error){
	            	alert("code:"+request.status+"\n"+"error:"+error);
				 }

	        })}
	
	</script>
</body>
</html>