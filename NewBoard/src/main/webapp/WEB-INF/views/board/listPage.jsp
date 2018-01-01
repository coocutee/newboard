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

a{text-decoration: none; color:#666666;}
a:hover{color:#45a4a6;   font-weight: bold;}
body{
width:810px;
/* height:800px;  나중에 설정해줘도됨*/
margin:0 auto;}
/* 만약 위와 테이블간의 여백을 띄우고 싶다면 0의 수치를 변경해주면됨 */

ul {
list-style : none;
margin : 16px auto;
padding : 0;
height:30px;
width: 30%;
}
 li{
margin : 0 0 0 0 ;
padding : 0 0 0 0 ;
border : 0;
float : left;
}

li:last-child{
margin-left:10px;}
 ul li a{
  display:block;
  color:#333333;
height:16px;
line-height:16px;
  width:20px;
  text-decoration:none;

  }
  

  
  table tr{
  height:40px;

  }
  
  table tr td{
   border-bottom:1px solid #80c4c5;
   text-align: center;
   
  }
  
  table tr td:nth-child(1){
  	width:45px;
  	font-weight: 600;
  }


  table tr td:nth-child(2){
  	width:130px;
  	
  }
  
  
   table tr td:nth-child(3){
  	width:230px;
  }
  
  
 table tr td:nth-child(4){
  	width:400px;
  }
  
  .text-center{position:relative;}
  
  .atext {
    display: block;
    width: 15%;
    position: absolute;
	top: -4px;
	right : 140px;
} 

 .tr_1{background-color: #45a4a6;
 color:#fff;}
</style>
<body>
 
<form id = "jobForm">
<input type="hidden" id = "page" name="page" value=${pageMaker.cri.page } >
<input type="hidden" id="perPageNum" name="perPageNum" value=${pageMaker.cri.perPageNum } >

</form>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>

	var result = '${msg}'
	
	if(result == 'success'){
		alert("글쓰기 완료!");
	}
	
	else if(result == 'remove'){
		alert("삭제되었습니다");
	}
</script>

<table class="tb_1" cellspacing="0" cellpadding="0">

<tr class="tr_1">
<td class="td_1"> No. </td>
<td class="td_2"> 제목 </td>
<td class="td_3"> 작성자  </td>
<td class="td_4"> 작성일자 </td>
</tr>
	
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
	
	
	<a href="/board/register" class="atext">글쓰기</a>
</div>





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