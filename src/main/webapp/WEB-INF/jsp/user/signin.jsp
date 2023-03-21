<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>youngseopgram 로그인</title>

	  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  		
  		<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap" class="pt-3">
	
		<section class="d-flex">
			<div class="logo d-flex justify-content-center align-items-center pb-5">
				<img class="pl-4 rounded mx-auto d-block w-75" src="data:image/jpeg;base64,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">
			</div>
			<div class="login-box1">
			
			<div class="content d-flex justify-content-center pr-5 my-5 pt-4">
				<div>
				<div class="login-box d-flex justify-content-center align-items-start bg-white  border rounded p-0">
					<div class="w-100 p-5">
						<h2 class="text-center">youngseopgram</h2>
						<br>
						<div class="text-center">
							<b class="text-secondary">친구들의 사진과 동영상을 보려면<br> 가입하세요.</b>
						</div>
						<form id="loginForm">
							<div class="d-flex  mt-3">
								<input type="text" id="loginIdInput" class="form-control" placeholder="아이디">
							</div>
				
							<input type="password" id="passwordInput" class="form-control mt-3" placeholder="패스워드">
	
							<button type="submit" id="signUpBtn" class="btn btn-primary btn-block mt-3">로그인</button>
						</form>
					</div>
					
				</div>
				<div class="mt-4 p-3 d-flex justify-content-center align-items-start bg-white  border rounded">
					계정이 없으신가요? <a href="/user/signup/view">회원가입</a>
				</div>
			</div>
		</div>
			</div>
		
		</section>
		
		<hr>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	
	</div>
	
	<script>
		
		$(document).ready(function(){
			
			$("#loginForm").on("submit", function(e){
				
				// 이벤트가 가진 고유 기능과 속성을 취소한다.
				e.preventDefault();
				
				let id = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				
				if(id == ""){
					alert("아이디를 입력해주세요.");
					return;
				}
				
				if(password == ""){
					alert("비밀번호를 입력해주세요.");
					return;
				}
				
				$.ajax({
			 		
			 		type:"post"
			 		, url:"/user/signin"
			 		, data:{"loginId":id, "password":password}
			 		, success:function(data){
			 			
			 			if(data.result == "success"){
			 				location.href="/post/timeline/view"
			 				return;
			 			}else{
			 				alert("아이디와 비밀번호를 확인 해주세요.");
			 				return;
			 				
			 			}
			 	
			 		}
			 		, error:function(){
			 			alert("로그인 에러");
			 			return;
			 		}
			 	});
				
			});
	
		});
	
	</script>

</body>
</html>