<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.member.view")} - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link rel="stylesheet" href="${base!}/static/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${base!}/static/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base!}/static/js/common.js"></script>
<script type="text/javascript" src="${base!}/static/js/input.js"></script>
</head>
<body>
	<div class="path">
		<a href="${base!}/admin/common/index">${message("shop.path.index")}</a> &raquo; ${message("shop.member.view")}
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="${message("shop.member.base")}" />
		</li>
		[#if memberAttributes?has_content]
			<li>
				<input type="button" value="${message("shop.member.profile")}" />
			</li>
		[/#if]
	</ul>
	<table class="input tabContent">
		<tr>
			<th>
				${message("Member.username")}:
			</th>
			<td>
				${member.username}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.email")}:
			</th>
			<td>
				${member.email}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.memberRank")}:
			</th>
			<td>
				${member.memberRank.name}
			</td>
		</tr>
		<tr>
			<th>
				${message("shop.member.status")}:
			</th>
			<td>
				[#if !member.isEnabled]
					<span class="red">${message("shop.member.disabled")}</span>
				[#elseif member.isLocked]
					<span class="red"> ${message("shop.member.locked")} </span>
				[#else]
					<span class="green">${message("shop.member.normal")}</span>
				[/#if]
			</td>
		</tr>
		[#if member.isLocked]
			<tr>
				<th>
					${message("Member.lockedDate")}:
				</th>
				<td>
					${member.lockedDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr>
		[/#if]
		<tr>
			<th>
				${message("Member.point")}:
			</th>
			<td>
				${member.point}    <a href="view_sales_history?id=${member.id}">[查看购物历史]</>
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.balance")}:
			</th>
			<td>
				${currency(member.balance, true)}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.amount")}:
			</th>
			<td>
				${currency(member.amount, true)}
			</td>
		</tr>
		<tr>
			<th>
				${message("shop.common.createDate")}:
			</th>
			<td>
				${member.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.loginDate")}:
			</th>
			<td>
				${(member.loginDate?string("yyyy-MM-dd HH:mm:ss"))!"-"}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.registerIp")}:
			</th>
			<td>
				${member.registerIp}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.loginIp")}:
			</th>
			<td>
				${(member.loginIp)!"-"}
			</td>
		</tr>
		<tr>
			<th>
				${message("shop.member.reviewCount")}:
			</th>
			<td>
				${member.reviews?size}
			</td>
		</tr>
		<tr>
			<th>
				${message("shop.member.consultationCount")}:
			</th>
			<td>
				${member.consultations?size}
			</td>
		</tr>
		<tr>
			<th>
				${message("shop.member.favoriteProductCount")}:
			</th>
			<td>
				${member.favoriteProducts?size}
			</td>
		</tr>
	</table>
	[#if memberAttributes?has_content]
		<table class="input tabContent">
			[#list memberAttributes as memberAttribute]
				<tr>
					<th>
						${memberAttribute.name}:
					</th>
					<td>
						[#if memberAttribute.type == "name"]
							${member.name}
						[#elseif memberAttribute.type == "gender"]
							${message("Member.Gender." + member.gender)}
						[#elseif memberAttribute.type == "birth"]
							${member.birth}
						[#elseif memberAttribute.type == "area"]
							[#if member.area??]
								${member.area}
							[#else]
								${member.areaName}
							[/#if]
						[#elseif memberAttribute.type == "address"]
							${member.address}
						[#elseif memberAttribute.type == "zipCode"]
							${member.zipCode}
						[#elseif memberAttribute.type == "phone"]
							${member.phone}
						[#elseif memberAttribute.type == "mobile"]
							${member.mobile}
						[#elseif memberAttribute.type == "text"]
							${member.getAttributeValue(memberAttribute)}
						[#elseif memberAttribute.type == "select"]
							${member.getAttributeValue(memberAttribute)}
						[#elseif memberAttribute.type == "checkbox"]
							[#list member.getAttributeValue(memberAttribute) as option]
								${option}
							[/#list]
						[/#if]
					</td>
				</tr>
			[/#list]
		</table>
	[/#if]
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" class="button" value="${message("shop.common.back")}" onclick="location.href='list'" />
			</td>
		</tr>
	</table>
</body>
</html>