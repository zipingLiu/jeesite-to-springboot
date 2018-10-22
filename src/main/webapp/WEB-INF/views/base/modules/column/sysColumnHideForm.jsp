<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>列隐藏配置管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
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
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/column/sysColumnHide/">列隐藏配置列表</a></li>
		<li class="active"><a href="${ctx}/column/sysColumnHide/form?id=${sysColumnHide.id}">列隐藏配置<shiro:hasPermission name="column:sysColumnHide:edit">${not empty sysColumnHide.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="column:sysColumnHide:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="sysColumnHide" action="${ctx}/column/sysColumnHide/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">页面名称：</label>
			<div class="controls">
				<form:input path="pageName" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<span class="help-inline">页面描述信息,例如:用户列表页</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属类名：</label>
			<div class="controls">
				<form:input path="className" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<span class="help-inline">使用所对应的实体类名称作为唯一标识,例如:SysUser</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">隐藏列索引：</label>
			<div class="controls">
				<form:textarea path="columnHideArr" htmlEscape="false" rows="4" maxlength="100" class="input-xxlarge "/>
				<span class="help-inline">要隐藏的列在页面上的索引编号,例如要隐藏前3列就填写:0,1,2(多个索引之间只用逗号分隔),为空则表示没有要隐藏的列.</span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="column:sysColumnHide:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>