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
		<li><a href="${ctx}/syspagecol/sysPageCol/">视图展示列列表</a></li>
		<li class="active"><a href="${ctx}/syspagecol/sysPageCol/form?id=${sysPageCol.id}">视图展示列<shiro:hasPermission name="syspagecol:sysPageCol:edit">${not empty sysPageCol.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="syspagecol:sysPageCol:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
    <c:choose>
        <c:when test="${empty sysPageCol.viewName}">
            <form:form id="inputForm" modelAttribute="sysPageCol" action="${ctx}/syspagecol/sysPageCol/form" method="post" class="form-horizontal">
                <form:hidden path="id"/>

                <sys:message content="${message}"/>
                <div class="control-group">
                    <label class="control-label">选择视图文件:</label>
                    <div class="controls">
                        <form:select path="viewName" class="input-xxlarge">
                            <form:options items="${colList}" itemLabel="viewName" itemValue="viewName" htmlEscape="false"/>
                        </form:select>
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="form-actions">
                    <shiro:hasPermission name="syspagecol:sysPageCol:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="下一步"/>&nbsp;</shiro:hasPermission>
                    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
                </div>
            </form:form>
        </c:when>
        <c:otherwise>
            <form:form id="inputForm" modelAttribute="sysPageCol" action="${ctx}/syspagecol/sysPageCol/save" method="post" class="form-horizontal">
                <form:hidden path="id"/>
                <sys:message content="${message}"/>
                <div class="control-group">
                    <label class="control-label">模块名称：</label>
                    <div class="controls">
                        <form:textarea path="moduleName" htmlEscape="false" rows="4" maxlength="50" class="input-xxlarge required"/>
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">实体类名称：</label>
                    <div class="controls">
                        <form:textarea path="entityName" htmlEscape="false" rows="4" maxlength="100" class="input-xxlarge required"/>
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">视图路径：</label>
                    <div class="controls">
                        <form:textarea path="viewPath" htmlEscape="false" rows="4" maxlength="100" class="input-xxlarge required"/>
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">视图文件名称：</label>
                    <div class="controls">
                        <form:textarea path="viewName" htmlEscape="false" rows="4" maxlength="50" class="input-xxlarge required"/>
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">所有列：</label>
                    <div class="controls">
                        <form:textarea path="colAll" htmlEscape="false" rows="4" maxlength="1000" class="input-xxlarge required"/>
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">要隐藏的列：</label>
                    <div class="controls">
                        <form:checkboxes path="colHideList" items="${allList}" itemLabel="colLab" itemValue="colVal" htmlEscape="false" class=""/>
                    </div>
                </div>
                <div class="form-actions">
                    <shiro:hasPermission name="syspagecol:sysPageCol:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
                    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
                </div>
            </form:form>
        </c:otherwise>
    </c:choose>
</body>
</html>