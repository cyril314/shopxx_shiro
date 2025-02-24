<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.edit")} - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link rel="stylesheet" href="${base!}/static/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${base!}/static/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base!}/static/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base!}/static/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base!}/static/js/common.js"></script>
<script type="text/javascript" src="${base!}/static/js/input.js"></script>
<script type="text/javascript" src="${base!}/static/plugins/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	var $inputForm = $("#inputForm");
	var $areaId = $("#areaId");
	
	[@flash_message /]
	
	// 地区选择
	$areaId.lSelect({
		url: "${base!}/admin/common/area"
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			password: {
				pattern: /^[^\s&\"<>]+$/,
				minlength: ${setting.passwordMinLength},
				maxlength: ${setting.passwordMaxLength}
			},
			rePassword: {
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
				[#if !setting.isDuplicateEmail]
					,remote: {
						url: "check_email?previousEmail=${member.email?url}",
						cache: false
					}
				[/#if]
			},
			modifyPoint: {
				integer: true,
				min: -${member.point}
			},
			modifyBalance: {
				min: -${member.balance},
				decimal: {
					integer: 12,
					fraction: ${setting.priceScale}
				}
			}
			[#list memberAttributes as memberAttribute]
				[#if memberAttribute.isRequired]
					,memberAttribute_${memberAttribute.id}: {
						required: true
					}
				[/#if]
			[/#list]
		},
		messages: {
			password: {
				pattern: "${message("shop.validate.illegal")}"
			}
			[#if !setting.isDuplicateEmail]
				,email: {
					remote: "${message("shop.validate.exist")}"
				}
			[/#if]
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base!}/admin/common/index">${message("shop.path.index")}</a> &raquo; ${message("shop.member.edit")}
	</div>
	<form id="inputForm" action="update" method="post">
		<input type="hidden" name="id" value="${member.id}" />
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("shop.member.base")}" />
			</li>
			[#if memberAttributes?has_content]
				<li>
					<input type="button" value="${message("shop.member.profile")}" />
				</li>
			[/#if]
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					${message("Member.username")}:
				</th>
				<td>
					${member.username}
				</td>
			</tr>
			<tr>
				<th>
					${message("Member.password")}:
				</th>
				<td>
					<input type="password" id="password" name="password" class="text" maxlength="20" title="${message("shop.member.passwordTitle")}" />
				</td>
			</tr>
			<tr>
				<th>
					${message("shop.member.rePassword")}:
				</th>
				<td>
					<input type="password" name="rePassword" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Member.email")}:
				</th>
				<td>
					<input type="text" name="email" class="text" value="${member.email}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Member.memberRank")}:
				</th>
				<td>
					<select name="memberRankId">
						[#list memberRanks as memberRank]
							<option value="${memberRank.id}"[#if memberRank == member.memberRank] selected="selected"[/#if]>${memberRank.name}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					${message("shop.common.setting")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true"[#if member.isEnabled] checked="checked"[/#if] />${message("Member.isEnabled")}
						<input type="hidden" name="_isEnabled" value="false" />
					</label>
					[#if member.isLocked]
						<label>
							<input type="checkbox" name="isLocked" value="true" checked="checked" />${message("Member.isLocked")}
							<input type="hidden" name="_isLocked" value="false" />
						</label>
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Member.amount")}:
				</th>
				<td>
					${currency(member.amount, true)}
				</td>
			</tr>
			<tr>
				<th>
					${message("shop.common.createDate")}:
				</th>
				<td>
					${member.createDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr>
			<tr>
				<th>
					${message("Member.registerIp")}:
				</th>
				<td>
					${member.registerIp}
				</td>
			</tr>
		</table>
		[#if memberAttributes?has_content]
			<table class="input tabContent">
				[#list memberAttributes as memberAttribute]
					<tr>
						<th>
							[#if memberAttribute.isRequired]<span class="requiredField">*</span>[/#if]${memberAttribute.name}:
						</th>
						<td>
							[#if memberAttribute.type == "name"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.name}" maxlength="200" />
							[#elseif memberAttribute.type == "gender"]
								<span class="fieldSet">
									[#list genders as gender]
										<label>
											<input type="radio" name="memberAttribute_${memberAttribute.id}" value="${gender}"[#if gender == member.gender] checked="checked"[/#if] />${message("Member.Gender." + gender)}
										</label>
									[/#list]
								</span>
							[#elseif memberAttribute.type == "birth"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text Wdate" value="${member.birth}" onfocus="WdatePicker();" />
							[#elseif memberAttribute.type == "area"]
								<span class="fieldSet">
									<input type="hidden" id="areaId" name="memberAttribute_${memberAttribute.id}" value="${(member.area.id)!}" treePath="${(member.area.treePath)!}" />
								</span>
							[#elseif memberAttribute.type == "address"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.address}" maxlength="200" />
							[#elseif memberAttribute.type == "zipCode"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.zipCode}" maxlength="200" />
							[#elseif memberAttribute.type == "phone"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.phone}" maxlength="200" />
							[#elseif memberAttribute.type == "mobile"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.mobile}" maxlength="200" />
							[#elseif memberAttribute.type == "text"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.getAttributeValue(memberAttribute)}" maxlength="200" />
							[#elseif memberAttribute.type == "select"]
								<select name="memberAttribute_${memberAttribute.id}">
									<option value="">${message("shop.common.choose")}</option>
									[#list memberAttribute.options as option]
										<option value="${option}"[#if option == member.getAttributeValue(memberAttribute)] selected="selected"[/#if]>
											${option}
										</option>
									[/#list]
								</select>
							[#elseif memberAttribute.type == "checkbox"]
								<span class="fieldSet">
									[#list memberAttribute.options as option]
										<label>
											<input type="checkbox" name="memberAttribute_${memberAttribute.id}" value="${option}"[#if (member.getAttributeValue(memberAttribute)?seq_contains(option))!] checked="checked"[/#if] />${option}
										</label>
									[/#list]
								</span>
							[/#if]
						</td>
					</tr>
				[/#list]
			</table>
		[/#if]
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("shop.common.submit")}" />
					<input type="button" class="button" value="${message("shop.common.back")}" onclick="location.href='list'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>