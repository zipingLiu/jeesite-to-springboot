<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>配置项管理</title>
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
		<li class="active"><a href="${ctx}/config/sysConfig/">配置项列表</a></li>
		<shiro:hasPermission name="config:sysConfig:edit"><li><a href="${ctx}/config/sysConfig/form">配置项添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysConfig" action="${ctx}/config/sysConfig/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>环境：</label>
				<form:select path="configEnv" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('sys_config_env_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>配置项名称：</label>
				<form:input path="configKey" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>配置项的值：</label>
				<form:input path="configValue" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>创建者：</label>
				<form:input path="createBy.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${sysConfig.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新者：</label>
				<form:input path="updateBy.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>更新时间：</label>
				<input name="updateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${sysConfig.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>备注信息：</label>
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>删除标记：</label>
				<form:radiobuttons path="delFlag" items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th class="sort-column configEnv">环境</th>
				<th class="sort-column configKey">配置项名称</th>
				<th class="sort-column configValue">配置项的值</th>
				<th class="sort-column createBy.id">创建者</th>
				<th class="sort-column createDate">创建时间</th>
				<th class="sort-column updateBy.id">更新者</th>
				<th class="sort-column updateDate">更新时间</th>
				<th class="sort-column remarks">备注信息</th>
				<th class="sort-column delFlag">删除标记</th>
				<shiro:hasPermission name="config:sysConfig:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysConfig">
			<tr>
				<td><a href="${ctx}/config/sysConfig/form?id=${sysConfig.id}">
					${sysConfig.id}
				</a></td>
				<td>
					${fns:getDictLabel(sysConfig.configEnv, 'sys_config_env_type', '')}
				</td>
				<td>
					${sysConfig.configKey}
				</td>
				<td>
					${sysConfig.configValue}
				</td>
				<td>
					${sysConfig.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${sysConfig.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sysConfig.updateBy.id}
				</td>
				<td>
					<fmt:formatDate value="${sysConfig.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sysConfig.remarks}
				</td>
				<td>
					${fns:getDictLabel(sysConfig.delFlag, 'del_flag', '')}
				</td>
				<shiro:hasPermission name="config:sysConfig:edit"><td>
    				<a href="${ctx}/config/sysConfig/form?id=${sysConfig.id}">修改</a>
					<a href="${ctx}/config/sysConfig/delete?id=${sysConfig.id}" onclick="return confirmx('确认要删除该配置项吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>