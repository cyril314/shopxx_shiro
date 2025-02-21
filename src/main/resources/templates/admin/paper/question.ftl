<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>ExamStack</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link rel="stylesheet" href="${base!}/static/plugins/bootstrap/css/bootstrap-huan.css">
		<link rel="stylesheet" href="${base!}/static/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${base!}/static/css/style.css">
		
		<link rel="stylesheet" href="${base!}/static/css/exam.css">
		<link rel="stylesheet" href="${base!}/static/plugins/chart/morris.css">
		<style>
			#add-more-qt-to-paper{
				cursor: pointer;
				color: #1ba1e2;
			}
			#add-more-qt-to-paper:hover{
				color:#ff7f74;
			}
			#add-more-qt-to-paper i{
				color: #47a447;
				cursor: pointer;
				margin-right:5px;	
			}
			
			#qt-selector-iframe{
				border:none;
				height:600px;
			}
			.tmp-ques-remove{
				margin-left:10px;
			}
			
			.question-point{
				padding:0 8px;
				margin:0 2px;
				border-bottom: 1px solid;
				cursor:pointer;
			}
			.question-point:hover{
				color:#ff7f74;
			}
		
		</style>
	</head>
	<body>
		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
					<div class="col-xs-2" id="left-menu">
					</div>
					<div class="col-xs-10" id="right-content">
						<div class="page-header">
							<h1><i class="fa fa-file-text"></i> 试题维护 </h1>
						</div>
						<div class="page-content">
							<div class="def-bk" id="bk-exampaper">

								<div class="expand-bk-content" id="bk-conent-exampaper">
									<div id="exampaper-header">
										<div id="exampaper-title">
											<i class="fa fa-send"></i>
											<span id="exampaper-title-name">${paper.name}</span>
											<span style="display:none;" id="exampaper-id">${paper.id}</span>
											
										</div>
										<div id="exampaper-desc-container">
											<div id="exampaper-desc" class="exampaper-filter">
												
											
											</div>
											<div style="margin-top: 5px;">
												<span>试卷总分：</span><span id="exampaper-total-point" style="margin-right:20px;"></span>
												<span id="add-more-qt-to-paper"><i class="small-icon fa fa-plus-square" title="添加选项"></i><span>增加更多题目</span></span>
											</div>
											<div style="float: right;position: relative;top: -50px;">
											<button class="btn btn-danger save-paper-btn"><i class="fa fa-save"></i>保存试卷</button>
											</div>
										</div>
									</div>
									<ul id="exampaper-body" style="padding:0px;">
										[#list paper.pageQuestions as paperQuestion]
										<li class="question [#if paperQuestion.question.type == 'multiChoice'] qt-multiplechoice [#elseif paperQuestion.question.type == 'singleChoice'] qt-singlechoice [#else] qt-trueorfalse [/#if]">
											<div class="question-title">
												<div class="question-title-icon"></div>
												<span class="question-no"></span>
												<span class="question-type" style="display: none;">[#if paperQuestion.question.type == 'multiChoice']multiplechoice[#elseif paperQuestion.question.type == 'singleChoice']singlechoice[#else]trueorfalse[/#if]</span>
												<span class="question-id" style="display:none">${paperQuestion.question.id}</span>
												<span>[${message("shop.question.type." + paperQuestion.question.type)}]</span>
												<span class="question-point-content"><span>(</span><span class="question-point">${paperQuestion.mark}</span><span>分)</span></span>
											</div>
											<form class="question-body">
												<p class="question-body-text">${paperQuestion.question.stem}</p>
												<ul class="question-opt-list">
													[#list paperQuestion.question.options as option]
														[#if paperQuestion.question.type == 'singleChoice']
															<li class="question-list-item">
																<input type="radio" value="${option.id}" name="question-radio1" class="question-input">
																<span class="question-li-text">${option.content}</span>
															</li>
														[#elseif paperQuestion.question.type == 'multiChoice']
															<li class="question-list-item">
																<input type="checkbox" value="${option.id}" name="question-radio1" class="question-input">
																<span class="question-li-text">${option.content}</span>
															</li>
														[#else]
															<li class="question-list-item">
																<input type="radio" value="${option.id}" name="question-radio1" class="question-input">
																<span class="question-li-text">${option.content}</span>
															</li>
														[/#if]
													[/#list]
												</ul>
											</form>
											<div class="answer-desc">
												<div class="answer-desc-summary">
													<span>正确答案：</span>
													[#list paperQuestion.question.options as option]
														[#if option.isCorrect == true]
															<span class="answer_option" optionId="${option.id}">${option.content}</span>
														[/#if]
													[/#list]
													<br>
												</div>
												<div class="answer-desc-detail">
													<label class="label label-warning"><i class="fa fa-flag"></i>
														<span> 解析</span>
													</label>
													<div class="answer-desc-content">
														<p>${paperQuestion.question.anisys}</p>
													</div>
												</div>
											</div>
										</li>
										[/#list]
									</ul>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="question-selector-modal">
						  <div class="modal-dialog modal-lg">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title">选择试题添加到试卷中</h4>
						      </div>
						      <div class="modal-body">
						        <iframe  id="qt-selector-iframe" src="" width="100%"></iframe>
						      </div>
						      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
							        <button id="add-list-to-exampaper" type="button" class="btn btn-primary">添加选中</button>
							      </div>
						      
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
			</div>
			<div class="modal fade" id="question-point-modal">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title">修改分数</h4>
						      </div>
						      <div class="modal-body">
						        	<form>
										<div class="form-line qt-point-destination">
											<span class="form-label">分数：</span>
											<label></label>
											<input type="text" value=""/>
										</div>
										<div class="form-line">
											<button class="btn btn-sm btn-success" id="update-point-btn"><i class="fa fa-check"></i>仅修改第<span id="qt-point-target-index"></span>题</button>
											<button class="btn btn-sm btn-warning" id="update-point-type-btn"><i class="fa fa-random"></i>批量更新该题型</button>
										</div>
									</form> 

						      </div>
						      
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
			</div>
			
		</div>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="${base!}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${base!}/static../../js/all.js"></script>
		<script type="text/javascript" src="${base!}/static../../js/exampaper-edit.js"></script>
		
	</body>
</html>