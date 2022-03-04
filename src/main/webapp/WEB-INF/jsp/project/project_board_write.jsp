<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
			<!-- Page content-->
			<h2>프로젝트 작성</h2>
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
			<input type = "hidden" name = "USER_NO" value = "${sessionScope.session.USER_NO }">
				<table class="board_view">
					<colgroup>
						<col width="15%" />
						<col width="*%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td><input type="text" id="TITLE" name=PROJECT_NAME
								class="wdp_90"></input></td>
						</tr>

						<tr>
							<th>시작일</th>
							<td><input type="date" name="PROJECT_START"></td>
							</tr>
							<tr>
							<th>종료일</th>
							<td><input type="date" name="PROJECT_END"></td>
						</tr>
						<tr>
							<th>필요인원</th>
							<td><input type="text" name="PROJECT_MEMBER"></td>
						</tr>

						<tr>
							<td colspan="2" class="view_text"><textarea rows="20"
									cols="100" title="내용" id="PROJECT_CONTEXT"
									name="PROJECT_CONTEXT"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div id="fileDiv">
					<p>
						<input type="file" id="file" name="file_0"> <a
							href="#this" class="btn" id="delete" name="delete">삭제</a>

					</p>
				</div>
				<br /> <br /> 
				<a onclick="fn_addFile()" class="btn"
					id="addFile">파일 추가</a> 
					<input type="submit" class = "btn" value="작성하기"> 
					<a href="../Project/Project.do" class="btn" id="list">목록으로</a>

			</form>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
		<script type="text/javascript">
		
		var gfv_count = 1;
		
		function fn_addFile(){if(gfv_count>=6){  //파일 수 제한 
			alert("파일수를 초과했습니다")
			return;

		}

			var str = "<p><input type='file' name='file_"+(gfv_count)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";


			
			$("#fileDiv").append(str);
			
			
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
				
			});
			++gfv_count
		}
		
		function fn_deleteFile(obj){
			--gfv_count
			//alert(gfv_count)
			obj.parent().remove();
		}
	</script>
</body>
</html>