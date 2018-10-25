<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>视图展示列管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			// 设置隐藏列
            hideShowTableTd('contentTable', '${columnHideArr}', 0);
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
		<li class="active"><a href="${ctx}/syspagecol/sysPageCol/">视图展示列列表</a></li>
		<shiro:hasPermission name="syspagecol:sysPageCol:edit"><li><a href="${ctx}/syspagecol/sysPageCol/form">视图展示列添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysPageCol" action="${ctx}/syspagecol/sysPageCol/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>id：</label>
				<form:input path="id" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>模块名称：</label>
				<form:input path="moduleName" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>实体类名称：</label>
				<form:input path="entityName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>视图路径：</label>
				<form:input path="viewPath" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>视图文件名称：</label>
				<form:input path="viewName" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>所有列：</label>
				<form:input path="colAll" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>隐藏的列：</label>
				<form:checkboxes path="colHide" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-nowrap">
		<thead>
			<tr>
				<th class="sort-column id">id</th>
				<th class="sort-column moduleName">模块名称</th>
				<th class="sort-column entityName">实体类名称</th>
				<th class="sort-column viewPath">视图路径</th>
				<th class="sort-column viewName">视图文件名称</th>
				<th class="sort-column colAll">所有列</th>
				<th class="sort-column colHide">隐藏的列</th>
				<shiro:hasPermission name="syspagecol:sysPageCol:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysPageCol">
			<tr>
				<td><a href="${ctx}/syspagecol/sysPageCol/form?id=${sysPageCol.id}">
					${sysPageCol.id}
				</a></td>
				<td>
					${sysPageCol.moduleName}
				</td>
				<td>
					${sysPageCol.entityName}
				</td>
				<td>
					${sysPageCol.viewPath}
				</td>
				<td>
					${sysPageCol.viewName}
				</td>
				<td>
					${sysPageCol.colAll}
				</td>
				<td>
					${sysPageCol.colHide}
				</td>
				<shiro:hasPermission name="syspagecol:sysPageCol:edit"><td>
    				<a href="${ctx}/syspagecol/sysPageCol/form?id=${sysPageCol.id}">修改</a>
					<a href="${ctx}/syspagecol/sysPageCol/delete?id=${sysPageCol.id}" onclick="return confirmx('确认要删除该视图展示列吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>