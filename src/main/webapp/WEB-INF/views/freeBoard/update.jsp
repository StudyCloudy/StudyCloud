<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<c:import url="../layout/header.jsp" /> 

<style type="text/css">
.content { width: 1000px; margin: 70px auto; }
label{ text-align: center; }
form { margin: 40px 5px auto;}
.button { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin: 2px; 
		  border-radius: 5px; color: white; }
#newFile { display: none; }
.through { text-decoration: line-through; }
#deleteFile { font-weight: bold; color: red; cursor: pointer; }
.preview img { width: 200px; height: 150px; margin: 35px 5px 5px 5px;}
.fileBox p { margin-bottom: 5px; position: absolute; left: 5px;}
.fileBox { position: relative; width: 220px; height: 240px; margin-left: 5px;}
.fileBox a { position: absolute; right: 15px; }
.preview { display: flex; }	
#fileAddBtn { border: none; width: 80px; height: 40px; background-color: #6cc4dc; font-weight: bold; color: white;  margin: 8px 0 8px 0;}	  

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#file").on("change", handleFileSelect);

 	if( ${empty fileUpload} ) {
		$("#newFile").show();
		$("#fileAddBtn").hide();
	} else {
		$("#originFile").show();
	}
	

	$("#fileAddBtn").on("click", function(){
		$("#newFile").show()
	});

	 $("a[name='file-del']").on("click", function(e) {
         e.preventDefault();
         deleteFile($(this));
     });
	
	 function deleteFile(obj) {
	        obj.parent().remove();
	 }
})

function handleFileSelect(e) {
	
	fBoard_files = [];
	$(".preview").empty();
	
	var files=e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	var index=0;
	filesArr.forEach(function(f) {
		
		fBoard_files.push(f);
		
		if(f.type.match('image.*')) {
		var reader = new FileReader();
		reader.onload = function(e) {
			var html = "<div class='fileBox'>"
				html += "<p>" + f.name + "</p>"				
			    html += "<a href=\"javascript:void(0);\" id=\"img_id_"+index+"\"><img src=\""+e.target.result+"\" data-file='"+f.name+"' class='selProductFile'></a>";
				html += "</div>"
			$(".preview").append(html);
			index++;
		}
		reader.readAsDataURL(f);
		} else {
			var html = "<div class='fileBox'>"
				html += "<p>" + f.name + "</p>"
			    html += "<a><img src=\"https://ifh.cc/g/vGMnsc.png\" data-file='"+f.name+"' class='selProductFile'></a>";
				html += "</div>"
				$(".preview").append(html);
				index++;
		}
	})
	
}


</script>

<div class="content">
	<h2>자유게시판</h2>

	<form name="form" action="./update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="fBoardNo" value="${updateView.FBOARD_NO}">
		<div class="mb-3 row">
			<label for="id" class="col-sm-2 col-form-label">닉네임</label>
			<div class="col-sm-8">
				<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${updateView.MEMBER_NICK }">
			</div>
		</div>

		<div class="mb-3 row">
			<label for="category" class="col-sm-2 col-form-label">카테고리</label>
			<div class="col-sm-10">
				<select class="form-select" name="categoryName">
					<option>잡담</option>
					<option>질문</option>
					<option>공부TIP</option>
				</select>
			</div>
		</div>

		<div class="mb-3 row">
			<label for="title" class="col-sm-2 col-form-label">제목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="title" name="fBoardTitle" value="${updateView.FBOARD_TITLE }">
			</div>
		</div>

		<div class="mb-3">
			<textarea class="form-control" id="content" rows="10" name="fBoardContent">${updateView.FBOARD_CONTENT }</textarea>
		</div>


		<div class="mb-3">
			<div id="fBoard_fileBox">
				<c:choose>
					<c:when test="${fn:length(fileUpload) > 0}">
						<div id="originFile">
							<c:forEach items="${fileUpload }" var="fBoardFileList">
								<input type="hidden" name="file_no_${fBoardFileList.fileUploadNo }" value="true">
								<a href="/freeBoard/download?fileUploadNo=${fBoardFileList.fileUploadNo }">${fBoardFileList.fileUploadOri }</a>
								<a href="#this" name="file-del">X</a>
							</c:forEach>
						</div>
					</c:when>
				</c:choose>
				<button type="button" id="fileAddBtn">파일추가</button>
				<div id="newFile">
					<input class="form-control" type="file" id="file" name="fBoardFile" multiple>
				</div>
				<div class="preview" class="fBoardContent"></div>
			</div>
		</div>

		<div class="text-center">
			<button class="button">수정</button>
			<button id="cancel" type="button" class="button" onclick="location.href='/freeBoard/list'">취소</button>
		</div>
	</form>
</div>
<%@ include file="../layout/footer.jsp"%>
</body>
</html>