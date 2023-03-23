<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>youngseopgram 타임라인</title>
	  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  		
  		<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>

	<div id="wrap" class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="pt-4 pl-5 d-flex justify-content-center" >
			<div class="timelineBox">
				<div class="inputBox border rounded">
					<textarea class="form-control border-0" rows="5" id="contentInput" placeholder="내용을 입력해주세요."></textarea>
			
					<div class="d-flex justify-content-between pr-2 pb-2">
						<input type="file" id="fileInput" class="pl-2" id="fileInput">
						<div class="uploadIcon text-info " id="imageUploadBtn"><i class="bi bi-card-image"></i> </div>
						<button type="button" class="btn btn-info  " id="uploadBtn">업로드</button>
					</div>
			
				</div>
				
				<div class="list pt-3 ">
				
					<div class="list1 d-flex justify-content-between align-items-center">
						<div class=" d-flex align-items-center" ><b>dudtjq0415</b></div>
						<div><i class="bi bi-three-dots pr-3"></i></div>
					</div>
					
			
				</div>	
				
				<div class="d-flex justify-content-center pt-5">
					<img width="50%" src="data:image/jpeg;base64,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">
				</div>
				
				<div class="pt-4"><b><i class="bi bi-heart"></i></b>좋아요개</div>
				<div class="pt-2"><b>dudtjq0415</b> 심심해서 이러고 놀아요..</div>
				
				<div class="list pt-3 d-flex justify-content-center">
				
					<div class="list2 d-flex justify-content-start pl-2" ><b>댓글</b></div>
			
				</div>
				
					<div class="d-flex pl-5 pt-3"><b>dudtjq0415</b> 심심해서 이러고 놀아요..</div>
					<div class="d-flex pl-5 pt-1"><b>dudtjq0415</b> 심심해서 이러고 놀아요..</div>
					<div class="pt-1 pl-5 d-flex pr-3">
						<input type="text" class="form-control col-8">
						<button type="button" class="btn btn-info text-white form-control col-3">게시</button>
					</div>
				
			</div>	
			
		</section>

		<div class="pt-5">
			
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
		</div>
	
	</div>

	

</body>
</html>