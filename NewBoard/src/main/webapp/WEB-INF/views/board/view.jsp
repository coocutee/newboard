<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
button{border:1px; border-radius:5px; background:#cce0e15; width:44px; height:24px;}
button:hover{color:#45a4a6; font-weight:bold; border:1px solid #0c989d;}

</style>


<body>

<Form role="form" method="post">

<input type="hidden" name="bno" value="${boardVO.bno}"> 

</Form>

제목 : ${boardVO.title}
<p>
글쓴이 : ${boardVO.id}
<p>
내용 : ${boardVO.content}



<div>
 <button class="btn_modify" type="submit"> 수정 </button>
 <button class="btn_remove" type="submit"> 삭제 </button>
 <button class="btn_list" type="submit"> 목록 </button>
 
</div>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
$(".btn_modify").on("click",function(){
	formObj.attr("action","/board/modify");
	formObj.attr("method","get");
	formObj.submit();
});

$(".btn_remove").on("click",function(){
	formObj.attr("action","/board/remove");
	formObj.submit();
});

$(".btn_list").on("click",function(){
	self.location = "/board/listAll";
});
	
});

</script>

</body>
</html>



