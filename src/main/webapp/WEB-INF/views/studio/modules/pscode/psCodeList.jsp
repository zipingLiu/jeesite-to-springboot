<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>code测试管理</title>
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
		<li class="active"><a href="${ctx}/pscode/psCode/">code测试列表</a></li>
		<shiro:hasPermission name="pscode:psCode:edit"><li><a href="${ctx}/pscode/psCode/form">code测试添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psCode" action="${ctx}/pscode/psCode/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>code名称：</label>
				<form:input path="codeName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>code内容：</label>
				<form:input path="codeContent" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psCode.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
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
				<th>code名称</th>
				<th>code内容</th>
				<th>用户ID</th>
				<th>创建时间</th>
				<shiro:hasPermission name="pscode:psCode:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="psCode">
			<tr>
				<td><a href="${ctx}/pscode/psCode/form?id=${psCode.id}">
					${psCode.id}
				</a></td>
				<td>
					${psCode.codeName}
				</td>
				<td>
					${psCode.codeContent}
				</td>
				<td>
					${psCode.user.name}
				</td>
				<td>
					<fmt:formatDate value="${psCode.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="pscode:psCode:edit"><td>
    				<a href="${ctx}/pscode/psCode/form?id=${psCode.id}">修改</a>
					<a href="${ctx}/pscode/psCode/delete?id=${psCode.id}" onclick="return confirmx('确认要删除该code测试吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>