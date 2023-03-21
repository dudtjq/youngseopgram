<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<header class="bg-info d-flex align-items-center justify-content-between mt-3">
	<h1 class="ml-2">youngseopgram</h1> 
		<c:if test="${not empty userId }">
			<div class="d-flex">${userLoginId}<a class="pr-3" href="/user/signin/view">로그아웃</a></div>
		</c:if>
</header>