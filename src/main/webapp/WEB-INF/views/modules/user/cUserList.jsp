<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/user/cUser/">用户列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="cUser" action="${ctx}/user/cUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
				<label>手机号/ID：</label>
				<form:input path="loginName" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li>
				<label>冻结状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="">--全部--</form:option>
					<form:option value="0">未冻结</form:option>
					<form:option value="1">已冻结</form:option>
				</form:select>
			</li>
			<li>
				<label>用户类型：</label>
				<form:select path="userType" class="input-medium">
					<form:option value="1">注册用户</form:option>
					<form:option value="2">第三方用户</form:option>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>手机号/ID</th>
				<th>昵称</th>
				<th>姓名</th>
				<th>冻结状态</th>
				<th>注册日期</th>
				<th>积分</th>
				<shiro:hasPermission name="user:cUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cUser">
			<tr>
				<td>
					<a href="${ctx}/user/cUser/form?id=${cUser.id}">
						${cUser.loginName }
					</a>
				</td>
				<td>
					${cUser.nickName}
				</td>
				<td>
					${cUser.realName}
				</td>
				<td>
					<c:if test="${cUser.status == '0'}">未冻结</c:if>
					<c:if test="${cUser.status == '1'}">已冻结</c:if>
				</td>
				<td>
					<fmt:formatDate value="${cUser.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${cUser.jf}
				</td>
				<shiro:hasPermission name="user:cUser:edit"><td>
					<c:if test="${cUser.status == '0'}"><a href="${ctx}/user/cUser/lock?id=${cUser.id}">冻结</a></c:if>
					<c:if test="${cUser.status == '1'}"><a href="${ctx}/user/cUser/unlock?id=${cUser.id}">解冻</a></c:if>
    				<a href="${ctx}/user/cUser/form?id=${cUser.id}">修改</a>
					<a href="${ctx}/user/cUser/delete?id=${cUser.id}" onclick="return confirmx('确认要删除该单表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>