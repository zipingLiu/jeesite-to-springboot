<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>提交管理</title>
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
		<li class="active"><a href="${ctx}/psmatchsubmit/psMatchSubmit/">提交列表</a></li>
		<shiro:hasPermission name="psmatchsubmit:psMatchSubmit:edit"><li><a href="${ctx}/psmatchsubmit/psMatchSubmit/form">提交添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psMatchSubmit" action="${ctx}/psmatchsubmit/psMatchSubmit/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatchSubmit.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>提交状态：</label>
				<form:select path="statusCode" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('status_code')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>最后更新时间：</label>
				<input name="lastUpdateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatchSubmit.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>提交人：</label>
				<form:input path="userId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>分数：</label>
				<form:input path="score" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>bos的key值：</label>
				<form:input path="bosKey" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>
			<li><label>bos的url：</label>
				<form:input path="bosFileUrl" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>任务开始时间：</label>
				<form:input path="startTime" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>任务结束时间：</label>
				<form:input path="endTime" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>阶段ID：</label>
				<form:input path="processId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>是否匿名：</label>
				<form:select path="anonymous" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('anonymous')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>项目ID：</label>
				<form:input path="projectId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>比赛ID：</label>
				<form:input path="matchId" htmlEscape="false" maxlength="10" class="input-medium"/>
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
				<th>提交状态</th>
				<th>提交人</th>
				<th>分数</th>
				<th>任务开始时间</th>
				<th>任务结束时间</th>
				<th>阶段ID</th>
				<th>是否匿名</th>
				<th>项目ID</th>
				<th>比赛ID</th>
				<shiro:hasPermission name="psmatchsubmit:psMatchSubmit:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="psMatchSubmit">
			<tr>
				<td><a href="${ctx}/psmatchsubmit/psMatchSubmit/form?id=${psMatchSubmit.id}">
					${psMatchSubmit.id}
				</a></td>
				<td>
					${fns:getDictLabel(psMatchSubmit.statusCode, 'status_code', '')}
				</td>
				<td>
					${psMatchSubmit.userName}
				</td>
				<td>
					${psMatchSubmit.score}
				</td>
				<td>
					${psMatchSubmit.startTime}
				</td>
				<td>
					${psMatchSubmit.endTime}
				</td>
				<td>
					${psMatchSubmit.processId}
				</td>
				<td>
					${fns:getDictLabel(psMatchSubmit.anonymous, 'anonymous', '')}
				</td>
				<td>
					${psMatchSubmit.projectId}
				</td>
				<td>
					${psMatchSubmit.matchId}
				</td>
				<shiro:hasPermission name="psmatchsubmit:psMatchSubmit:edit"><td>
    				<a href="${ctx}/psmatchsubmit/psMatchSubmit/form?id=${psMatchSubmit.id}">修改</a>
					<a href="${ctx}/psmatchsubmit/psMatchSubmit/delete?id=${psMatchSubmit.id}" onclick="return confirmx('确认要删除该提交吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>