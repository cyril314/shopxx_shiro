<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.memberRank.add")} - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link rel="stylesheet" href="${base!}/static/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${base!}/static/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base!}/static/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base!}/static/js/common.js"></script>
<script type="text/javascript" src="${base!}/static/js/input.js"></script>
<script type="text/javascript" src="${base!}/static/plugins/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var $inputForm = $("#inputForm");
	
	
	[@flash_message /]
	
	
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base!}/admin/common/index">${message("shop.path.index")}</a> &raquo; 添加试卷
	</div>
	<form id="inputForm" action="update" method="post">
		<input type="hidden" name="id"  value="${exam.id}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>考试名称:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="100" value="${exam.name}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>使用试卷:
				</th>
				<td>
					<select name="paperId">
						<option value="">--------</option>
						[#list papers as paper]
							<option value="${paper.id}" [#if exam.paper == paper]selected=true[/#if]>
								${paper.name}
							</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>开始时间:
				</th>
				<td>
					<input type="text" id="startDate" name="startDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endDate\')}'});" value="${exam.startDate}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>结束时间:
				</th>
				<td>
					<input type="text" id="endDate" name="endDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'startDate\')}'});" value="${exam.endDate}"/>
				</td>
			</tr>
			
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