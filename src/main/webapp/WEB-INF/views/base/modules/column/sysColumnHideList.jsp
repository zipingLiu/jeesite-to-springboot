<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>列隐藏配置管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#searchForm").validate({
				submitHandler: function(form){
					loading('正在查询，请稍等...');
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
		<li class="active"><a href="${ctx}/column/sysColumnHide/">列隐藏配置列表</a></li>
		<shiro:hasPermission name="column:sysColumnHide:edit"><li><a href="${ctx}/column/sysColumnHide/form">列隐藏配置添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysColumnHide" action="${ctx}/column/sysColumnHide/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>页面名称：</label>
				<form:input path="pageName" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>所属类名：</label>
				<form:input path="className" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>隐藏列索引：</label>
				<form:input path="columnHideArr" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-nowrap">
		<thead>
			<tr>
				<th class="sort-column id">ID</th>
				<th class="sort-column pageName">页面名称</th>
				<th class="sort-column className">所属类名</th>
				<th class="sort-column columnHideArr">隐藏列索引</th>
				<shiro:hasPermission name="column:sysColumnHide:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysColumnHide">
			<tr>
				<td><a href="${ctx}/column/sysColumnHide/form?id=${sysColumnHide.id}">
					${sysColumnHide.id}
				</a></td>
				<td>
					${sysColumnHide.pageName}
				</td>
				<td>
					${sysColumnHide.className}
				</td>
				<td>
					${sysColumnHide.columnHideArr}
				</td>
				<shiro:hasPermission name="column:sysColumnHide:edit"><td>
    				<a href="${ctx}/column/sysColumnHide/form?id=${sysColumnHide.id}">修改</a>
					<a href="${ctx}/column/sysColumnHide/delete?id=${sysColumnHide.id}" onclick="return confirmx('确认要删除该列隐藏配置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>