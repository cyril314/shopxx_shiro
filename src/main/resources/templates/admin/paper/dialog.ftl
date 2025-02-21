<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>试题管理</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="${base!}/favicon.ico" />
		<link rel="stylesheet" href="${base!}/static/plugins/bootstrap/css/bootstrap-huan.css">
		<link rel="stylesheet" href="${base!}/static/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${base!}/static/css/style.css">
		<link rel="stylesheet" href="${base!}/static/css/exam.css">
		<link rel="stylesheet" href="${base!}/static/plugins/chart/morris.css">
		<style>
			.examing-point{
				display:block;
				font-size:10px;
				margin-top:5px;
			}
			.question-name-td{
				width:300px;
			}
/* 			input[disabled]{
			  outline:1px solid red; 
			}
*/		
 		</style>
	</head>
	<body>
		<!-- Slider starts -->
		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;width:800px;">

				<div class="row">
					
					<div class="col-xs-12">
						
						<div class="page-content">

							<div id="question-filter">

								<dl id="question-filter-field">
									<dt>
										章节：
									</dt>
									<dd>
										<span data-id="" [#if rootCategory??][#else]class="label label-info"[/#if]>全部</span>
										
										[#list rootCategorys as category]
										<span data-id="${category.id}" [#if category == rootCategory]class="label label-info"[/#if]>${category.name}</span>
										[/#list]
									</dd>
								</dl>
								<dl id="question-filter-knowledge">
									<dt>
										子章节：
									</dt>
									<dd>
										<span data-id="" [#if category??][#else]class="label label-info"[/#if]>全部</span>
										[#list categorys as cate]
										<span data-id="${cate.id}" [#if cate == category]class="label label-info"[/#if]>${cate.name}</span>
										[/#list]
									</dd>
								</dl>

								<dl id="question-filter-qt">
									<dt>
										试题类型：
									</dt>
									<dd>
										<span data-id="" [#if type??][#else]class="label label-info"[/#if]>全部</span>
										[#list questionTypes as questionType]
										<span data-id="${questionType}" [#if questionType == type]class="label label-info"[/#if]>${message("shop.question.type." + questionType)}</span>
										[/#list]
									</dd>
								</dl>
								<div class="page-link-content">
									<ul class="pagination pagination-sm">
									[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
									[#if totalPages > 1]
										<li [#if hasPrevious] [#else]class="disabled"[/#if]>
											<a [#if hasPrevious]data-id="${previousPageNumber}" [/#if]>上一页</a>
										</li>
										[#list segment as segmentPageNumber]
											<li [#if segmentPageNumber == pageNumber] class="active" [/#if]><a data-id="${segmentPageNumber}">${segmentPageNumber}</a></li>
										[/#list]
										<li [#if hasNext] [#else]class="disabled"[/#if]>
											<a [#if hasNext]data-id="${nextPageNumber}"[/#if]>下一页</a>
										</li>
									[/#if]
									[/@pagination]
									</ul>
								</div>
							</div>
							<div id="question-list">
								<input id="field-id-hidden" value="" type="hidden">
								<input id="knowledge-hidden" value="" type="hidden">
								<input id="question-type-hidden" value="" type="hidden">
								<input id="search-param-hidden" value="" type="hidden">
								<table class="table-striped table">
									<thead>
										<tr>
											<td></td><td>ID</td><td class="question-name-td">试题名称</td><td>试题类型</td><td>所属章节</td>
										</tr>
									</thead>
									<tbody>
										[#list page.content as question]
										<tr>
											<td>
												<input type="checkbox" class="checkbox" value="${question.id}">
											</td>
											<td class="question-id">
												${question.id}
											</td>
											<td>
												<a href="#" target="_blank" title="预览">${question.stem}</a>
											</td>
											<td>
												${message("shop.question.type." + question.type)}
											</td>
											<td>
												${question.productCategory.name}
											</td>
										</tr>
										[/#list]
									</tbody>
									<tfoot>
									</tfoot>
								</table>
							</div>
							<div class="page-link-content">
								<ul class="pagination pagination-sm">
									[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
									[#if totalPages > 1]
										<li [#if hasPrevious] [#else]class="disabled"[/#if]>
											<a [#if hasPrevious]data-id="${previousPageNumber}" [/#if]>上一页</a>
										</li>
										[#list segment as segmentPageNumber]
											<li [#if segmentPageNumber == pageNumber] class="active" [/#if]><a data-id="${segmentPageNumber}">${segmentPageNumber}</a></li>
										[/#list]
										<li [#if hasNext] [#else]class="disabled"[/#if]>
											<a [#if hasNext]data-id="${nextPageNumber}"[/#if]>下一页</a>
										</li>
									[/#if]
									[/@pagination]
								</ul>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		

		<!-- Slider Ends -->
		<script>
        function getUrlParam(name) 
        {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
            var r = window.location.search.substr(1).match(reg); 
            if (r != null) return unescape(r[2]); return null; 
        }
		</script>
		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="${base!}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${base!}/static../../js/all.js"></script>
		<script type="text/javascript" src="${base!}/static../../js/question-list4dialog.js?v=1"></script>
		
		
	</body>
</html>
