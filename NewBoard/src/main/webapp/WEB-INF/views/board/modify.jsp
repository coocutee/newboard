<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<Form role="form" method="post">


���� : <input type="text" name="title" value="${boardVO.title}"> 
<p>
�۾��� : <input type="text" name="id" value="${boardVO.id}" readonly="readonly">
<p>
���� : <input type="text" name="content" value="${boardVO.content}">


</Form>

<div>
 <button class="btn_modify" type="submit"> ���� </button>
 <button class="btn_list" type="submit"> ��� </button>
 
</div>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
$(".btn_modify").on("click",function(){
	formObj.submit();
});


$(".btn_list").on("click",function(){
	self.location = "/board/listAll";
});
	
});

</script>

</body>
</html>