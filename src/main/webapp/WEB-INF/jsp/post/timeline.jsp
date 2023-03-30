<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>youngseopgram 타임라인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

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
					<c:if test="${userId eq post.userId }">	
						<div><i class="bi bi-three-dots pr-3 moreIcon" data-post-id="${post.id }" data-toggle="modal" data-target="#moreModal"></i></div>
					</c:if>	
					</div>
					
			
				</div>	
				
				<div class="d-flex justify-content-center pt-4">
					<img width="100%" src="${post.imagePath }">
				</div>
			<div class="pt-2">
				<c:choose>
				
					<c:when test="${post.like}">
						<i class="bi bi-heart-fill text-danger unlikeBtn" data-post-id="${post.id}"></i>
					</c:when>	
					<c:otherwise>
						<i class="bi bi-heart likeBtn" data-post-id="${post.id}"></i>
					</c:otherwise>
	
				</c:choose>
				좋아요 ${post.likeCount}개
			</div>	
			
				<div class="pt-2"><b>${post.loginId }</b> ${post.content }</div>
				
				<div class="list pt-3 d-flex justify-content-center">
				
					<div class="list2 d-flex justify-content-start pl-2" ><b>댓글</b></div>
			
				</div>
				<c:forEach var="comment" items="${post.commentList }" >
					<div class="d-flex pl-5 pt-2"><b>${comment.userLoginId }</b>${comment.content }</div>
				</c:forEach>		
					<div class="pt-1 pl-5 d-flex pr-3">
						<input type="text" class="form-control col-8" id="textInput${post.id }">
						<button type="button" class="btn btn-info text-white form-control col-3 postingBtn" data-post-id="${post.id}">게시</button>
					</div>
			
			</c:forEach>
			</div>	
			
		</section>

		
			
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	

	
	<!-- Modal -->
	<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      	<div class="modal-body text-center">
	       		<a href="#" id="deleteBtn">삭제하기</a>
	      	</div>
	    
	    </div>
	  </div>
	</div>
	
	<script>
	
	
	 	$(document).ready(function(){
	 		
	 		$("#deleteBtn").on("click", function(){
	 			
	 			// moreIcon 과 연결이 되어있으므로 
	 			// deleteBtn에 안보이더라도 효과가 있음
	 			let postId = $(this).data("post-id")
	 			
				$.ajax({
					
					type:"get"
					, url:"/post/delete"
					, data:{"postId":postId}
					, success:function(data){
						
						if(data.result =="success"){
							location.reload();
						}else{
							alert("삭제 실패")
						}
						
					}
					, error:function(){
						
						alert("삭제 오류")
						
					}
					
				});
	 			
	 		})
	 		
	 		$(".moreIcon").on("click", function(){
	 			
	 			let postId = $(this).data("post-id")
	 		
	 			// data-post-id ="postId"
	 			$("#deleteBtn").data("post-id", postId);
	 			
			});
			
	 		
	 		// 게시 버튼
	 		$(".postingBtn").on("click", function(){
	 			
	 			let postId = $(this).data("post-id");
	 			// alert(""); 확인 완료

	 			// 버튼에 매칭된 input 태그를 객채화 한다
	 			
	 			// 버튼 바로 앞 태그를 객채화 한다
	 			// let comment = $(this).prev().val();
	 			// alert(comment);
	 			
	 			let comment = $("#textInput" + postId).val();
	 			// alert(comment);
	 			
	 			$.ajax({
	 				type:"post"
	 				, url:"/post/comment/create"
	 				, data:{"postId":postId, "content":comment}
	 				, success:function(data){
	 					
	 					if(data.result == "success"){
	 						location.reload();
	 					}else{
	 						alert("댓글 작성 실패");
	 					}
	 					
	 				}
	 				, error:function(){
	 					alert("댓글 작성 에러");
	 				}
	 			});
	 			
	 		});
	 		
	 		$(".unlikeBtn").on("click", function(){
	 			
	 			let postId = $(this).data("post-id");
	 			
	 			$.ajax({
	 				type:"get"
	 				, url:"/post/unlike"
	 				, data:{"postId":postId}
	 				, success:function(data){
	 					
	 					if(data.result == "success"){
	 						
	 						location.reload();
	 						
	 					}else{
	 						alert("좋아요 취소 실패");
	 					}
	 						
	 				}
	 				, error:function(){
	 					alert("좋아요 취소 에러");
	 				}
	 			});
	 			
	 		});
	 		
	 		$(".likeBtn").on("click", function(){
	 			
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