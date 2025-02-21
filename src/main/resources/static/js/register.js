/*
 * Copyright 2005-2013 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 * 
 * JavaScript - Input
 * Version: 3.0
 */

$(document).ready(function () {

    if ($.tools != null) {
        var $tab = $("#tab");
        var $title = $("#inputForm :input[title], #inputForm label[title]");

        // Tab效果
        $tab.tabs("table.tabContent, div.tabContent", {
            tabs: "input"
        });

        // 表单提示
        $title.tooltip({
            position: "center right",
            offset: [0, 4],
            effect: "fade"
        });
    }

    // 验证消息
    if ($.validator != null) {
        $.extend($.validator.messages, {
            required: message("" + "  有必填框未填写" + ""),
            email: message("shop.validate.email"),
            url: message("shop.validate.url"),
            date: message("shop.validate.date"),
            dateISO: message("shop.validate.dateISO"),
            pointcard: message("shop.validate.pointcard"),
            number: message("shop.validate.number"),
            digits: message("shop.validate.digits"),
            minlength: $.validator.format(message("" + "密码长度不能小于6" + "")),
            maxlength: $.validator.format(message("" + "手机号长度为11位" + "")),
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
            errorClass: "fieldError",
            ignore: ".ignore",
            ignoreTitle: true,
            errorPlacement: function (error, element) {
                var fieldSet = element.closest("span.fieldSet");
                if (fieldSet.size() > 0) {
                    error.appendTo(fieldSet);
                } else {
                    if (element.is(":text")) {
                        error.insertAfter(element.parent().next().next());
                        //error.insertAfter(element.next());
                        return;
                    }
                    if (element.is(":password")) {
                        error.insertAfter(element.parent().next().next());
                        return;
                    }
                }
            },
            submitHandler: function (form) {
                $(form).find(":submit").prop("disabled", true);
                form.submit();
            }
        });
    }
});

// 编辑器
if (typeof (KindEditor) != "undefined") {
    KindEditor.ready(function (K) {
        editor = K.create("#editor", {
            height: "350px",
            items: [
                "source", "|", "undo", "redo", "|", "preview", "print", "template", "cut", "copy", "paste",
                "plainpaste", "wordpaste", "|", "justifyleft", "justifycenter", "justifyright",
                "justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent", "subscript",
                "superscript", "clearhtml", "quickformat", "selectall", "|", "fullscreen", "/",
                "formatblock", "fontname", "fontsize", "|", "forecolor", "hilitecolor", "bold",
                "italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image",
                "flash", "media", "insertfile", "table", "hr", "emoticons", "baidumap", "pagebreak",
                "anchor", "link", "unlink"
            ],
            langType: shopxx.locale,
            syncType: "form",
            filterMode: false,
            pagebreakHtml: '<hr class="pageBreak" \/>',
            allowFileManager: true,
            filePostName: "file",
            fileManagerJson: shopxx.base + "/admin/file/browser",
            uploadJson: shopxx.base + "/admin/file/upload",
            uploadImageExtension: setting.uploadImageExtension,
            uploadFlashExtension: setting.uploadFlashExtension,
            uploadMediaExtension: setting.uploadMediaExtension,
            uploadFileExtension: setting.uploadFileExtension,
            extraFileUploadParams: {
                token: getCookie("token")
            },
            afterChange: function () {
                this.sync();
            }
        });
    });
}