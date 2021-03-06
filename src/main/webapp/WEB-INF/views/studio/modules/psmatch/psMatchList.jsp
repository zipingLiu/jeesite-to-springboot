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
		<li class="active"><a href="${ctx}/psmatch/psMatch/">比赛列表</a></li>
		<shiro:hasPermission name="psmatch:psMatch:edit"><li><a href="${ctx}/psmatch/psMatch/form">添加比赛</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psMatch" action="${ctx}/psmatch/psMatch/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>比赛名称：</label>
				<form:input path="matchName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>比赛奖金：</label>
				<form:input path="reward" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<%--<li><label>当前比赛阶段：</label>
				<form:input path="processId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>--%>
			<li><label>报名人数：</label>
				<form:input path="signupCount" htmlEscape="false" maxlength="10" class="input-medium digits"/>
			</li>
			<li><label>标签：</label>
				<form:input path="tags" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>关键字：</label>
				<form:input path="matchKey" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>简介：</label>
				<form:input path="matchAbs" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>是否为常规赛：</label>
				<form:select path="routine" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('ps_match_routine')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>状态：</label>
				<form:select path="statusCode" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('ps_match_status_code')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<br />
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
			<%--<li><label>关联项目：</label>--%>
					<%--<form:input path="projectId" htmlEscape="false" maxlength="10" class="input-medium"/>--%>
				<%--<form:select path="projectId" class="input-medium">--%>
					<%--<form:option value="" label="请选择"/>--%>
					<%--<form:options items="${projectList}" itemLabel="projectName" itemValue="id" htmlEscape="false"/>--%>
				<%--</form:select>--%>
			<%--</li>--%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-nowrap">
		<thead>
			<tr>
				<th class="sort-column id">ID</th>
				<th>比赛名称</th>
				<th>比赛奖金</th>
				<th class="sort-column processId">当前比赛阶段</th>
				<th class="sort-column signupCount">报名人数</th>
				<th class="sort-column projectId">关联项目</th>
				<th class="sort-column startTime">开始时间</th>
				<th class="sort-column endTime">结束时间</th>
				<th class="sort-column routine">是否为常规赛</th>
				<th class="sort-column statusCode">状态</th>
				<th>简介</th>
				<th>标签</th>
				<th>关键字</th>
				<th>比赛logo</th>
				<th>论坛链接</th>
				<th class="sort-column createTime">创建时间</th>
				<th class="sort-column updateTime">更新时间</th>
				<th>提交列表</th>
				<th>报名列表</th>
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
					${psMatch.reward}
				</td>
				<td>
					${psMatch.processName}
				</td>
				<td>
					${psMatch.signupCount}
				</td>
				<td>
					${psMatch.projectName}
				</td>
				<td>
					<fmt:formatDate value="${psMatch.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${psMatch.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(psMatch.routine, 'ps_match_routine', '')}
				</td>
				<td>
					${fns:getDictLabel(psMatch.statusCode, 'ps_match_status_code', '')}
				</td>
				<td>
					<span class="tooltip-show" title="${psMatch.matchAbs}">${psMatch.matchAbs}</span>
				</td>
				<td>
					${psMatch.tags}
				</td>
				<td>
					${psMatch.matchKey}
				</td>
				<td>
					<a href="${psMatch.logo}" target="_blank" class="tooltip-show" title="${psMatch.logo}">${psMatch.logo}</a>
				</td>
				<td>
					<a href="${psMatch.forumUrl}" target="_blank" class="tooltip-show" title="${psMatch.forumUrl}">${psMatch.forumUrl}</a>
				</td>
				<td>
					<fmt:formatDate value="${psMatch.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${psMatch.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td><a href="${ctx}/psmatchsubmit/psMatchSubmit/list?matchId=${psMatch.id}">提交列表</a></td>
				<td><a href="${ctx}/psmatchuser/psMatchUser/list?matchId=${psMatch.id}">报名列表</a></td>
				<shiro:hasPermission name="psmatch:psMatch:edit"><td>
    				<a href="${ctx}/psmatch/psMatch/form?id=${psMatch.id}">修改</a>
					<a href="${ctx}/psmatch/psMatch/delete?id=${psMatch.id}" onclick="return confirmx('确认要删除该比赛吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>