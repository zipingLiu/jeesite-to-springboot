<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>报名用户管理</title>
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
		<li class="active"><a href="${ctx}/psmatchuser/psMatchUser/">报名用户列表</a></li>
		<shiro:hasPermission name="psmatchuser:psMatchUser:edit"><li><a href="${ctx}/psmatchuser/psMatchUser/form">报名用户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psMatchUser" action="${ctx}/psmatchuser/psMatchUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>比赛ID：</label>
				<form:input path="matchId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>用户ID：</label>
				<form:input path="userId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>阶段ID：</label>
				<form:input path="processId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatchUser.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新时间：</label>
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatchUser.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>常规赛是否通过：</label>
				<form:select path="routinePass" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('routine_pass')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-nowrap">
		<thead>
			<tr>
				<th>ID</th>
				<th>比赛ID</th>
				<th>用户ID</th>
				<th>阶段ID</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>常规赛是否通过</th>
				<shiro:hasPermission name="psmatchuser:psMatchUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="psMatchUser">
			<tr>
				<td><a href="${ctx}/psmatchuser/psMatchUser/form?id=${psMatchUser.id}">
					${psMatchUser.id}
				</a></td>
				<td>
					${psMatchUser.matchId}
				</td>
				<td>
					${psMatchUser.userId}
				</td>
				<td>
					${psMatchUser.processId}
				</td>
				<td>
					<fmt:formatDate value="${psMatchUser.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${psMatchUser.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(psMatchUser.routinePass, 'routine_pass', '')}
				</td>
				<shiro:hasPermission name="psmatchuser:psMatchUser:edit"><td>
    				<a href="${ctx}/psmatchuser/psMatchUser/form?id=${psMatchUser.id}">修改</a>
					<a href="${ctx}/psmatchuser/psMatchUser/delete?id=${psMatchUser.id}" onclick="return confirmx('确认要删除该报名用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>