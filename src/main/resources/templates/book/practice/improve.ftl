<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>ExamStack</title>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="${base!}/favicon.ico"/>
    <link rel="stylesheet" href="${base!}/static/plugins/bootstrap/css/bootstrap-huan.css">
    <link rel="stylesheet" href="${base!}/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${base!}/static/css/exam.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${base!}/static/css/style.css">
    <style type="text/css">
        .question-body {
            padding: 30px 30px 20px 30px;
            background: #FFF;
        }

        ul#exampaper-body {
            margin-bottom: 0px;
        }

        ul#exampaper-body li {
            padding-bottom: 0px;
        }

        .question-body {
            min-height: 300px;
        }

    </style>
</head>
<body>
[#include "../../include/head_bar.ftl"]
<div class="content" style="margin-bottom: 100px;">
    <div class="container">
        <div class="row">
            <div class="col-xs-3" style="padding-right: 0px;padding-bottom:15px;">
                <div class="def-bk" id="bk-exam-control">
                    <div class="def-bk-content" id="exam-control">
                        <div>
                            <span style="color:#428bca;">章节：${category.parent.name}-${category.name}</span>
                            <span id="practice-type" class="pt-singlechoice">[ 共 <span class="pt-tno">${questions?size}</span> 题 ]<span
                                        class="pt-qcode" style="display:none;">qt-singlechoice</span></span>
                            <div id="answer-save-info"></div>
                        </div>
                        <div id="question-submit">
                            <button class="btn-success btn" style="width:100%;" id="switch-model-btn" data-exam="true">答题模式</button>
                        </div>
                        <div id="exam-info" style="display:none;">
                            <span id="answer-hashcode"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-9" style="padding-right: 0px;">
                <div class="def-bk" id="bk-exampaper">
                    <div class="expand-bk-content" id="bk-conent-exampaper">
                        <div id="exampaper-header">
                            <div id="exampaper-title" style="margin-bottom:15px;">
                                <i class="fa fa-paper-plane"></i>
                                <span id="exampaper-title-name">${category.name}</span>
                            </div>
                        </div>
                        <ul id="exampaper-body">
                            [#list questions as question]
                                <li class="question [#if question.type == 'multiChoice'] qt-multiplechoice [#else] qt-singlechoice [/#if]">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div>
                                        <span class="question-no"></span>
                                        <span class="question-id" style="display:none">${question.id}</span>
                                        <span>[${message("shop.question.type." + question.type)}]</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">${question.stem}</p>
                                        <ul class="question-opt-list">
                                            [#list question.options as option]
                                                [#if question.type == 'singleChoice']
                                                    <li class="question-list-item">
                                                        <input type="radio" value="${option.id}" name="question-radio1"
                                                               class="question-input">
                                                        <span class="question-li-text">${option.content}</span>
                                                    </li>
                                                [#elseif question.type == 'multiChoice']
                                                    <li class="question-list-item">
                                                        <input type="checkbox" value="${option.id}" name="question-radio1"
                                                               class="question-input">
                                                        <span class="question-li-text">${option.content}</span>
                                                    </li>
                                                [#else]
                                                    <li class="question-list-item">
                                                        <input type="radio" value="${option.id}" name="question-radio1"
                                                               class="question-input">
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
                            [/#list]
                        </ul>
                        <div id="exampaper-footer">
                            <div id="question-switch">
                                <button class="btn-success btn" id="previous-q-btn" style="width:160px;">
                                    <i class="fa fa-chevron-circle-left"></i>上一题
                                </button>
                                <button class="btn-success btn" id="next-q-btn" style="margin-left:60px;width:160px;">
                                    下一题 <i class="fa fa-chevron-circle-right"></i>
                                </button>
                                <button class="btn-warning btn" id="submit-q-btn" style="width:160px;float:right;">
                                    <i class="fa fa-check-circle-o"></i>提交答案
                                </button>
                            </div>
                            <div id="question-navi">
                                <div id="question-navi-controller">
                                    <i class="fa fa-arrow-circle-down"></i>
                                    <span>答题卡</span>
                                </div>
                                <div id="question-navi-content"></div>
                            </div>
                        </div>
                    </div>
                    <!-- 先不做评论
                    <div class="expand-bk-content" id="bk-conent-comment" style="margin-top:40px;">
                        <div id="comment-title" style="margin-bottom:15px;">
                            <i class="fa fa-comments"></i>
                            <span> 学员评论 </span>

                        </div>
                        <form class="comment-form">
                            <textarea rows="" cols="" style="width:100%;height:95px;" placeholder="随便说点什么吧..."></textarea>
                            <input class="btn btn-primary" type="submit" value="发表评论">
                        </form>
                        <div class="comment-total"><span class="comment-total-num">18</span>条评论</div>
                        <ul class="comment-list">
                        </ul>
                        <div id="show-more-div">
                            <input type="hidden" id="idx-hidden" value="1">
                            <input type="hidden" id="last-floor-hidden" value="0">
                            <button id="show-more-btn">更多评论</button>
                        </div>
                    </div>-->
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
<script type="text/javascript" src="${base!}/static../../js/practice-improve.js"></script>
</body>
</html>
