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
		<li class="active"><a href="${ctx}/psmatchuser/psMatchUser/">报名用户列表</a></li>
		<shiro:hasPermission name="psmatchuser:psMatchUser:edit"><li><a href="${ctx}/psmatchuser/psMatchUser/form">报名用户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psMatchUser" action="${ctx}/psmatchuser/psMatchUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>比赛名称：</label>
				<form:select path="matchId" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${matchList}" itemLabel="matchName" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>常规赛是否通过：</label>
				<form:select path="routinePass" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('routine_pass')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<%--<li><label>用户名称：</label>
				<form:select path="userId" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>--%>
			<%--<li><label>阶段名称：</label>
				<form:select path="processId" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${processList}" itemLabel="processName" itemValue="id" htmlEscape="false"/>
				</form:select>
			</li>--%>
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
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-nowrap">
		<thead>
			<tr>
				<th class="sort-column id">ID</th>
				<th class="sort-column matchId">比赛名称</th>
				<th class="sort-column userId">用户名称</th>
				<th class="sort-column processId">阶段名称</th>
				<th class="sort-column createTime">创建时间</th>
				<th class="sort-column updateTime">更新时间</th>
				<th class="sort-column routinePass">常规赛是否通过</th>
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
					${psMatchUser.matchName}
				</td>
				<td>
					${psMatchUser.userName}
				</td>
				<td>
					${psMatchUser.processName}
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
				<td>
					${fns:getDictLabel(psMatchUser.userType, 'user_type', '')}
				</td>
				<td>
					${psMatchUser.trueName}
				</td>
				<td>
					${psMatchUser.idcard}
				</td>
				<td>
					${psMatchUser.mobile}
				</td>
				<td>
					${psMatchUser.email}
				</td>
				<td>
					${psMatchUser.companyName}
				</td>
				<td>
					${psMatchUser.region}
				</td>
				<td>
					${fns:getDictLabel(psMatchUser.capacity, 'capacity', '')}
				</td>
				<td>
					${psMatchUser.workPlace}
				</td>
				<td>
					${psMatchUser.position}
				</td>
				<td>
					<a href="${psMatchUser.portrait}" target="_blank">${psMatchUser.portrait}</a>
				</td>
				<td>
					<span class="tooltip-show" title="${psMatchUser.userAbs}">${psMatchUser.userAbs}</span>
				</td>
				<td>
					${fns:getDictLabel(psMatchUser.isEmployee, 'is_employee', '')}
				</td>
				<td>
					${psMatchUser.displayName}
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