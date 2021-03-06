<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="staticCtx" value="${pageContext.request.contextPath}/static" />
<html>
<head>
<title>员工专业性得分</title>
<script src="${ctx}/static/My97/WdatePicker.js"></script>
<script type="text/javascript">
	//查看
	function look(beEvaluatedId, createTime) {		
		var time = createTime.substring(0, 10);		
		window.location.href = "${ctx}/admin/specialty/lookScoreDetail?createTime="
				+ time + "&beEvaluatedId=" + beEvaluatedId;					
	}
	function formatDate(times) {
		var date = new Date(times);
		var fm = date.format('yyyy-MM');
		return fm;
	}
	//清空搜索条件
	function resetSearch() {
		$("input").val('');
	}
</script>
</head>
<body>
	<form id="queryForm" class="form-inline"  action="employeScore" method="post">
		<table>
			<tr>
				<td><label for="beEvaluatedName" class="control-label">姓名：</label></td>
				<td><input type="text" id="name" name="beEvaluatedName" value="${specialtyQuery.beEvaluatedName }"
					class="input-medium" /></td>
				<td><label for="mt" class="control-label">部门负责人：</label></td>
				<td><input type="text" name="mt" class="input-medium" value="${specialtyQuery.mt }" /></td>
			</tr>
			<tr>
				<td><label for="departmentId" class="control-label">部门：</label></td>
				<td><select id="departmentId" name="departmentId"
					class="span12">
						<option value="${departmentList[0].id }">${departmentList[0].name }</option>
						<c:forEach var="department" items="${departmentList }" begin="1">
							<option value="${department.id }"
								<c:if test="${department.id==departmentId }">selected="selected"</c:if>>${department.name }</option>
						</c:forEach>
				</select></td>
				<td><label for="time" class="control-label">时间：</label></td>
				<td><input
					onfocus="new WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM'})"
					type="text" id="createTime" name="createTime"
					class="input-medium Wdate" value="${queryTime }"/></td>
			</tr>
		</table>		
		<button class="btn" id="btnSearch" type="submit">搜索</button>
		<button class="btn" type="button" onclick="resetSearch();" /> 清空 </button>		
	</form>
	<table class="table  table-striped table-bordered table-condensed">
		<thead>
			<tr align="center">
				<th>序号</th>
				<th>姓名</th>
				<th>部门</th>
				<th>MT负责人</th>				
				<th>专业性1</th>
				<th>专业性2</th>
				<th>专业总分</th>
				<th>评价时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="employeJX" items="${employeScoreList }"
				varStatus="status">
				<tr align="center">
					<td>${status.index+1 }</td>
					<td>${employeJX.beEvaluatedName }</td>
					<td>${employeJX.departmentName }</td>
					<td>${employeJX.mt }</td>
					<%-- <c:forEach var="specialty" items="${speList}">
						<c:forEach var="specialtyJX" items="${employeJX.specialtyJXList }">						
							<c:choose>
							   <c:when test="${specialty.specId == specialtyJX.specialtyId }"> 
							   		<td>${specialtyJX.score }</td>
							   </c:when>							   					  
							</c:choose>
						</c:forEach>
					</c:forEach> --%>
					<td>
						<c:if test="${employeJX.specialtyJXList.size()>0 }">
							${employeJX.specialtyJXList[0].score }
						</c:if>
					</td>						
					<td>
						<c:if test="${employeJX.specialtyJXList.size()==2 }">
							${employeJX.specialtyJXList[1].score }
						</c:if>
					</td>				
										
					<td>				
						<c:if test="${employeJX.totalScore!=0.0 }">	
							${employeJX.totalScore }							
						</c:if>
					</td>
					<td><fmt:formatDate value="${employeJX.evaluateTime }"	pattern="yyyy-MM" /></td>
					<td><a href="javascript:void(0)"
						onclick="look('${employeJX.beEvaluatedId}','${employeJX.createTime}');">查看</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script type="text/javascript">

</script>
</html>
