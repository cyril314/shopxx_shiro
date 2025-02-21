$(function() {
	question_list.initial();
	
	var questions = getUrlParam("questions");
	var questionArr = questions.split("|");
	var $checkboxs = $(".checkbox");
	
	for (var i=0;i<questionArr.length;i++)
	{
		$checkboxs.each(function()
		{
			$this = $(this);
			
			if ($this.val() == questionArr[i])
			{
				$this.attr("checked",false);
				$this.attr("disabled","disabled");
			}
		});
	}
});

var question_list = {
	initial : function initial() {
		this.bindChangeSearchParam();
	},
	
	bindChangeSearchParam : function bindChangeSearchParam(){
		$("#question-filter dl dd span").click(function()
		{
			if($(this).hasClass("label"))
			{
				return false;
			}
			
			var genrateParamOld = question_list.genrateParamOld();
			
			if($(this).parent().parent().attr("id") == "question-filter-field" )
			{
				genrateParamOld.rootCategory = $(this).data("id");
				genrateParamOld.category = "";
				question_list.redirectUrl(genrateParamOld);
			}
			else if($(this).parent().parent().attr("id") == "question-filter-knowledge" )
			{
				genrateParamOld.category = $(this).data("id");
				question_list.redirectUrl(genrateParamOld);
				
			}
			else
			{
				genrateParamOld.questiontype = $(this).data("id");
				question_list.redirectUrl(genrateParamOld);
			}
		});
		
		$(".pagination li a").click(function(){
			var pageId = $(this).data("id");
			if(pageId==null||pageId=="")return false;
			var genrateParamOld = question_list.genrateParamOld();
			genrateParamOld.page = pageId;
			question_list.redirectUrl(genrateParamOld);
			
		});
	},
	
	genrateParamOld :function genrateParamOld(){
		
		var rootCategory = $("#question-filter-field dd .label").data("id");
		var category = $("#question-filter-knowledge dd .label").data("id");
		var questiontype = $("#question-filter-qt dd .label").data("id");
		var searchParam = 0;
		var page = 1;
		
		var data = new Object();
		data.rootCategory = rootCategory;
		data.category = category;
		data.questiontype= questiontype;
		data.searchParam = searchParam;
		data.page = page;
		
		return data;
	},

	redirectUrl : function(newparam) {
		var questions = getUrlParam("questions");
		var paramurl = "rootCateId=" + newparam.rootCategory;
		paramurl = paramurl + "&categoryId=" + newparam.category;
		paramurl = paramurl + "&type=" + newparam.questiontype;
		paramurl = paramurl + "&pageNumber=" + newparam.page;
		paramurl = paramurl + "&questions=" + questions;
		document.location.href = "choice?" + paramurl;
	}
};