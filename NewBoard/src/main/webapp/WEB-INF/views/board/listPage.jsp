<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<style>
ul {
list-style : none;
margin : 0;
padding : 0;
}
 li{
margin : 0 0 0 0 ;
padding : 0 0 0 0 ;
border : 0;
float : left;
}
</style>
<body>
 
<form id = "jobForm">
<input type="hidden" id = "page" name="page" value=${pageMaker.cri.page } >
<input type="hidden" id="perPageNum" name="perPageNum" value=${pageMaker.cri.perPageNum } >

</form>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>


리스트페이지입니당 :)

<script>

	var result = '${msg}'
	
	if(result == 'success'){
		alert("글쓰기 완료!");
	}
	
	else if(result == 'remove'){
		alert("삭제되었습니다");
	}
</script>

<table>
	
<c:forEach items="${list}" var="boardVO">
<tr>
	<td> ${boardVO.bno} </td>
	<td> <a href='/board/view?bno=${boardVO.bno}'>${boardVO.title} </a></td>
	<td> ${boardVO.id} </td>
	<td> <fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value = "${boardVO.regdate}"/> </td>	
</tr>
	

</c:forEach>


</table>

<div class = "text-center">
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li> <a 
				href = "listPage${pageMaker.makeQuery(pageMaker.startPage -1)}">&laquo;</a> </li>
		</c:if>
	
		<c:forEach begin = "${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
		<li
		 <c:out value="${pageMaker.cri.page == idx? 'class=active':''}" />>
			<a 
				href = "listPage${pageMaker.makeQuery(idx)}"> ${idx} </a>
		</li>
		</c:forEach>
		
		<c:if test = "${pageMaker.next && pageMaker.endPage > 0 }">
			<li> <a 
				href = "listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a> </li>
		</c:if>
	</ul>
</div>

<a href="/board/register">글쓰기</a>



<!-- <script>
$(".pagination li a").on("click", function(event){
    event.preventDefault();
    
    var targetPage = $(this).attr("href");
    
    var jobForm = $("#jobForm");
    jobForm.find("[name='page']").val(targetPage);
    jobForm.attr("action","/board/listPage").attr("method", "get");
    jobForm.submit();
    
    // 페이지 번호가 클릭되면 event.preventDefault()를 이용해 실제 화면의 이동을 막고, <a> 태그의 페이지 번호를 찾아 <form> 태그를 전송 
});


</script> -->

</body>
</html>