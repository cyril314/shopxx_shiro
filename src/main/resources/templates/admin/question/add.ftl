<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.ad.add")} - Powered By JIUJIANG</title>
<meta name="author" content="JIUJIANG Team" />
<meta name="copyright" content="JIUJIANG" />
<link rel="stylesheet" href="${base!}/static/plugins/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${base!}/static/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base!}/static/plugins/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base!}/static/js/common.js"></script>
<script type="text/javascript" src="${base!}/static/js/input.js"></script>
<script type="text/javascript" src="${base!}/static/plugins/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	var $inputForm = $("#inputForm");
	var $options = $("#options");
	var $addOption = $("#addOption");
	var $deleteOption = $("a.deleteOption");
	var optionsIndex = 0;
	var $questionType = $("#questionType");
	
	[@flash_message /]
	
	$questionType.change(function()
	{
		var $options = $("tr.option");
		$options.remove("tr.option");
		optionsIndex = 0;
		
		if ($(this).val() == 'judge')
		{
			for (var i=0; i < 2; i ++)
			{
				$addOption.click();
			}
		}
		else
		{
			for (var i=0; i < 4; i ++)
			{
				$addOption.click();
			}
		}
	});
	
	$addOption.click(function()
	{
		[@compress single_line = true]
		var trHtml = 
			'<tr class="option">
				<td>
					<input type="checkbox" name="options[' + optionsIndex + '].isCorrect"\/>
				<\/td>
				<td>
					<input type="text" name="options[' + optionsIndex + '].content" style="width: 600px;"\/>
				<\/td>
				<td>
					<a href="javascript:;" class="deleteOption">[${message("shop.common.delete")}]<\/a>
				<\/td>
			<\/tr>';
		[/@compress]
		
		$options.append(trHtml);
		optionsIndex++;
	});
	
	$deleteOption.live("click", function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("shop.dialog.deleteConfirm")}",
			onOk: function() {
				$this.closest("tr").remove();
			}
		});
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			stem: "required"
		}
	});
	
	for (var i=0; i < 4; i ++)
	{
		$addOption.click();
	}
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base!}/admin/common/index">${message("shop.path.index")}</a> &raquo; 添加题目
	</div>
	<form id="inputForm" action="save" method="post">
		<table class="input" id="options">
			<tr>
				<th>
					<span class="requiredField">*</span>章节:
				</th>
				<td>
					<select id="productCategoryId" name="productCategoryId">
						[#list productCategoryTree as productCategory]
							<option value="${productCategory.id}">
								[#if productCategory.grade != 0]
									[#list 1..productCategory.grade as i]
										&nbsp;&nbsp;
									[/#list]
								[/#if]
								${productCategory.name}
							</option>
						[/#list]
					</select>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>类型:
				</th>
				<td>
					<select id="questionType" name="type">
						[#list questionTypes as questionType]
							<option value="${questionType}">
								${message("shop.question.type." + questionType)}
							</option>
						[/#list]
					</select>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				
				<td colspan="3">
					<textarea id="editor" name="stem"  class="editor" clos="20" rows="20"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="javascript:;" id="addOption" class="button">增加选项</a>
				</td>
			</tr>
			<tr class="title">
				<td>
					是否答案
				</td>
				<td>
					选项内容
				</td>
				<td>
					${message("shop.common.delete")}
				</td>
			</tr>
		</table>
		<table class="input">
			<tr>
				<th>
					分析:
				</th>
				<td>
					<input type="text" name="anisys" id="anisys" class="text" maxlength="500" style="width: 600px;"/>
				</td>
				<td>
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
				<td>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>