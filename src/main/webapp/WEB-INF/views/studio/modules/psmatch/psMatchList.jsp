<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>比赛管理</title>
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
		<li class="active"><a href="${ctx}/psmatch/psMatch/">比赛列表</a></li>
		<shiro:hasPermission name="psmatch:psMatch:edit"><li><a href="${ctx}/psmatch/psMatch/form">添加比赛</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psMatch" action="${ctx}/psmatch/psMatch/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>比赛名称：</label>
				<form:input path="matchName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>状态：</label>
				<form:input path="statusCode" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatch.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新时间：</label>
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatch.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>关键字：</label>
				<form:input path="matchKey" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>当前比赛阶段：</label>
				<form:input path="processId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>关联项目：</label>
				<form:input path="projectId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>比赛奖金：</label>
				<form:input path="reward" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>报名人数：</label>
				<form:input path="signupCount" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>标签：</label>
				<form:input path="tags" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>开始时间：</label>
				<input name="startTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatch.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>结束时间：</label>
				<input name="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatch.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>简介：</label>
				<form:input path="matchAbs" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>是否为常规赛：</label>
				<form:select path="routine" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('routine')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>ID</th>
				<th>比赛名称</th>
				<th>状态</th>
				<th>创建时间</th>
				<th>当前比赛阶段</th>
				<th>比赛奖金</th>
				<th>报名人数</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<shiro:hasPermission name="psmatch:psMatch:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="psMatch">
			<tr>
				<td><a href="${ctx}/psmatch/psMatch/form?id=${psMatch.id}">
					${psMatch.id}
				</a></td>
				<td>
					${psMatch.matchName}
				</td>
				<td>
					${psMatch.statusCode}
				</td>
				<td>
					<fmt:formatDate value="${psMatch.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${psMatch.processId}
				</td>
				<td>
					${psMatch.reward}
				</td>
				<td>
					${psMatch.signupCount}
				</td>
				<td>
					<fmt:formatDate value="${psMatch.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${psMatch.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="psmatch:psMatch:edit"><td>
    				<a href="${ctx}/psmatch/psMatch/form?id=${psMatch.id}">修改</a>
					<a href="${ctx}/psmatch/psMatch/delete?id=${psMatch.id}" onclick="return confirmx('确认要删除该比赛吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
				<td>
					<a href="${ctx}/psmatchprocess/psMatchProcess/toProcessList/${psMatch.id}">阶段</a>
				</td>
				<td>
					<a href="${ctx}/psmatchuser/psMatchUser/toMatchUserList/${psMatch.id}">参赛</a>
				</td>
				<td>
					<a href="${ctx}/psmatchsubmit/psMatchSubmit/toSubmitList/${psMatch.id}">提交</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>