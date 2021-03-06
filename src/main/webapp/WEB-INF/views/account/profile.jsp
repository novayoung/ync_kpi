<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>资料修改</title>
</head>

<body>
	<form id="inputForm" action="${ctx}/profile" method="post"
		class="form-horizontal">
		<input type="hidden" name="id" value="${user.id}" />
		<fieldset>
			<legend>
				<small>资料修改</small>
			</legend>
			<c:if test="${error != null }">
				<div class="alert alert-error input-medium controls">
					<button class="close" data-dismiss="alert">×</button>
					${error }
				</div>
			</c:if>
			<div class="control-group">
				<label for="name" class="control-label">用户名:</label>
				<div class="controls">
					<input type="text" id="name" name="name" value="${user.loginName}"
						class="input-large required" disabled="disabled" />
				</div>
			</div>
			<div class="control-group">
				<label for="plainPassword" class="control-label">原密码:</label>
				<div class="controls">
					<input type="password" id="oldPassword" name="oldPassword"
						class="input-large required" />
				</div>
			</div>
			<div class="control-group">
				<label for="plainPassword" class="control-label">密码:</label>
				<div class="controls">
					<input type="password" id="password" name="password"
						class="input-large" />
				</div>
			</div>
			<div class="control-group">
				<label for="confirmPassword" class="control-label">确认密码:</label>
				<div class="controls">
					<input type="password" id="confirmPassword" name="confirmPassword"
						class="input-large required" equalTo="#password" />
				</div>
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit"
					value="提交" />&nbsp; <input id="cancel_btn" class="btn"
					type="button" value="返回" onclick="history.back()" />
			</div>
		</fieldset>
	</form>

	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate({
				rules:{
					password:{required:true,minlength:5,maxlength:15}
				}
			});
		});
	</script>
</body>
</html>
