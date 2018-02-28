<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">
				
<table class="table table-bordered">
	<tr>
		<th style="width: 10px">BNO</th>
		<th>TITLE</th>
		<th>WRITER</th>
		<th>REGDATE</th>
		<th style="width: 40px">VIEWCNT</th>
	</tr>


<c:forEach items="${list}" var="boardVO">

	<tr>
		<td>${boardVO.bno}</td>
		<td><a
				href='/board/read${pageMaker.makeQuery(pageMaker.cri.page) }?bno=${boardVO.bno}'>
				${boardVO.title}</a></td>
		<!-- <td><a href='/board/read?bno=${boardVO.bno}'>${boardVO.title}</a></td> -->
		<td>${boardVO.writer}</td>
		<td><fmt:formatDate pattern="yyyy년MM월dd일 HH시mm분"
				value="${boardVO.regdate}" /></td>
		<td><span class="badge bg-green">${boardVO.viewcnt }</span></td>
	</tr>

</c:forEach>

</table>

				</div>
				<!-- /.box-body -->
				
				<div class="box-footer" >
				<button type="submit" class="btn btn-primary">WRITE</button></div>
				

				
				<!-- /.box-footer-->
			
		<!--/.col (left) -->

	
	<!-- /.row -->
	
	


				
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

				<!-- /.box-footer-->
			
</section>
<!-- /.content -->
<form id="jobForm">
  <input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
  <input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>
<!-- /.content-wrapper -->
<script>
				
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-primary").on("click", function(){
		self.location = "/board/register";
	});
	
});

</script>
<script>
    
    var result = '${msg}';
    
    if(result == 'SUCCESS'){
    	alert("처리가 완료되었습니다.");
    }
    
    </script>

<%@include file="../include/footer.jsp"%>
