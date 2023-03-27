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
						<div class="uploadIcon text-info pl-2" id="imageUploadBtn"><i class="bi bi-card-image"></i> </div>		
						<input type="file" id="fileInput" class="pl-2 d-none" id="fileInput">
						<button type="button" class="btn btn-info  " id="uploadBtn">업로드</button>
					</div>
			
				</div>
				
			<c:forEach var="post" items="${postList }" >
				<div class="list pt-3 ">
				
					<div class="list1 d-flex justify-content-between align-items-center">
						<div class=" d-flex align-items-center" ><b>${post.loginId }</b></div>
						<div><i class="bi bi-three-dots pr-3"></i></div>
					</div>
					
			
				</div>	
				
				<div class="d-flex justify-content-center pt-5">
					<img width="100%" src="${post.imagePath }">
				</div>
			<div class="pt-2">
				<c:choose>
				
					<c:when test="${post.likeCheck}">
						<i class="bi bi-heart-fill like-icon text-denger like-check" data-post-id="${post.id}"></i>
					</c:when>	
					<c:otherwise>
						<i class="bi bi-heart like-icon" data-post-id="${post.id}"></i>
					</c:otherwise>
	
				</c:choose>
				좋아요 ${post.likeCount}개
			</div>	
				<div class="pt-2"><b>${post.loginId }</b> ${post.content }</div>
				
				<div class="list pt-3 d-flex justify-content-center">
				
					<div class="list2 d-flex justify-content-start pl-2" ><b>댓글</b></div>
			
				</div>
				
					<div class="d-flex pl-5 pt-3"><b>dudtjq0415</b> 심심해서 이러고 놀아요..</div>
					<div class="d-flex pl-5 pt-1"><b>dudtjq0415</b> 심심해서 이러고 놀아요..</div>
					<div class="pt-1 pl-5 d-flex pr-3">
						<input type="text" class="form-control col-8" id="textInput">
						<button type="button" class="btn btn-info text-white form-control col-3 postingBtn">게시</button>
					</div>
			</c:forEach>
			</div>	
			
		</section>

		
			
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	
	
	</div>
	
	<script>
	
	 	$(document).ready(function(){
	 		
	 		
	 		
	 		$(".like-icon").on("click", function(){
	 			
	 			let postId = $(this).data("post-id");
	 			// 확인
	 			//	alert(postId);
	 			
	 			
	 			$.ajax({
	 				type:"get"
	 				, url:"/post/like"
	 				, data:{"postId":postId}
	 				, success:function(data){
	 					
	 					if(data.result == "success"){
	 						location.reload();
	 					}else{
	 						alert("좋아요 실패");
	 					}
	 						
	 					
	 				}
	 				, error:function(){
	 					alert("좋아요 에러");
	 				}
	 			});
	 			
	 			
	 		});
	 		
	 		$("#imageUploadBtn").on("click", function(){
	 			// file input을 클릭한 동작을 수행한다.
	 			$("#fileInput").click();
	 			
	 		});
	 		
	 		$("#uploadBtn").on("click", function(){
	 			
	 			let content = $("#contentInput").val();
	 			let file = $("#fileInput")[0];
	 			
	 			if(content == ""){
	 				alert("내용을 입력하세요.");
	 				return;
	 			}
	 			//파일이 선택되지 않았을 경우의 유효성 검사
	 			if(file.files.length == 0){
	 				alert("파일을 선택하세요.");
	 				return;
	 			}
	 			
	 			var formData = new FormData();
	 			formData.append("content", content);
	 			formData.append("file", file.files[0]);
	 			
	 			console.log(file.files);
	 			
	 			$.ajax({
	 				type:"post"
	 				, url:"/post/create"
	 				, data:formData
	 				, enctype:"multipart/form-data"   // 파일 업로드 필수 항목
					, processData:false // 파일 업로드 필수 항목
					, contentType:false // 파일 업로드 필수 항목
	 				, success:function(data){
	 					if(data.result == "success"){
	 						location.reload();
	 					}else{
	 						alert("업로드 실패");
	 					}
	 				}
	 				, error:function(){
	 					alert("업로드 에러");
	 				}
	 					
	 			});
	 		
	 		});
	 	
	 	});
	
	
	</script>

	

</body>
</html>