<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>项目管理</title>
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
		<li class="active"><a href="${ctx}/psproject/psProject/">项目列表</a></li>
		<shiro:hasPermission name="psproject:psProject:edit"><li><a href="${ctx}/psproject/psProject/form">项目添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psProject" action="${ctx}/psproject/psProject/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>项目名称：</label>
				<form:input path="projectName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>项目简介：</label>
				<form:input path="projectAbs" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>
			<li><label>用户ID：</label>
				<form:input path="userId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>状态：</label>
				<form:select path="statusCode" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('studio_status_code')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psProject.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新时间：</label>
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psProject.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>文件ID：</label>
				<form:input path="projectFileId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>项目类型：</label>
				<form:select path="projectType" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('ps_project_project_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>办公项目：</label>
				<form:input path="officeProject" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>项目框架：</label>
				<form:input path="projectFramework" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>项目环境：</label>
				<form:input path="projectEnvironment" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>Fork来源：</label>
				<form:input path="forkFrom" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>项目Html：</label>
				<form:input path="projectHtml" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>项目权重：</label>
				<form:input path="projectWeight" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>fork数：</label>
				<form:input path="forkCount" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>收藏数：</label>
				<form:input path="collectCount" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>评论数：</label>
				<form:input path="commentCount" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>每周热度：</label>
				<form:input path="weekWeight" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>每月热度：</label>
				<form:input path="monthWeight" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>资源分配：</label>
				<form:input path="resourceAlloc" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>0cpu集群：</label>
				<form:select path="activeNotebookCluster" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('active_notebook_cluster')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>活跃Notebook：</label>
				<form:input path="activeNotebookCookie" htmlEscape="false" maxlength="300" class="input-medium"/>
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
				<th class="sort-column projectName">项目名称</th>
				<th class="sort-column projectAbs">项目简介</th>
				<th class="sort-column userId">用户ID</th>
				<th class="sort-column statusCode">状态</th>
				<th class="sort-column createTime">创建时间</th>
				<th class="sort-column updateTime">更新时间</th>
				<th class="sort-column projectFileId">文件ID</th>
				<th class="sort-column projectType">项目类型</th>
				<th class="sort-column officeProject">办公项目</th>
				<th class="sort-column projectFramework">项目框架</th>
				<th class="sort-column projectEnvironment">项目环境</th>
				<th class="sort-column forkFrom">Fork来源</th>
				<th class="sort-column projectHtml">项目Html</th>
				<th class="sort-column projectWeight">项目权重</th>
				<th class="sort-column forkCount">fork数</th>
				<th class="sort-column collectCount">收藏数</th>
				<th class="sort-column commentCount">评论数</th>
				<th class="sort-column weekWeight">每周热度</th>
				<th class="sort-column monthWeight">每月热度</th>
				<th class="sort-column resourceAlloc">资源分配</th>
				<th class="sort-column activeNotebookCluster">0cpu集群</th>
				<th class="sort-column activeNotebookCookie">活跃Notebook</th>
				<th class="sort-column activeNotebookPath">Notebook路径</th>
				<shiro:hasPermission name="psproject:psProject:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="psProject">
			<tr>
				<td><a href="${ctx}/psproject/psProject/form?id=${psProject.id}">
					${psProject.id}
				</a></td>
				<td>
					${psProject.projectName}
				</td>
				<td>
					${psProject.projectAbs}
				</td>
				<td>
					${psProject.userId}
				</td>
				<td>
					${fns:getDictLabel(psProject.statusCode, 'studio_status_code', '')}
				</td>
				<td>
					<fmt:formatDate value="${psProject.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${psProject.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${psProject.projectFileId}
				</td>
				<td>
					${fns:getDictLabel(psProject.projectType, 'ps_project_project_type', '')}
				</td>
				<td>
					${psProject.officeProject}
				</td>
				<td>
					${psProject.projectFramework}
				</td>
				<td>
					${psProject.projectEnvironment}
				</td>
				<td>
					${psProject.forkFrom}
				</td>
				<td>
					${psProject.projectHtml}
				</td>
				<td>
					${psProject.projectWeight}
				</td>
				<td>
					${psProject.forkCount}
				</td>
				<td>
					${psProject.collectCount}
				</td>
				<td>
					${psProject.commentCount}
				</td>
				<td>
					${psProject.weekWeight}
				</td>
				<td>
					${psProject.monthWeight}
				</td>
				<td>
					${psProject.resourceAlloc}
				</td>
				<td>
					${fns:getDictLabel(psProject.activeNotebookCluster, 'active_notebook_cluster', '')}
				</td>
				<td>
					${psProject.activeNotebookCookie}
				</td>
				<td>
					${psProject.activeNotebookPath}
				</td>
				<shiro:hasPermission name="psproject:psProject:edit"><td>
    				<a href="${ctx}/psproject/psProject/form?id=${psProject.id}">修改</a>
					<a href="${ctx}/psproject/psProject/delete?id=${psProject.id}" onclick="return confirmx('确认要删除该项目吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>