<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>ExamStack</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="${base!}/favicon.ico" />
<link rel="stylesheet" href="${base!}/static/plugins/bootstrap/css/bootstrap-huan.css">
<link rel="stylesheet" href="${base!}/static/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${base!}/static/css/exam.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${base!}/static/css/style.css">
<style type="text/css">
    input[type="radio"]{
        font-size:100px;
    }
</style>
</head>
<body>
[#include "../../include/head_bar.ftl"]
<!-- Navigation bar ends -->
<div class="content" style="margin-bottom: 100px;">
    <div class="container">
        <div class="row">
            <div class="col-xs-2" style="padding-right: 0px;padding-bottom:15px;">
                <div class="def-bk" id="bk-exam-control">
                    <div class="def-bk-content" id="exam-control">
                        <div id="question-time" class="question-time-normal">
                            <div style="height:140px;text-align: center;">
                                <i id="time-icon" class="fa fa-clock-o"> </i>
                            </div>
                            <span style="margin-right:10px;color: #B8B8B8;">已用时</span>
                            <span id="exam-clock">&nbsp;</span>
                            <span id="exam-timestamp" style="display:none;">${exam.paper.costTime * 60}</span>
                            <div id="answer-save-info"></div>
                        </div>
                        <div id="question-submit">
                            <button class="btn-success btn" style="width:100%;">
                                我要交卷
                            </button>
                        </div>
                        <div id="exam-info" style="display:none;">
                            <span id="answer-hashcode"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-10" style="padding-right: 0px;">
                <div class="def-bk" id="bk-exampaper">
                    <div class="expand-bk-content" id="bk-conent-exampaper">
                        <div id="exampaper-header">
                            <div id="exampaper-title">
                                <i class="fa fa-send"></i>
                                <span id="exampaper-title-name"> 模拟试卷 </span>
                                <span style="display:none;" id="exampaper-id">1</span>
                            </div>
                            <div id="exampaper-desc-container">
                                <div id="exampaper-desc" class="exampaper-filter">
                                </div>
                            </div>
                        </div>
                        <input type="hidden" id="start-time" value="${answerSheet.startDate}">
                        <input type="hidden" id="hist-id" value="111">
                        <input type="hidden" id="paper-id" value="${exam.paper.id}">
                        <input type="hidden" id="exam-id" value="${exam.id}">
                        <ul id="exampaper-body">
                            [#list exam.paper.pageQuestions as paperQuestion]
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
                            </li>
                            [/#list]
                        </ul>
                        <div id="exampaper-footer">
                            <div id="question-navi">
                                <div id="question-navi-controller">
                                    <i class="fa fa-arrow-circle-down"></i>
                                    <span>答题卡</span>
                                </div>
                                <div id="question-navi-content">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
[#include "../../include/bottom_bar.ftl"]
<!-- Slider Ends -->
<!-- Javascript files -->
<!-- jQuery -->
<script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="${base!}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base!}/static../../js/all.js?v=0712"></script>
<script type="text/javascript" src="${base!}/static../../js/paper-examing.js"></script>
</body>
</html>
