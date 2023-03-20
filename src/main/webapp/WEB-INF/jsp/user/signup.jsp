<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>youngseopgram 회원 가입 화면</title>

	  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  		
  		<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	
	<div id="wrap">
		
		<section class="contents d-flex justify-content-center pt-5">
			<div class="join-box border">
				<h1 class="text-center pt-2">youngseopgram</h1>
				<div class="text-center pt-3">친구들의 사진과 동영상을 보려면</div>
				<div class="text-center">가입하세요.</div>
				<div class="d-flex justify-content-center">
					<input type="text" placeholder="아이디" class="form-control mt-4 col-7" id="loginIdInput">
					<button type="button" class="bg-info text-white form-control col-3 " id="duplicationBtn">중복확인</button> <br>
				</div>
				<div class="d-flex ">
					<div class="text-danger small d-none justify-content-start pl-4" id="idText1">중복된 ID 입니다.</div>
					<div class="text-success small d-none justify-content-start pl-4" id="idText2">사용 가능한 ID 입니다.</div>
				</div>
				<div class="d-flex justify-content-center">
					<input type="password" placeholder="패스워드" class="form-control mt-4 col-10" id="passwordInput">
				</div>
		
				<div class="d-flex justify-content-center pt-3">
					<button type="button" class="bg-info text-white form-control col-10" id="signupBtn">회원가입</button>
				</div>
				
				
			</div>
			
		</section>
		<footer> 
		<div class="text-center pt-3">Copyright 2023. youngseopgram All Rights Reserved.</div>
		</footer>
	
	
	</div>

	<script>
		
	$(document).ready(function(){
		
		// 처음엔 중복체크가 진행이 안된 상태
		var isChecked = false;
		// 중복이 맞으면 추가가 되지 못하게 true로 셋팅!
		var isDuplicate = true;
		
		
		$("#loginIdInput").on("input", function(){
			
			// 초기화면 처럼 셋팅 진행
			isChecked = false;
			isDuplicateId = true;
			// 중복확인을 진행 안했으니 문구가 안보이게 진행 한다.
			$("#idText1").addClass("d-none");
			$("#idText2").addClass("d-none");
		});
		
		
		$("#duplicationBtn").on("click", function(){
			
			let loginId = $("#loginIdInput").val();

			if(loginId == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/user/duplicate_id"
				, data:{"loginId":loginId}
				, success:function(data){
					
					// 중복체크 여부 저장 성공과 조건문 사이인 중가로 에다가 넣어둔다!
					isChecked = true;
					
					if(data.is_duplicate){	
						
						isDuplicateId = data.is_duplicate;
						$("#idText1").removeClass("d-none");
						$("#idText2").addClass("d-none");
						
						isDuplicateId = true;
						
						alert("중복된 ID 입니다.");
					}else{
						
						$("#idText2").removeClass("d-none");
						$("#idText1").addClass("d-none");
						
						isDuplicateId = false;
						
						alert("사용가능한 ID 입니다.");
					}
				}
				, error:function(){
					alert("중복확인 에러");
				}
				
				
			});
	
		});
			
		
		$("#signupBtn").on("click", function(){
			
			let loginId = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
			let passwordCheck = $("#passwordCheckInput").val();
			let name = $("#nameInput").val();
			let email = $("#emailInput").val();
			
			if(loginId == ""){
				alert("아이디를 입력해주세요.");
				return;
			}
			
			if(!isChecked){
				alert("아이디 중복체크를 진행 해 주세요");
				return;
			}
			
			if(isDuplicateId){
				alert("아이디 중복되었습니다.");
				return;
			}
			
			if(password == ""){
				alert("비밀번호를 입력해주세요.");
				return;
			}
			
			if(password != passwordCheck){
				alert("비밀번호가 일치 하지 않습니다.");
				return;
			}
			
			if(name == ""){
				alert("이름을 입력해주세요.");
				return;
			}
			
			if(email == ""){
				alert("이메일을 입력해주세요.");
				return;
			}
			
			
			$.ajax({
				type:"post"
				, url:"/user/signup"
				, data:{"loginId":loginId, "password":password, "name":name, "email":email}
				, success:function(data){
					if(data.result == "success"){
						
						location.href = "/user/signin/view";
						
					}else {
						
						alert("회원가입 실패");
					}
					
				}
				, error:function(){
					alert("회원가입 에러");
				}
				
			});
			
		});
		
	});
	
	</script>


</body>
</html>