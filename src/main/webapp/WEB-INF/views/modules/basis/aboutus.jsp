<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>关于我们</title>
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
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/basis/aboutus/form">关于我们</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="article" action="${ctx}/basis/aboutus/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="type" value="1"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">内容:</label>
			<div class="controls">
				<form:textarea id="content" htmlEscape="true" path="content" rows="50" maxlength="2000" class="input-xxlarge"/>
				<sys:ckeditor replace="content" uploadPath="/basis/aboutus" />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="basis:aboutus:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
		</div>
	</form:form>
</body>
</html>