<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/community.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<script src="js/community.js"></script>
<script>
function back(){
	window.history.back();
}
</script>
<body>
<jsp:include page="Header_baseform.jsp"/>
	<section>
		<div class="section_inner">
			
			<div class="community">
				<div class="community_inner">
					<form name="new_write" action="community_writing.jsp" enctype="multipart/form-data" method="post">
						<select name="cate" id="cate">
							<option value="free" selected>자유</option>
							<option value="debate">토론</option>
							<option value="qna">질문</option>
							<option value="info">정보</option>
						</select>
						<label for="title" id="title_label">제목 : </label>
						<input type="text" id="title" name="title">
						<textarea id="write" name="write"></textarea>
						<div class="fileUpload">
							<div class="thumbnail"></div>
							<label for="fileUp">이미지 업로드</label>
							<input type="file" name="fileUp" id="fileUp" onchange="setThumbnail(event);">
						</div>
						<span class="btn btn_back"><a href="#" onclick="back()">취소</a></span>
						<input type="submit" class="btn btn_write" value="작성하기">
					</form>

				</div>
			</div>
		</div>
	</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>