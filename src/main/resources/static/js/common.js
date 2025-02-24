/*
 * Copyright 2005-2013 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 * 
 * JavaScript - Common
 * Version: 3.0
 */

var shopxx = {
    base: "/shop", locale: "zh_CN"
};

var setting = {
    priceScale: "2",
    priceRoundType: "roundHalfUp",
    currencySign: "￥",
    currencyUnit: "元",
    uploadImageExtension: "jpg,jpeg,bmp,gif,png",
    uploadFlashExtension: "swf,flv",
    uploadMediaExtension: "swf,flv,mp3,wav,avi,rm,rmvb",
    uploadFileExtension: "zip,rar,7z,doc,docx,xls,xlsx,ppt,pptx"
};

var messages = {
    "shop.message.success": "操作成功",
    "shop.message.error": "操作错误",
    "shop.dialog.ok": "确&nbsp;&nbsp;定",
    "shop.dialog.cancel": "取&nbsp;&nbsp;消",
    "shop.dialog.deleteConfirm": "您确定要删除吗？",
    "shop.dialog.clearConfirm": "您确定要清空吗？",
    "shop.browser.title": "选择文件",
    "shop.browser.upload": "本地上传",
    "shop.browser.parent": "上级目录",
    "shop.browser.orderType": "排序方式",
    "shop.browser.name": "名称",
    "shop.browser.size": "大小",
    "shop.browser.type": "类型",
    "shop.browser.select": "选择文件",
    "shop.upload.sizeInvalid": "上传文件大小超出限制",
    "shop.upload.typeInvalid": "上传文件格式不正确",
    "shop.upload.invalid": "上传文件格式或大小不正确",
    "shop.validate.required": "必填",
    "shop.validate.email": "E-mail格式错误",
    "shop.validate.url": "网址格式错误",
    "shop.validate.date": "日期格式错误",
    "shop.validate.dateISO": "日期格式错误",
    "shop.validate.pointcard": "信用卡格式错误",
    "shop.validate.number": "只允许输入数字",
    "shop.validate.digits": "只允许输入零或正整数",
    "shop.validate.minlength": "长度不允许小于{0}",
    "shop.validate.maxlength": "长度不允许大于{0}",
    "shop.validate.rangelength": "长度必须在{0}-{1}之间",
    "shop.validate.min": "不允许小于{0}",
    "shop.validate.max": "不允许大于{0}",
    "shop.validate.range": "必须在{0}-{1}之间",
    "shop.validate.accept": "输入后缀错误",
    "shop.validate.equalTo": "两次输入不一致",
    "shop.validate.remote": "输入错误",
    "shop.validate.integer": "只允许输入整数",
    "shop.validate.positive": "只允许输入正数",
    "shop.validate.negative": "只允许输入负数",
    "shop.validate.decimal": "数值超出了允许范围",
    "shop.validate.pattern": "格式错误",
    "shop.validate.extension": "文件格式错误"
};

// 添加Cookie
function addCookie(name, value, options) {
    if (arguments.length > 1 && name != null) {
        if (options == null) {
            options = {};
        }
        if (value == null) {
            options.expires = -1;
        }
        if (typeof options.expires == "number") {
            var time = options.expires;
            var expires = options.expires = new Date();
            expires.setTime(expires.getTime() + time * 1000);
        }
        document.cookie = encodeURIComponent(String(name)) + "=" + encodeURIComponent(String(value)) + (options.expires ? "; expires=" + options.expires.toUTCString() : "") + (options.path ? "; path=" + options.path : "") + (options.domain ? "; domain=" + options.domain : ""), (options.secure ? "; secure" : "");
    }
}

// 获取Cookie
function getCookie(name) {
    if (name != null) {
        var value = new RegExp("(?:^|; )" + encodeURIComponent(String(name)) + "=([^;]*)").exec(document.cookie);
        return value ? decodeURIComponent(value[1]) : null;
    }
}

// 移除Cookie
function removeCookie(name, options) {
    addCookie(name, null, options);
}

// 货币格式化
function currency(value, showSign, showUnit) {
    if (value != null) {
        var price;
        if (setting.priceRoundType == "roundHalfUp") {
            price = (Math.round(value * Math.pow(10, setting.priceScale)) / Math.pow(10, setting.priceScale)).toFixed(setting.priceScale);
        } else if (setting.priceRoundType == "roundUp") {
            price = (Math.ceil(value * Math.pow(10, setting.priceScale)) / Math.pow(10, setting.priceScale)).toFixed(setting.priceScale);
        } else {
            price = (Math.floor(value * Math.pow(10, setting.priceScale)) / Math.pow(10, setting.priceScale)).toFixed(setting.priceScale);
        }
        if (showSign) {
            price = setting.currencySign + price;
        }
        if (showUnit) {
            price += setting.currencyUnit;
        }
        return price;
    }
}

// 多语言
function message(code) {
    if (code != null) {
        var content = messages[code] != null ? messages[code] : code;
        if (arguments.length == 1) {
            return content;
        } else {
            if ($.isArray(arguments[1])) {
                $.each(arguments[1], function (i, n) {
                    content = content.replace(new RegExp("\\{" + i + "\\}", "g"), n);
                });
                return content;
            } else {
                $.each(Array.prototype.slice.apply(arguments).slice(1), function (i, n) {
                    content = content.replace(new RegExp("\\{" + i + "\\}", "g"), n);
                });
                return content;
            }
        }
    }
}

(function ($) {

    var zIndex = 100;

    // 检测登录
    $.checkLogin = function () {
        var result = false;
        $.ajax({
            url: shopxx.base + "/login/check", type: "GET", dataType: "json", cache: false, async: false, success: function (data) {
                result = data;
            }
        });
        return result;
    }

    // 跳转登录
    $.redirectLogin = function (redirectUrl, message) {
        var href = shopxx.base + "/login";
        if (redirectUrl != null) {
            href += "?redirectUrl=" + encodeURIComponent(redirectUrl);
        }
        if (message != null) {
            $.message("warn", message);
            setTimeout(function () {
                location.href = href;
            }, 1000);
        } else {
            location.href = href;
        }
    }

    // 消息框
    var $message;
    var messageTimer;
    $.message = function () {
        var message = {};
        if ($.isPlainObject(arguments[0])) {
            message = arguments[0];
        } else if (typeof arguments[0] === "string" && typeof arguments[1] === "string") {
            message.type = arguments[0];
            message.content = arguments[1];
        } else {
            return false;
        }

        if (message.type == null || message.content == null) {
            return false;
        }

        if ($message == null) {
            $message = $('<div class="xxMessage"><div class="messageContent message' + message.type + 'Icon"><\/div><\/div>');
            if (!window.XMLHttpRequest) {
                $message.append('<iframe class="messageIframe"><\/iframe>');
            }
            $message.appendTo("body");
        }

        $message.children("div").removeClass("messagewarnIcon messageerrorIcon messagesuccessIcon").addClass("message" + message.type + "Icon").html(message.content);
        $message.css({"margin-left": -parseInt($message.outerWidth() / 2), "z-index": zIndex++}).show();

        clearTimeout(messageTimer);
        messageTimer = setTimeout(function () {
            $message.hide();
        }, 3000);
        return $message;
    }

    // 对话框
    $.dialog = function (options) {
        var settings = {
            width: 320,
            height: "auto",
            modal: true,
            ok: message("shop.dialog.ok"),
            cancel: message("shop.dialog.cancel"),
            onShow: null,
            onClose: null,
            onOk: null,
            onCancel: null
        };
        $.extend(settings, options);

        if (settings.content == null) {
            return false;
        }

        var $dialog = $('<div class="xxDialog"><\/div>');
        var $dialogTitle;
        var $dialogClose = $('<div class="dialogClose"><\/div>').appendTo($dialog);
        var $dialogContent;
        var $dialogBottom;
        var $dialogOk;
        var $dialogCancel;
        var $dialogOverlay;
        if (settings.title != null) {
            $dialogTitle = $('<div class="dialogTitle"><\/div>').appendTo($dialog);
        }
        if (settings.type != null) {
            $dialogContent = $('<div class="dialogContent dialog' + settings.type + 'Icon"><\/div>').appendTo($dialog);
        } else {
            $dialogContent = $('<div class="dialogContent"><\/div>').appendTo($dialog);
        }
        if (settings.ok != null || settings.cancel != null) {
            $dialogBottom = $('<div class="dialogBottom"><\/div>').appendTo($dialog);
        }
        if (settings.ok != null) {
            $dialogOk = $('<input type="button" class="button" value="' + settings.ok + '" \/>').appendTo($dialogBottom);
        }
        if (settings.cancel != null) {
            $dialogCancel = $('<input type="button" class="button" value="' + settings.cancel + '" \/>').appendTo($dialogBottom);
        }
        if (!window.XMLHttpRequest) {
            $dialog.append('<iframe class="dialogIframe"><\/iframe>');
        }
        $dialog.appendTo("body");
        if (settings.modal) {
            $dialogOverlay = $('<div class="dialogOverlay"><\/div>').insertAfter($dialog);
        }

        var dialogX;
        var dialogY;
        if (settings.title != null) {
            $dialogTitle.text(settings.title);
        }
        $dialogContent.html(settings.content);
        $dialog.css({
            "width": settings.width, "height": settings.height, "margin-left": -parseInt(settings.width / 2), "z-index": zIndex++
        });
        dialogShow();

        if ($dialogTitle != null) {
            $dialogTitle.mousedown(function (event) {
                $dialog.css({
                    "z-index": zIndex++
                });
                var offset = $(this).offset();
                if (!window.XMLHttpRequest) {
                    dialogX = event.clientX - offset.left;
                    dialogY = event.clientY - offset.top;
                } else {
                    dialogX = event.pageX - offset.left;
                    dialogY = event.pageY - offset.top;
                }
                $("body").bind("mousemove", function (event) {
                    $dialog.css({
                        "top": event.clientY - dialogY, "left": event.clientX - dialogX, "margin": 0
                    });
                });
                return false;
            }).mouseup(function () {
                $("body").unbind("mousemove");
                return false;
            });
        }

        if ($dialogClose != null) {
            $dialogClose.click(function () {
                dialogClose();
                return false;
            });
        }

        if ($dialogOk != null) {
            $dialogOk.click(function () {
                if (settings.onOk && typeof settings.onOk == "function") {
                    if (settings.onOk($dialog) != false) {
                        dialogClose();
                    }
                } else {
                    dialogClose();
                }
                return false;
            });
        }

        if ($dialogCancel != null) {
            $dialogCancel.click(function () {
                if (settings.onCancel && typeof settings.onCancel == "function") {
                    if (settings.onCancel($dialog) != false) {
                        dialogClose();
                    }
                } else {
                    dialogClose();
                }
                return false;
            });
        }

        function dialogShow() {
            if (settings.onShow && typeof settings.onShow == "function") {
                if (settings.onShow($dialog) != false) {
                    $dialog.show();
                    $dialogOverlay.show();
                }
            } else {
                $dialog.show();
                $dialogOverlay.show();
            }
        }

        function dialogClose() {
            if (settings.onClose && typeof settings.onClose == "function") {
                if (settings.onClose($dialog) != false) {
                    $dialogOverlay.remove();
                    $dialog.remove();
                }
            } else {
                $dialogOverlay.remove();
                $dialog.remove();
            }
        }

        return $dialog;
    }

    // 文件浏览
    $.fn.extend({
        browser: function (options) {
            var settings = {
                type: "image",
                title: message("shop.browser.title"),
                isUpload: true,
                browserUrl: shopxx.base + "/admin/file/browser",
                uploadUrl: shopxx.base + "/admin/file/upload",
                callback: null
            };
            $.extend(settings, options);

            var token = getCookie("token");
            var cache = {};
            return this.each(function () {
                var browserFrameId = "browserFrame" + (new Date()).valueOf() + Math.floor(Math.random() * 1000000);
                var $browserButton = $(this);
                $browserButton.click(function () {
                    var $browser = $('<div class="xxBrowser"><\/div>');
                    var $browserBar = $('<div class="browserBar"><\/div>').appendTo($browser);
                    var $browserFrame;
                    var $browserForm;
                    var $browserUploadButton;
                    var $browserUploadInput;
                    var $browserParentButton;
                    var $browserOrderType;
                    var $browserLoadingIcon;
                    var $browserList;
                    if (settings.isUpload) {
                        $browserFrame = $('<iframe id="' + browserFrameId + '" name="' + browserFrameId + '" style="display: none;"><\/iframe>').appendTo($browserBar);
                        $browserForm = $('<form action="' + settings.uploadUrl + '" method="post" encType="multipart/form-data" target="' + browserFrameId + '"><input type="hidden" name="token" value="' + token + '" \/><input type="hidden" name="fileType" value="' + settings.type + '" \/><\/form>').appendTo($browserBar);
                        $browserUploadButton = $('<a href="javascript:;" class="browserUploadButton button">' + message("shop.browser.upload") + '<\/a>').appendTo($browserForm);
                        $browserUploadInput = $('<input type="file" name="file" \/>').appendTo($browserUploadButton);
                    }
                    $browserParentButton = $('<a href="javascript:;" class="button">' + message("shop.browser.parent") + '<\/a>').appendTo($browserBar);
                    $browserBar.append(message("shop.browser.orderType") + ": ");
                    $browserOrderType = $('<select name="orderType" class="browserOrderType"><option value="name">' + message("shop.browser.name") + '<\/option><option value="size">' + message("shop.browser.size") + '<\/option><option value="type">' + message("shop.browser.type") + '<\/option><\/select>').appendTo($browserBar);
                    $browserLoadingIcon = $('<span class="loadingIcon" style="display: none;">&nbsp;<\/span>').appendTo($browserBar);
                    $browserList = $('<div class="browserList"><\/div>').appendTo($browser);

                    var $dialog = $.dialog({
                        title: settings.title, content: $browser, width: 470, modal: true, ok: null, cancel: null
                    });

                    browserList("/");

                    function browserList(path) {
                        var key = settings.type + "_" + path + "_" + $browserOrderType.val();
                        if (cache[key] == null) {
                            $.ajax({
                                url: settings.browserUrl, type: "GET", data: {
                                    fileType: settings.type, orderType: $browserOrderType.val(), path: path
                                }, dataType: "json", cache: false, beforeSend: function () {
                                    $browserLoadingIcon.show();
                                }, success: function (data) {
                                    createBrowserList(path, data);
                                    cache[key] = data;
                                }, complete: function () {
                                    $browserLoadingIcon.hide();
                                }
                            });
                        } else {
                            createBrowserList(path, cache[key]);
                        }
                    }

                    function createBrowserList(path, data) {
                        var browserListHtml = "";
                        $.each(data, function (i, fileInfo) {
                            var iconUrl;
                            var title;
                            if (fileInfo.isDirectory) {
                                iconUrl = shopxx.base + "/static/admin/images/folder_icon.gif";
                                title = fileInfo.name;
                            } else if (new RegExp("^\\S.*\\.(jpg|jpeg|bmp|gif|png)$", "i")
                                .test(fileInfo.name)) {
                                iconUrl = fileInfo.url;
                                title = fileInfo.name + " (" + Math
                                    .ceil(fileInfo.size / 1024) + "KB, " + new Date(fileInfo.lastModified)
                                    .toLocaleString() + ")";
                            } else {
                                iconUrl = shopxx.base + "/static/admin/images/file_icon.gif";
                                title = fileInfo.name + " (" + Math
                                    .ceil(fileInfo.size / 1024) + "KB, " + new Date(fileInfo.lastModified)
                                    .toLocaleString() + ")";
                            }
                            browserListHtml += '<div class="browserItem"><img src="' + iconUrl + '" title="' + title + '" url="' + fileInfo.url + '" isDirectory="' + fileInfo.isDirectory + '" \/><div>' + fileInfo.name + '<\/div><\/div>';
                        });
                        $browserList.html(browserListHtml);

                        $browserList.find("img").bind("click", function () {
                            var $this = $(this);
                            var isDirectory = $this
                                .attr("isDirectory");
                            if (isDirectory == "true") {
                                var name = $this.next().text();
                                browserList(path + name + "/");
                            } else {
                                var url = $this
                                    .attr("url");
                                if (settings.input != null) {
                                    settings.input.val(url);
                                } else {
                                    $browserButton.prev(":text").val(url);
                                }
                                if (settings.callback != null && typeof settings.callback == "function") {
                                    settings.callback(url);
                                }
                                $dialog.next(".dialogOverlay").andSelf().remove();
                            }
                        });

                        if (path == "/") {
                            $browserParentButton.unbind("click");
                        } else {
                            var parentPath = path.substr(0, path.replace(/\/$/, "").lastIndexOf("/") + 1);
                            $browserParentButton.unbind("click").bind("click", function () {
                                browserList(parentPath);
                            });
                        }
                        $browserOrderType.unbind("change").bind("change", function () {
                            browserList(path);
                        });
                    }

                    $browserUploadInput.change(function () {
                        var allowedUploadExtensions;
                        if (settings.type == "flash") {
                            allowedUploadExtensions = setting.uploadFlashExtension;
                        } else if (settings.type == "media") {
                            allowedUploadExtensions = setting.uploadMediaExtension;
                        } else if (settings.type == "file") {
                            allowedUploadExtensions = setting.uploadFileExtension;
                        } else {
                            allowedUploadExtensions = setting.uploadImageExtension;
                        }
                        if ($
                            .trim(allowedUploadExtensions) == "" || !new RegExp("^\\S.*\\.(" + allowedUploadExtensions
                            .replace(/,/g, "|") + ")$", "i")
                            .test($browserUploadInput
                                .val())) {
                            $
                                .message("warn", message("shop.upload.typeInvalid"));
                            return false;
                        }
                        $browserLoadingIcon
                            .show();
                        $browserForm.submit();
                    });

                    $browserFrame.load(function () {
                        var text;
                        var io = document
                            .getElementById(browserFrameId);
                        if (io.contentWindow) {
                            text = io.contentWindow.document.body ? io.contentWindow.document.body.innerHTML : null;
                        } else if (io.contentDocument) {
                            text = io.contentDocument.document.body ? io.contentDocument.document.body.innerHTML : null;
                        }
                        if ($.trim(text) != "") {
                            $browserLoadingIcon
                                .hide();
                            var data = $
                                .parseJSON(text);
                            if (data.message.type == "success") {
                                if (settings.input != null) {
                                    settings.input
                                        .val(data.url);
                                } else {
                                    $browserButton
                                        .prev(":text")
                                        .val(data.url);
                                }
                                if (settings.callback != null && typeof settings.callback == "function") {
                                    settings
                                        .callback(data.url);
                                }
                                cache = {};
                                $dialog
                                    .next(".dialogOverlay")
                                    .andSelf()
                                    .remove();
                            } else {
                                $
                                    .message(data.message);
                            }
                        }
                    });

                });
            });
        }
    });

    // 令牌
    $(document).ajaxSend(function (event, request, settings) {
        if (!settings.crossDomain && settings.type != null && settings.type.toLowerCase() == "post") {
            var token = getCookie("token");
            if (token != null) {
                request.setRequestHeader("token", token);
            }
        }
    });

    $(document).ajaxComplete(function (event, request, settings) {
        var loginStatus = request.getResponseHeader("loginStatus");
        var tokenStatus = request.getResponseHeader("tokenStatus");
        if (loginStatus == "accessDenied") {
            $.message("warn", "登录超时，请重新登录");
            setTimeout(function () {
                location.reload(true);
            }, 2000);
        } else if (loginStatus == "unauthorized") {
            $.message("warn", "对不起，您无此操作权限！");
        } else if (tokenStatus == "accessDenied") {
            var token = getCookie("token");
            if (token != null) {
                $.extend(settings, {
                    global: false, headers: {token: token}
                });
                $.ajax(settings);
            }
        }
    });
})(jQuery);

// 令牌
$(document).ready(function () {
    $("form").submit(function () {
        var $this = $(this);
        if ($this.attr("method") != null && $this.attr("method").toLowerCase() == "post" && $this.find("input[name='token']").size() == 0) {
            var token = getCookie("token");
            if (token != null) {
                $this.append('<input type="hidden" name="token" value="' + token + '" \/>');
            }
        }
    });
});

// 验证消息
if ($.validator != null) {
    $.extend($.validator.messages, {
        required: message("shop.validate.required"),
        email: message("shop.validate.email"),
        url: message("shop.validate.url"),
        date: message("shop.validate.date"),
        dateISO: message("shop.validate.dateISO"),
        pointcard: message("shop.validate.pointcard"),
        number: message("shop.validate.number"),
        digits: message("shop.validate.digits"),
        minlength: $.validator.format(message("shop.validate.minlength")),
        maxlength: $.validator.format(message("shop.validate.maxlength")),
        rangelength: $.validator.format(message("shop.validate.rangelength")),
        min: $.validator.format(message("shop.validate.min")),
        max: $.validator.format(message("shop.validate.max")),
        range: $.validator.format(message("shop.validate.range")),
        accept: message("shop.validate.accept"),
        equalTo: message("shop.validate.equalTo"),
        remote: message("shop.validate.remote"),
        integer: message("shop.validate.integer"),
        positive: message("shop.validate.positive"),
        negative: message("shop.validate.negative"),
        decimal: message("shop.validate.decimal"),
        pattern: message("shop.validate.pattern"),
        extension: message("shop.validate.extension")
    });

    $.validator.setDefaults({
        errorClass: "fieldError", ignore: ".ignore", ignoreTitle: true, errorPlacement: function (error, element) {
            var fieldSet = element.closest("span.fieldSet");
            if (fieldSet.size() > 0) {
                error.appendTo(fieldSet);
            } else {
                error.insertAfter(element);
            }
        }, submitHandler: function (form) {
            $(form).find(":submit").prop("disabled", true);
            form.submit();
        }
    });
}
