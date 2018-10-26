<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>用户管理管理</title>
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
		<li class="active"><a href="${ctx}/psuser/psUser/">用户管理列表</a></li>
		<shiro:hasPermission name="psuser:psUser:edit"><li><a href="${ctx}/psuser/psUser/form">用户管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="psUser" action="${ctx}/psuser/psUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>用户名：</label>
				<form:input path="userName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>用户类型：</label>
				<form:select path="userType" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>姓名：</label>
				<form:input path="trueName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>身份证：</label>
				<form:input path="idcard" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>手机号：</label>
				<form:input path="mobile" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>邮箱：</label>
				<form:input path="email" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>公司名称：</label>
				<form:input path="companyName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>地区：</label>
				<form:input path="region" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>身份：</label>
				<form:select path="capacity" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('capacity')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>工作地点：</label>
				<form:input path="workPlace" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>职位：</label>
				<form:input path="position" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>头像：</label>
				<form:input path="portrait" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>介绍：</label>
				<form:input path="userAbs" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>
			<li><label>是否为员工：</label>
				<form:select path="isEmployee" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('is_employee')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>显示名称：</label>
				<form:input path="displayName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>源ID：</label>
				<form:input path="userSourceId" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>可用状态：</label>
				<form:select path="statusCode" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('studio_status_code')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psUser.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新时间：</label>
				<input name="lastLoginTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${psUser.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th class="sort-column userName">用户名</th>
				<th class="sort-column userType">用户类型</th>
				<th class="sort-column trueName">姓名</th>
				<th class="sort-column idcard">身份证</th>
				<th class="sort-column mobile">手机号</th>
				<th class="sort-column email">邮箱</th>
				<th class="sort-column companyName">公司名称</th>
				<th class="sort-column region">地区</th>
				<th class="sort-column capacity">身份</th>
				<th class="sort-column workPlace">工作地点</th>
				<th class="sort-column position">职位</th>
				<th class="sort-column portrait">头像</th>
				<th class="sort-column userAbs">介绍</th>
				<th class="sort-column isEmployee">是否为员工</th>
				<th class="sort-column displayName">显示名称</th>
				<th class="sort-column userSourceId">源ID</th>
				<th class="sort-column statusCode">可用状态</th>
				<th class="sort-column createTime">创建时间</th>
				<th class="sort-column lastLoginTime">更新时间</th>
				<shiro:hasPermission name="psuser:psUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="psUser">
			<tr>
				<td><a href="${ctx}/psuser/psUser/form?id=${psUser.id}">
					${psUser.id}
				</a></td>
				<td>
					${psUser.userName}
				</td>
				<td>
					${fns:getDictLabel(psUser.userType, 'user_type', '')}
				</td>
				<td>
					${psUser.trueName}
				</td>
				<td>
					${psUser.idcard}
				</td>
				<td>
					${psUser.mobile}
				</td>
				<td>
					${psUser.email}
				</td>
				<td>
					${psUser.companyName}
				</td>
				<td>
					${psUser.region}
				</td>
				<td>
					${fns:getDictLabel(psUser.capacity, 'capacity', '')}
				</td>
				<td>
					${psUser.workPlace}
				</td>
				<td>
					${psUser.position}
				</td>
				<td>
					<a href="${psUser.portrait}" target="_blank">${psUser.portrait}</a>
				</td>
				<td>
					${psUser.userAbs}
				</td>
				<td>
					${fns:getDictLabel(psUser.isEmployee, 'is_employee', '')}
				</td>
				<td>
					${psUser.displayName}
				</td>
				<td>
					${psUser.userSourceId}
				</td>
				<td>
					${fns:getDictLabel(psUser.statusCode, 'studio_status_code', '')}
				</td>
				<td>
					<fmt:formatDate value="${psUser.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${psUser.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="psuser:psUser:edit"><td>
    				<a href="${ctx}/psuser/psUser/form?id=${psUser.id}">修改</a>
					<a href="${ctx}/psuser/psUser/delete?id=${psUser.id}" onclick="return confirmx('确认要删除该用户管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>