<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
    <meta charset="utf-8">
    <title>用户中心</title>
    <meta name="keywords" content="">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="${base!}/favicon.ico"/>
    <link rel="stylesheet" href="${base!}/static/plugins/bootstrap/css/bootstrap-huan.css">
    <link rel="stylesheet" href="${base!}/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${base!}/static/css/style.css">
    <link rel="stylesheet" href="${base!}/static/css/exam.css">
    <link rel="stylesheet" href="${base!}/static/plugins/chart/morris.css">
    <!--[if lte IE 8]>
    <script type="text/javascript" src="resources/chartjs/excanvas.js"></script>
    <![endif]-->
    <style>
        .table-striped a {
            text-decoration: underline;
        }

        .span-success {
            color: #5cb85c;
            font-weight: bolder;
        }

        .span-danger {
            color: #d9534f;
            font-weight: bolder;
        }

        .span-info {
            color: #5bc0de;
            font-weight: bolder;
        }

        h6 {
            font-weight: bold !important;
        }

        .radar-legend li span {
            display: block;
            position: absolute;
            left: 0;
            top: 0;
            width: 20px;
            height: 100%;
            border-radius: 5px;
        }

        .radar-legend li {
            display: block;
            padding-left: 30px;
            position: relative;
            margin-bottom: 4px;
            border-radius: 5px;
            padding: 2px 8px 2px 28px;
            font-size: 14px;
            cursor: default;
            -webkit-transition: background-color 200ms ease-in-out;
            -moz-transition: background-color 200ms ease-in-out;
            -o-transition: background-color 200ms ease-in-out;
            transition: background-color 200ms ease-in-out;
        }

        #field-switch {
            margin: 15px 0 10px 0px;;
            height: 34px;
            width: 200px;
        }
    </style>
</head>
<body>
[#include "../../include/head_bar.ftl"]
<!-- Slider starts -->
<div>
    <!-- Slider (Flex Slider) -->
    <div class="container" style="min-height:500px;">
        <div class="row">
            <div class="col-xs-2">
                <ul class="nav default-sidenav">
                    <li class="active">
                        <a> <i class="fa fa-dashboard"></i> 用户中心 </a>
                    </li>
                    <li>
                        <a href="student/analysis"> <i class="fa fa-bar-chart-o"></i> 统计分析 </a>
                    </li>
                    <li>
                        <a href="student/exam-history"> <i class="fa fa-history"></i> 考试历史 </a>
                    </li>
                    <li>
                        <a href="student/training-history"> <i class="fa fa-book"></i> 培训历史 </a>
                    </li>
                </ul>
            </div>
            <div class="col-xs-10">
                <div class="page-header">
                    <h1><i class="fa fa-dashboard"></i> 用户中心</h1>
                </div>
                <div class="page-content row">
                    <div class="col-xs-4">
                        <h6>个人信息</h6>
                        <div>
                            <span>姓名：</span>
                            <span> </span>
                        </div>
                        <div>
                            <span>邮箱：</span>
                            <span>  </span>
                        </div>
                        <div>
                            <span>专业：</span>
                            <span> </span>
                        </div>
                        <div>
                            <span>上次登录：</span>
                            <span> <fmt:formatDate value="" pattern="yyyy-MM-dd"/> </span>
                        </div>
                    </div>
                </div>
                <div class="page-content row">
                    <div class="col-xs-12" id="radar-div">
                        <h6>知识掌握情况</h6>
                        <select id="field-switch" class="form-control">
                        </select>
                        <div class="page-content row">
                            <div class="col-xs-8">
                                <div id="mychart" style="height:450px;"></div>
                                <p>此统计数据不包括简答、论述、分析等主观题</p>
                            </div>
                            <div class="col-xs-4" id="radar-legend">
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
<script type="text/javascript" src="${base!}/static../../js/echarts-all.js"></script>
<!-- <script type="text/javascript" src="resources/chartjs/Chart.min.js"></script> -->
<!-- Bootstrap JS -->
<script type="text/javascript" src="${base!}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $("#field-switch").val("");
    $("#field-switch").change(function () {
        window.location.href = "student/usercenter/" + $(this).val();
    });

    $(function () {
        var option = {

            tooltip: {
                trigger: 'axis'
            },
            legend: {
                orient: 'vertical',
                x: 'right',
                y: 'bottom',
                data: ['完成率', '正确率']
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            polar: [
                {
                    indicator:
                }
            ],
            calculable: true,
            series: [
                {
                    name: '预算 vs 开销（Budget vs spending）',
                    type: 'radar',
                    data: [
                        {
                            value:,
                            name: '完成率'
                        },
                        {
                            value:,
                            name: '正确率'
                        }
                    ]
                }
            ]
        };
        var myChart = echarts.init(document.getElementById('mychart'));
        myChart.setOption(option);
    });
</script>
</body>
</html>