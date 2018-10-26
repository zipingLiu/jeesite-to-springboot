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
		<li class="active"><a href="${ctx}/psmatchsubmit/psMatchSubmit/">提交列表</a></li>
		<shiro:hasPermission name="psmatchsubmit:psMatchSubmit:edit"><li><a href="${ctx}/psmatchsubmit/psMatchSubmit/form">提交添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psMatchSubmit" action="${ctx}/psmatchsubmit/psMatchSubmit/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<%--<li><label>提交名称：</label>
				<form:input path="submitName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>版本：</label>
				<form:input path="version" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>--%>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatchSubmit.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>提交状态：</label>
				<form:select path="statusCode" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('ps_match_submit_status_code')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>最后更新时间：</label>
				<input name="lastUpdateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psMatchSubmit.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>提交人ID：</label>
				<form:input path="userId" htmlEscape="false" maxlength="10" class="input-medium digits"/>
			</li>
			<li><label>分数：</label>
				<form:input path="score" htmlEscape="false" class="input-medium number"/>
			</li>
			<%--<li><label>结果json：</label>
				<form:input path="resultContent" htmlEscape="false" maxlength="2000" class="input-medium"/>
			</li>
			<li><label>bos的key值：</label>
				<form:input path="bosKey" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>--%>
			<li><label>bos的url：</label>
				<form:input path="bosFileUrl" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<%--<li><label>任务开始时间：</label>
				<form:input path="startTime" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>任务结束时间：</label>
				<form:input path="endTime" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>--%>
			<%--<li><label>阶段名称：</label>
				<form:select path="processId" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${processList}" itemLabel="processName" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>--%>
			<%--<li><label>是否匿名：</label>
				<form:select path="anonymous" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('anonymous')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>参考文献：</label>
				<form:input path="reference" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>--%>
			<li><label>简介：</label>
				<form:input path="introduction" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>
			<%--<li><label>关联项目：</label>
				<form:select path="projectId" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${projectList}" itemLabel="projectName" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>--%>
			<li><label>比赛：</label>
				<form:select path="matchId" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${matchList}" itemLabel="matchName" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>
			<%--<li><label>对比结果：</label>
				<form:input path="errorMsg" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>--%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-nowrap">
		<thead>
			<tr>
				<th class="sort-column id">ID</th>
				<th class="sort-column submitName">提交名称</th>
				<th class="sort-column version">版本</th>
				<th class="sort-column createTime">创建时间</th>
				<th class="sort-column statusCode">提交状态</th>
				<th class="sort-column lastUpdateTime">最后更新时间</th>
				<th class="sort-column userId">提交人</th>
				<th>用户类型</th>
				<th>姓名</th>
				<th>身份证</th>
				<th>手机号</th>
				<th>邮箱</th>
				<th>公司名称</th>
				<th>地区</th>
				<th>身份</th>
				<th>工作地点</th>
				<th>职位</th>
				<th>头像</th>
				<th>介绍</th>
				<th>是否为员工</th>
				<th>显示名称</th>
				<th class="sort-column score">分数</th>
				<th class="sort-column resultContent">结果json</th>
				<th class="sort-column bosKey">bos的key值</th>
				<th class="sort-column bosFileUrl">bos的url</th>
				<th class="sort-column startTime">任务开始时间</th>
				<th class="sort-column endTime">任务结束时间</th>
				<th class="sort-column processId">阶段名称</th>
				<th class="sort-column anonymous">是否匿名</th>
				<th class="sort-column reference">参考文献</th>
				<th class="sort-column introduction">简介</th>
				<th class="sort-column projectId">关联项目</th>
				<th class="sort-column matchId">比赛名称</th>
				<th class="sort-column errorMsg">对比结果</th>
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
					${psMatchSubmit.submitName}
				</td>
				<td>
					${psMatchSubmit.version}
				</td>
				<td>
					<fmt:formatDate value="${psMatchSubmit.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(psMatchSubmit.statusCode, 'ps_match_submit_status_code', '')}
				</td>
				<td>
					<fmt:formatDate value="${psMatchSubmit.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${psMatchSubmit.userName}
				</td>
				<td>
					${fns:getDictLabel(psMatchSubmit.userType, 'user_type', '')}
				</td>
				<td>
					${psMatchSubmit.trueName}
				</td>
				<td>
					${psMatchSubmit.idcard}
				</td>
				<td>
					${psMatchSubmit.mobile}
				</td>
				<td>
					${psMatchSubmit.email}
				</td>
				<td>
					${psMatchSubmit.companyName}
				</td>
				<td>
					${psMatchSubmit.region}
				</td>
				<td>
					${fns:getDictLabel(psMatchSubmit.capacity, 'capacity', '')}
				</td>
				<td>
					${psMatchSubmit.workPlace}
				</td>
				<td>
					${psMatchSubmit.position}
				</td>
				<td>
					<a href="${psMatchSubmit.portrait}" target="_blank">${psMatchSubmit.portrait}</a>
				</td>
				<td>
					<span class="tooltip-show" title="${psMatchSubmit.userAbs}">${psMatchSubmit.userAbs}</span>
				</td>
				<td>
					${fns:getDictLabel(psMatchSubmit.isEmployee, 'is_employee', '')}
				</td>
				<td>
					${psMatchSubmit.displayName}
				</td>
				<td>
					${psMatchSubmit.score}
				</td>
				<td>
					${psMatchSubmit.resultContent}
				</td>
				<td>
					<span class="tooltip-show" title="${psMatchSubmit.bosKey}">${psMatchSubmit.bosKey}</span>
				</td>
				<td>
					<a href="${psMatchSubmit.bosFileUrl}" target="_blank">${psMatchSubmit.bosFileUrl}</a>
				</td>
				<td>
					${psMatchSubmit.startTime}
				</td>
				<td>
					${psMatchSubmit.endTime}
				</td>
				<td>
					${psMatchSubmit.processName}
				</td>
				<td>
					${fns:getDictLabel(psMatchSubmit.anonymous, 'anonymous', '')}
				</td>
				<td>
					${psMatchSubmit.reference}
				</td>
				<td>
					${psMatchSubmit.introduction}
				</td>
				<td>
					${psMatchSubmit.projectName}
				</td>
				<td>
					${psMatchSubmit.matchName}
				</td>
				<td>
					${psMatchSubmit.errorMsg}
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