<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<c:import url="../layout/header.jsp" /> 

<style type="text/css">
.content { width: 1000px; margin: 70px auto; }
label{ text-align: center; }
form { margin: 40px 5px auto;}
.button { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin: 2px; 
		  border-radius: 5px; color: white; }
.preview img { width: 200px; height: 150px; margin: 35px 5px 5px 5px;}
.fileBox p { margin-bottom: 5px; position: absolute; left: 5px;}
.fileBox { position: relative; width: 220px; height: 240px; margin-left: 5px;}
.fileBox a { position: absolute; right: 15px; }
.preview { display: flex; }

</style>
<script type="text/javascript">
	var fBoard_files = [];
$(document).ready(function() {
	
	$("#file").on("change", handleFileSelect);

	$("#writeBtn").on("click", function() {
		var boardTitle = $("#title").val();
		var boardContent = $("#content").val();
		
		if( (boardTitle == "") || (boardContent == "") ) {
			alert("제목 & 내용을 모두 입력해주세요.");
			return false;
		}
	})
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

function deleteImageAction(index) {
	fBoard_files.splice(index, 1);
	
	var img_id="#img_id_"+index;
	$(img_id).remove();
}


</script>

<div class="content">
	<h2>자유게시판</h2>

	<form name="form" action="./write" method="post" enctype="multipart/form-data">

		<div class="mb-3 row">
			<label for="id" class="col-sm-2 col-form-label">닉네임</label>
			<div class="col-sm-8">
				<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${member_nick}">
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
				<input type="text" class="form-control" id="title" name="fBoardTitle">
			</div>
		</div>

		<div class="mb-3">
			<textarea class="form-control" id="content" rows="10" name="fBoardContent"></textarea>
		</div>


		<div class="mb-3">
			<input class="form-control" type="file" id="file" name="fBoardFile" multiple>
		</div>

		<div class="preview" class="fBoardContent"></div>

		<div class="text-center">
			<button id="writeBtn" class="button">글쓰기</button>
			<button id="cancel" type="button" class="button" onclick="location.href='/freeBoard/list'">취소</button>
		</div>
	</form>
</div>

<%@ include file="../layout/footer.jsp"%>
</body>
</html>