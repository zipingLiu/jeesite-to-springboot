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
			//$("#name").focus();
            // 设置隐藏列
            hideShowTableTd('contentTable', '${colHide}', 0);
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
        /**
          * table列显示隐藏
          * @param tableId
          * @param columns table列索引 例： 0,1，2,3
          * @param type 显示隐藏列 1.显示table列 2.隐藏table列
          */
        function hideShowTableTd(tableId, columns, type) {
            var strs = new Array(); //定义一数组
            strs = columns.split(","); //字符分割
            var tableTd = "";
            for (var i = 0; i < strs.length; i++) {
                tableTd += "td:eq(" + strs[i] + "),th:eq(" + strs[i] + "),"
            }
            tableTd = tableTd.substring(0, tableTd.length - 1);
            if (type == 0) {
                $('#' + tableId + ' tr').find(tableTd).hide();
            }
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/psmatchprocess/psMatchProcess/">比赛阶段列表</a></li>
		<shiro:hasPermission name="psmatchprocess:psMatchProcess:edit"><li><a href="${ctx}/psmatchprocess/psMatchProcess/form">添加比赛阶段</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psMatchProcess" action="${ctx}/psmatchprocess/psMatchProcess/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>阶段名称：</label>
				<form:input path="processName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>比赛名称：</label>
				<form:select path="matchId" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${matchList}" itemLabel="matchName" itemValue="id" htmlEscape="false"/>
				</form:select>
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
				<%--<li><label>关联项目：</label>
                    <form:select path="projectId" class="input-medium">
                        <form:option value="" label="请选择"/>
                        <form:options items="${projectList}" itemLabel="projectName" itemValue="id" htmlEscape="false"/>
                    </form:select>
                </li>
                <li><label>是否可自己报名：</label>
                    <form:select path="selfSignup" class="input-medium">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getDictList('self_signup')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                    </form:select>
                </li>
                <li><label>是否有排行版：</label>
                    <form:select path="hasLeaderboard" class="input-medium">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getDictList('has_leaderboard')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                    </form:select>
                </li>
                <li><label>执行脚本：</label>
                    <form:input path="evalDockerImage" htmlEscape="false" maxlength="255" class="input-medium"/>
                </li>
                <li><label>处理类：</label>
                    <form:input path="evalService" htmlEscape="false" maxlength="255" class="input-medium"/>
                </li>
                <li><label>Docker命令：</label>
                    <form:input path="evalDockerCommand" htmlEscape="false" maxlength="255" class="input-medium"/>
                </li>
                <li><label>列JSON：</label>
                    <form:input path="columns" htmlEscape="false" maxlength="255" class="input-medium"/>
                </li>--%>
			<li><label>Token开始时间：</label>
				<input name="tokenStartTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatchProcess.tokenStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
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
				<th class="sort-column processName">阶段名称</th>
				<th class="sort-column matchId">比赛名称</th>
				<th class="sort-column startTime">开始时间</th>
				<th class="sort-column endTime">结束时间</th>
				<th class="sort-column projectId">关联项目</th>
				<th class="sort-column selfSignup">是否可自己报名</th>
				<th class="sort-column hasLeaderboard">是否有排行版</th>
				<th class="sort-column evalDockerImage">执行脚本</th>
				<th class="sort-column evalService">处理类</th>
				<th class="sort-column evalDockerCommand">Docker命令</th>
				<th class="sort-column columns">列JSON</th>
				<th class="sort-column tokenStartTime">获取Token开始时间</th>
				<th>排行榜</th>
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
					${psMatchProcess.matchName}
				</td>
				<td>
					<fmt:formatDate value="${psMatchProcess.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${psMatchProcess.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${psMatchProcess.projectName}
				</td>
				<td>
					${fns:getDictLabel(psMatchProcess.selfSignup, 'self_signup', '')}
				</td>
				<td>
					${fns:getDictLabel(psMatchProcess.hasLeaderboard, 'has_leaderboard', '')}
				</td>
				<td>
					<span class="tooltip-show" title="${psMatchProcess.evalDockerImage}">${psMatchProcess.evalDockerImage}</span>
				</td>
				<td>
					<span class="tooltip-show" title="${psMatchProcess.evalService}">${psMatchProcess.evalService}</span>
				</td>
				<td>
					<span class="tooltip-show" title="${psMatchProcess.evalDockerCommand}">${psMatchProcess.evalDockerCommand}</span>
				</td>
				<td>
					<span class="tooltip-show" title="${psMatchProcess.columns}">${psMatchProcess.columns}</span>
				</td>
				<td>
					<fmt:formatDate value="${psMatchProcess.tokenStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<a href="${ctx}/psmatchsubmit/psMatchSubmit/list?matchId=${psMatchProcess.matchId}&processId=${psMatchProcess.id}&orderBy=score DESC&submitTopNum=${submitTopNum}">排行榜</a>
				</td>
				<shiro:hasPermission name="psmatchprocess:psMatchProcess:edit">
					<td>
						<a href="${ctx}/psmatchprocess/psMatchProcess/form?id=${psMatchProcess.id}">修改</a>
						<a href="${ctx}/psmatchprocess/psMatchProcess/delete?id=${psMatchProcess.id}" onclick="return confirmx('确认要删除该比赛阶段吗？', this.href)">删除</a>
					</td>
				</shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>