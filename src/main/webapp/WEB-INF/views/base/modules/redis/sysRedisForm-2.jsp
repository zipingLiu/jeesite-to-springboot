<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>缓存管理管理</title>
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
		<li><a href="${ctx}/redis/sysRedis/">查询缓存</a></li>
		<li class="active"><a href="${ctx}/redis/sysRedis/form?redisKey=${sysRedis.redisKey}"><shiro:hasPermission name="redis:sysRedis:edit">${not empty sysRedis.redisKey?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="redis:sysRedis:edit">查看</shiro:lacksPermission>缓存</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="sysRedis" action="${ctx}/redis/sysRedis/save" method="post" class="form-horizontal">
		<sys:message content="${message}"/>
		<c:choose>
			<c:when test="${empty sysRedis.redisKey}">
				<div class="control-group">
					<label class="control-label">数据类型：</label>
					<div class="controls">
						<form:select path="dataType" class="input-xlarge required">
							<form:option value="" label="请选择"/>
							<form:options items="${fns:getDictList('redis_data_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="control-group">
					<label class="control-label">数据类型：</label>
					<div class="controls">
						<form:input path="dataType" readonly="true" htmlEscape="false" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
        <div class="control-group">
            <label class="control-label">缓存键：</label>
            <div class="controls">
                <form:input path="redisKey" readonly="${(not empty sysRedis.redisKey)?'true':'false'}" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
                <span class="help-inline"><font color="red">*</font> </span>
            </div>
        </div>
		<div class="control-group">
			<label class="control-label">缓存值：</label>
			<div class="controls">
                <form:textarea path="redisValue" readonly="${((not empty sysRedis.redisKey) && (sysRedis.dataType != 'string'))?'true':'false'}" htmlEscape="false" rows="8" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="redis:sysRedis:edit">
				<%--仅string类型可以修改--%>
				<c:if test="${(empty sysRedis.redisKey) || ((not empty sysRedis.redisKey) && (sysRedis.dataType == 'string'))}">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
				</c:if>
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>