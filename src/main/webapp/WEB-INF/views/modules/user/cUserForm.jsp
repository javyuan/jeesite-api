<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户修改</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		function initPwd(id){
			$.post("initPwd", { 'id' : id }, function(data){
				$("#password").val(data);
				alertx("初始化成功");
			} );
		}
		function clearImage(id){
			$.post("clearImage", { 'id' : id, 'imageId': '', 'imageUrl': '' }, function(data){
				$("#image").attr("src","");
				alertx("清除成功");
			} );
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/user/cUser/">用户列表</a></li>
		<li class="active"><a href="${ctx}/user/cUser/form?id=${cUser.id}">用户修改</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="cUser" action="${ctx}/user/cUser/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">手机号/ID：</label>
			<div class="controls">
				<form:input path="loginName" htmlEscape="false" maxlength="40" class="input-xlarge " readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">密码：</label>
			<div class="controls">
				<form:input path="password" htmlEscape="false" maxlength="50" class="input-xlarge " readonly="true"/>
				<a href="javascript:initPwd('${cUser.id}')">初始化密码</a>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">
				<input type="radio" name="status" <c:if test="${cUser.status == '0' }">checked="checked"</c:if> value="0">启用</input>
				<input type="radio" name="status" <c:if test="${cUser.status == '1' }">checked="checked"</c:if> value="1">冻结</input>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">积分：</label>
			<div class="controls">
				<form:input path="jf" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">注册时间：</label>
			<div class="controls">
				<fmt:formatDate value='${cUser.createDate}' pattern='yyyy-MM-dd HH:mm:ss'/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">头像：</label>
			<div class="controls">
				<form:hidden id="image" path="imageUrl" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="image" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">昵称：</label>
			<div class="controls">
				<form:input path="nickName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="realName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
				<input type="radio" name="sex" <c:if test="${cUser.sex == '0' }">checked="checked"</c:if> value="0">男</input>
				<input type="radio" name="sex" <c:if test="${cUser.sex == '1' }">checked="checked"</c:if> value="1">女</input>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>