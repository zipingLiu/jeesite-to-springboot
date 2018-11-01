<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>缓存管理</title>
	<meta name="decorator" content="default"/>
	<style>
		.table-nowrap td {
			width: 200px;
			max-width: 175px;
			/*超出的文本加上遮罩*/
			overflow: overlay;
			white-space: nowrap;
			text-overflow: clip;
		}
	</style>
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
	<sys:message content="${message}"/>
	<c:choose>
		<%--如果没有数据类型--%>
		<c:when test="${empty sysRedis.dataType}">
			<form:form id="inputForm" modelAttribute="sysRedis" action="${ctx}/redis/sysRedis/form" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<div class="control-group">
					<label class="control-label">数据类型:</label>
					<div class="controls">
						<form:select path="dataType" class="input-xlarge required">
							<form:option value="" label="请选择"/>
							<form:options items="${fns:getDictList('redis_data_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="form-actions">
					<shiro:hasPermission name="redis:sysRedis:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="下一步"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
		</c:when>
		<%--如果有数据类型--%>
		<c:otherwise>
			<form:form id="inputForm" modelAttribute="sysRedis" action="${ctx}/redis/sysRedis/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="control-group">
					<label class="control-label">数据类型：</label>
					<div class="controls">
						<form:input path="dataType" readonly="true" htmlEscape="false" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Key：</label>
					<div class="controls">
						<input id="oldRedisKey" name="oldRedisKey" type="hidden" value="${sysRedis.redisKey}"/>
						<form:input path="redisKey" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<%--如果数据类型是string--%>
				<c:if test="${sysRedis.dataType == 'string'}">
					<div class="control-group">
						<label class="control-label">Value：</label>
						<div class="controls">
							<form:textarea path="redisValue" readonly="${((not empty sysRedis.redisKey) && (sysRedis.dataType != 'string'))?'true':'false'}" htmlEscape="false" rows="8" class="input-xxlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</c:if>
				<%--如果数据类型是list--%>
				<c:if test="${sysRedis.dataType == 'list'}">
					<c:choose>
						<c:when test="${empty sysRedis.redisKey}">
							<div class="control-group">
								<label class="control-label">Value：</label>
								<div class="controls">
									<form:textarea path="redisValue" readonly="${((not empty sysRedis.redisKey) && (sysRedis.dataType != 'string'))?'true':'false'}" htmlEscape="false" rows="8" class="input-xxlarge required"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">左侧/右侧添加:</label>
								<div class="controls">
									<form:select path="fromLeft" class="input-xlarge required">
										<form:option value="" label="请选择"/>
										<form:options items="${fns:getDictList('redis_list_from_left')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
									<span class="help-inline"><font color="red">*</font> </span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="control-group">
								<label class="control-label">值列表：</label>
								<div class="controls">
									<table class="table table-striped table-bordered table-condensed table-nowrap" style="width: 460px">
										<thead>
											<th>编号</th>
											<th>值</th>
										</thead>
										<tbody>
											<c:forEach items="${sysRedis.valList}" var="val" varStatus="status">
												<tr>
													<td style="width: 10px">${status.index + 1}</td>
													<td>${val}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:if>
				<%--如果数据类型是set--%>
				<c:if test="${sysRedis.dataType == 'set'}">
					<c:choose>
						<c:when test="${empty sysRedis.redisKey}">
							<div class="control-group">
								<label class="control-label">Value：</label>
								<div class="controls">
									<form:textarea path="redisValue" readonly="${((not empty sysRedis.redisKey) && (sysRedis.dataType != 'string'))?'true':'false'}" htmlEscape="false" rows="8" class="input-xxlarge required"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="control-group">
								<label class="control-label">值列表：</label>
								<div class="controls">
									<table class="table table-striped table-bordered table-condensed table-nowrap" style="width: 460px">
										<thead>
											<th>编号</th>
											<th>值</th>
										</thead>
										<tbody>
											<c:forEach items="${sysRedis.valSet}" var="val" varStatus="status">
												<tr>
													<td style="width: 10px">${status.index + 1}</td>
													<td>${val}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:if>
				<%--如果数据类型是zset--%>
				<c:if test="${sysRedis.dataType == 'zset'}">
					<c:choose>
						<c:when test="${empty sysRedis.redisKey}">
							<div class="control-group">
								<label class="control-label">Value：</label>
								<div class="controls">
									<form:textarea path="redisValue" readonly="${((not empty sysRedis.redisKey) && (sysRedis.dataType != 'string'))?'true':'false'}" htmlEscape="false" rows="8" class="input-xxlarge required"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">分值：</label>
								<div class="controls">
									<form:textarea path="score" readonly="${((not empty sysRedis.redisKey) && (sysRedis.dataType != 'string'))?'true':'false'}" htmlEscape="false" class="input-xxlarge required"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="control-group">
								<label class="control-label">值列表：</label>
								<div class="controls">
									<table class="table table-striped table-bordered table-condensed table-nowrap" style="width: 460px">
										<thead>
											<th>编号</th>
											<th>值</th>
											<th>分数</th>
										</thead>
										<tbody>
											<c:forEach items="${sysRedis.zsetList}" var="val" varStatus="status">
												<tr>
													<td style="width: 10px">${status.index + 1}</td>
													<td>${val.value}</td>
													<td>${val.score}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:if>
				<%--如果数据类型是hash--%>
				<c:if test="${sysRedis.dataType == 'hash'}">
					<c:choose>
						<c:when test="${empty sysRedis.redisKey}">
							<div class="control-group">
								<label class="control-label">HashKey：</label>
								<div class="controls">
									<form:input path="hashKey" readonly="${(not empty sysRedis.redisKey)?'true':'false'}" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">HashValue：</label>
								<div class="controls">
									<form:textarea path="redisValue" readonly="${((not empty sysRedis.redisKey) && (sysRedis.dataType != 'string'))?'true':'false'}" htmlEscape="false" rows="8" class="input-xxlarge required"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="control-group">
								<label class="control-label">值列表：</label>
								<div class="controls">
									<table class="table table-striped table-bordered table-condensed table-nowrap" style="width: 460px">
										<thead>
										<tr>
											<th>编号</th>
											<th>HashKey</th>
											<th>HashValue</th>
										</tr>
										</thead>
										<tbody>
											<c:forEach items="${sysRedis.valMap}" var="val" varStatus="status">
												<tr>
													<td>${status.index + 1}</td>
													<td>${val.key}</td>
													<td>${val.value}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:if>
				<div class="control-group">
					<label class="control-label">过期时间(秒)：</label>
					<div class="controls">
						<input id="oldExpire" name="oldExpire" type="hidden" value="${sysRedis.expire}"/>
						<form:input path="expire" htmlEscape="false" maxlength="200" class="input-xlarge redisExpire"/>
						<span class="help-inline">只能输入正整数/负整数,任意负数代表永不过期,输入0则无效</span>
					</div>
				</div>
				<div class="form-actions">
					<shiro:hasPermission name="redis:sysRedis:edit">
						<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
					</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
		</c:otherwise>
	</c:choose>
</body>
</html>