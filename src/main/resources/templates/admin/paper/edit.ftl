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
<script type="text/javascript">
$(document).ready(function() {
	var $method = $("#method");
	var $distributions = $("tr.distribution");
	var $inputForm = $("#inputForm");

	[@flash_message /]

    $counts.each(function () {
        $(this).change(function () {
            var allCount = 0;
            $counts.each(function () {
                var $this = $(this);
                var count = $this.val();
                var mark = $this.closest("tr").find(".mark").val();
                allCount += count * mark;
            });

            $allCount.val(allCount);
        });
    });
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base!}/admin/common/index">${message("shop.path.index")}</a> &raquo; 添加试卷
	</div>
	<form id="inputForm" action="update" method="post">
		<input type="hidden" name="id" class="text" maxlength="100" value="${paper.id}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>试卷名称:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="100" value="${paper.name}"/>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>及格分数:
				</th>
				<td>
					<input type="text" name="passMark" class="text" maxlength="100" onkeyup="this.value=this.value.replace(/\D/g,'')" value="${paper.passMark}"/>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>时长（分钟）:
				</th>
				<td>
					<input type="text" name="costTime" class="text" maxlength="100" onkeyup="this.value=this.value.replace(/\D/g,'')" value="${paper.costTime}"/>
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