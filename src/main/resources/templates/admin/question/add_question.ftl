<li class="question [#if question.type == 'multiChoice'] qt-multiplechoice [#elseif question.type == 'singleChoice'] qt-singlechoice [#else] qt-trueorfalse [/#if]">
	<div class="question-title">
		<div class="question-title-icon"></div>
		<span class="question-no"></span>
		<span class="question-type" style="display: none;">[#if question.type == 'multiChoice']multiplechoice[#elseif question.type == 'singleChoice']singlechoice[#else]trueorfalse[/#if]</span>
		<span class="question-id" style="display:none">${question.id}</span>
		<span>[${message("shop.question.type." + question.type)}]</span>
		<span class="question-point-content"><span>(</span><span class="question-point">0</span><span>分)</span></span>
		<a class="tmp-ques-remove" title="删除此题">删除</a>
	</div>
	<form class="question-body">
		<p class="question-body-text">${question.stem}</p>
		<ul class="question-opt-list">
		[#list question.options as option]
			[#if question.type == 'singleChoice']
				<li class="question-list-item">
					<input type="radio" value="${option.id}" name="question-radio1" class="question-input">
					<span class="question-li-text">${option.content}</span>
				</li>
			[#elseif question.type == 'multiChoice']
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
			[#list question.options as option]
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
			<p>${question.anisys}</p>
		</div>
		</div>
	</div>
</li>