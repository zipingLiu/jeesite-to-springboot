<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>Studio用户管理</title>
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
		<li class="active"><a href="${ctx}/psuser/psUser/">Studio用户列表</a></li>
		<shiro:hasPermission name="psuser:psUser:edit"><li><a href="${ctx}/psuser/psUser/form">Studio用户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psUser" action="${ctx}/psuser/psUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>用户名：</label>
				<form:input path="userName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>更新时间：</label>
				<input name="lastLoginTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psUser.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>姓名：</label>
				<form:input path="trueName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>身份证：</label>
				<form:input path="idcard" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>手机号：</label>
				<form:input path="mobile" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>公司名称：</label>
				<form:input path="companyName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>邮箱：</label>
				<form:input path="email" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>id</th>
				<th>用户名</th>
				<th>更新时间</th>
				<th>姓名</th>
				<th>身份证</th>
				<th>手机号</th>
				<shiro:hasPermission name="psuser:psUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="psUser">
			<tr>
				<td><a href="${ctx}/psuser/psUser/form?id=${psUser.id}">
					${psUser.id}
				</a></td>
				<td>
					${psUser.userName}
				</td>
				<td>
					<fmt:formatDate value="${psUser.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${psUser.trueName}
				</td>
				<td>
					${psUser.idcard}
				</td>
				<td>
					${psUser.mobile}
				</td>
				<shiro:hasPermission name="psuser:psUser:edit"><td>
    				<a href="${ctx}/psuser/psUser/form?id=${psUser.id}">修改</a>
					<a href="${ctx}/psuser/psUser/delete?id=${psUser.id}" onclick="return confirmx('确认要删除该Studio用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>