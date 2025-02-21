<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.unauthorized.title")} - Powered By JIUJIANG</title>
<meta name="author" content="JIUJIANG Team" />
<meta name="copyright" content="JIUJIANG" />
<link rel="stylesheet" href="${base!}/static/css/common.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${base!}/static/css/error.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="wrap">
		<div class="error">
			<dl>
				<dt>${message("shop.unauthorized.message")}</dt>
				<dd>
					<a href="javascript:;" onclick="window.history.back(); return false;">${message("shop.unauthorized.back")}</a>
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>