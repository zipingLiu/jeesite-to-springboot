<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>比赛阶段管理</title>
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
		<li class="active"><a href="${ctx}/psmatchprocess/psMatchProcess/">比赛阶段列表</a></li>
		<shiro:hasPermission name="psmatchprocess:psMatchProcess:edit"><li><a href="${ctx}/psmatchprocess/psMatchProcess/form">比赛阶段添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psMatchProcess" action="${ctx}/psmatchprocess/psMatchProcess/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>阶段名称：</label>
				<form:input path="processName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>比赛ID：</label>
				<form:input path="matchId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>开始时间：</label>
				<input name="startTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatchProcess.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>结束时间：</label>
				<input name="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatchProcess.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>关联项目：</label>
				<form:input path="projectId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>是否可自己报名：</label>
				<form:select path="selfSignup" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('self_signup')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>是否有排行版：</label>
				<form:select path="hasLeaderboard" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('has_leaderboard')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>执行脚本：</label>
				<form:input path="evalDockerImage" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>获取Token开始时间：</label>
				<input name="tokenStartTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatchProcess.tokenStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>ID</th>
				<th>阶段名称</th>
				<th>比赛ID</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>关联项目</th>
				<th>是否可自己报名</th>
				<th>是否有排行版</th>
				<th>获取Token开始时间</th>
				<shiro:hasPermission name="psmatchprocess:psMatchProcess:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="psMatchProcess">
			<tr>
				<td><a href="${ctx}/psmatchprocess/psMatchProcess/form?id=${psMatchProcess.id}">
					${psMatchProcess.id}
				</a></td>
				<td>
					${psMatchProcess.processName}
				</td>
				<td>
					${psMatchProcess.matchId}
				</td>
				<td>
					<fmt:formatDate value="${psMatchProcess.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${psMatchProcess.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${psMatchProcess.projectId}
				</td>
				<td>
					${fns:getDictLabel(psMatchProcess.selfSignup, 'self_signup', '')}
				</td>
				<td>
					${fns:getDictLabel(psMatchProcess.hasLeaderboard, 'has_leaderboard', '')}
				</td>
				<td>
					<fmt:formatDate value="${psMatchProcess.tokenStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="psmatchprocess:psMatchProcess:edit"><td>
    				<a href="${ctx}/psmatchprocess/psMatchProcess/form?id=${psMatchProcess.id}">修改</a>
					<a href="${ctx}/psmatchprocess/psMatchProcess/delete?id=${psMatchProcess.id}" onclick="return confirmx('确认要删除该比赛阶段吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>