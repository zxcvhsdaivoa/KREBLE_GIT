<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KREBLE 클럽</title>
	<link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
	<link rel="stylesheet" type="text/css" href="css/clup_style.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<script src="js/clup.js"></script>
<body>
<jsp:include page="Header_baseform.jsp"/>
	<section>
		<div class="section_inner clup_make">
			<form name="clup_make" action="clup.do?command=clupmakepro" enctype="multipart/form-data" method="post">
				<div class="clup_setting">
					<div class="line_box">
						<label for="clup_name" id="clup_name_label">클럽명 : </label>
						<input type="text" id="clup_name" name="clup_name">
					</div>
					
					<div class="line_box">
						<label for="clup_name" id="clup_howjoin_label">가입조건 : </label>
						<select name="clup_howjoin" id="clup_howjoin">
							<option value="free" selected>자동승인</option>
							<option value="password">비밀번호 입력</option>
							<option value="request">클럽장 승인시</option>
						</select>
						<input type="text" id="clup_pw" name="clup_pw" placeholder="[비밀번호 입력] 선택시 필수 입력사항">
					</div>
					
					<textarea id="clup_include" name="clup_include" placeholder="클럽의 소개문구를 적어주세요"></textarea>
					
					<div class="line_box">
						<label for="disclose" id="clup_disclose_lable">클럽공개설정 : </label>
						<select name="disclose" id="disclose">
							<option value="1">공개</option>
							<option value="0">비공개</option>
						</select>
					</div>
				</div>
				<div class="fileUpload">
					<span>클럽 로고 설정하기</span>
					<div class="thumbnail"></div>
					<label for="fileUp" id="file_label">이미지 업로드</label>
					<input type="file" name="fileUp" id="fileUp" onchange="setThumbnail(event);">
				</div>
				<span class="btn btn_back"><a href="#" onclick="back()">취소</a></span>
				<input type="submit" class="btn btn_make" value="클럽 만들기">
			</form>
		</div>
	</section>
<jsp:include page="Footer_baseform.jsp"/>
</body>
</html>