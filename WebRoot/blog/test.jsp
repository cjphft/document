<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title></title> <!-- basic styles -->

	<link href="${contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${contextPath}/assets/css/font-awesome.min.css" />

	<!--[if IE 7]>
<link rel="stylesheet" href="${contextPath}/assets/css/font-awesome-ie7.min.css" />
<![endif]-->

	<!-- page specific plugin styles -->

	<link rel="stylesheet" href="${contextPath}/assets/css/jquery-ui-1.10.3.full.min.css" />
	<link rel="stylesheet" href="${contextPath}/assets/css/datepicker.css" />
	<link rel="stylesheet" href="${contextPath}/assets/css/ui.jqgrid.css" />

	<!-- ace styles -->

	<link rel="stylesheet" href="${contextPath}/assets/css/ace.min.css" />
	<link rel="stylesheet" href="${contextPath}/assets/css/ace-rtl.min.css" />
	<link rel="stylesheet" href="${contextPath}/assets/css/ace-skins.min.css" />

	<!--[if lte IE 8]>
<link rel="stylesheet" href="${contextPath}/assets/css/ace-ie.min.css" />
<![endif]-->


	<!-- inline styles related to this page -->
	<link rel="stylesheet" href="${contextPath}/assets/css/ljhy.css" />
	<!-- ace settings handler -->

	<script src="${contextPath}/assets/js/ace-extra.min.js"></script>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

	<!--[if lt IE 9]>
<script src="${contextPath}/assets/js/html5shiv.js"></script>
<script src="${contextPath}/assets/js/respond.min.js"></script>
<![endif]-->
	<style>
body,html {
	height: 100%;
	width: 100%;
	overflow: hidden
}
</style>
</head>
<body>

	<table id="frametable" cellpadding="0" cellspacing="0" width="100%"
		height="100%">
		<tr>
			<td colspan="2" height="45">

				<div class="top_header">
					<div class="navbar navbar-default" id="navbar">
						<div class="navbar-container" id="navbar-container">
							<div class="navbar-header pull-left">
								<a href="#" class="navbar-brand"> <small class="logo_area">
										<i class="icon-leaf"></i> <span>档案借阅管理系统</span> </small> </a>
								<!-- /.brand -->
							</div>
							<!-- /.navbar-header -->

							<div class="navbar-header pull-right" role="navigation">
								<ul class="nav ace-nav">

									<li class="grey">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-tasks"></i>
								<span class="badge badge-grey">4</span>
							</a>

							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-ok"></i>
									借阅状态
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">案卷001</span>
											
											<span class="pull-right">40%</span>
											<span class="pull-right">管理员审核</span>
										</div>

										<div class="progress progress-mini ">
											<div style="width:40%" class="progress-bar "></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">案卷002</span>
											<span class="pull-right">80%</span>
											<span class="pull-right">等待返回</span>
										</div>

										<div class="progress progress-mini ">
											<div style="width:80%" class="progress-bar "></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										查看所有借阅中的档案
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>
									
									<li class="light-blue" style="width: 120px;"><a data-toggle="dropdown" href="#"
										class="dropdown-toggle"> 
										 <span class="user-info"> <small>欢迎光临,</small> 黄龙凯 </span> <i
											class="icon-caret-down"></i> </a>

										<ul
											class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

											<li><a href="#"> <i class="icon-user"></i> 我的账户 </a></li>

											<li class="divider"></li>

											<li><a href="#"> <i class="icon-off"></i> 退出 </a></li>
										</ul></li>
								</ul>
								<!-- /.ace-nav -->
							</div>
							<!-- /.navbar-header -->
						</div>
						<!-- /.container -->
					</div>
				</div></td>
		</tr>
		<tr>
			<td valign="top" width="191" height="100%">
				<div class="left">
					<div class="sidebar" id="sidebar"></div>
					<script id="_sidebarTpl" type="text/html">
                        <ul class="nav nav-list">
                            {{each data as item index}}
                            <li data-markid="{{item.menuid}}"  class="{{item.activeState}} {{item.openState}}">
                                <a href="javascript:;" class="dropdown-toggle" menuid="{{item.menuid}}" menuname="{{item.menuname}}" menuurl="{{item.menuurl}}" tobarString="{{item.tobarString}}">
                                    <i class="{{item.iconName}}"></i>
                                    <span class="menu-text">{{item.menuname}}</span>
                                    {{if item.subData}}
                                    <b class="arrow icon-angle-down"></b>
                                    {{/if}}
                                </a>
                                {{if item.subData}}
                                <ul class="submenu">
                                    {{each item.subData as subItem subIndex}}
                                    <li data-markid="{{subItem.menuid}}" class="{{subItem.activeState}} {{subItem.openState}}" >
                                        <a  href="javascript:;" menuid="{{subItem.menuid}}" menuname="{{subItem.menuname}}" menuurl="{{subItem.menuurl}}" tobarString="{{subItem.tobarString}}">
                                            <i class="icon-double-angle-right"></i>
                                            {{subItem.menuname}}
                                        </a>
                                    </li>
                                    {{/each}}
                                </ul>
                                {{/if}}
                            </li>
                            {{/each}}
                        </ul><!-- /.nav-list -->
                        <div class="sidebar-collapse" id="sidebar-collapse">
                            <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
                        </div>
                    </script>
				</div></td>
			<td valign="top" width="100%" height="100%"><iframe id="iframe"
					name="main" src="blog/right.jsp" width="100%" allowtransparency="true"
					height="100%" frameborder="0" scrolling="no"
					style="overflow:visible;"></iframe></td>
		</tr>
	</table>


	<script src="${contextPath}/assets/js/jquery-1.10.2.min.js"></script>
	<!--[if !IE]> -->

	<script type="text/javascript">
    window.jQuery || document.write("<script src='${contextPath}/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='${contextPath}/assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<![endif]-->

	<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='${contextPath}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
	<script src="${contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="${contextPath}/assets/js/typeahead-bs2.min.js"></script>


	<!--<script src="${contextPath}/assets/plugins/jquery.easyui.min.js"></script>
<script src="${contextPath}/assets/plugins/jquery.tabs.js"></script>-->
	<!-- ace scripts -->
	<script src="${contextPath}/assets/plugins/yui/yahoo-dom-event.js"></script>
	<script src="${contextPath}/assets/plugins/yui/connection-min.js"></script>
	<script src="${contextPath}/assets/plugins/yui/element-beta-min.js"></script>
	<script src="${contextPath}/assets/plugins/yui/tabview-min.js"></script>
	<script src="${contextPath}/assets/js/underscore-min.js"></script>
	<script src="${contextPath}/assets/js/template.js"></script>



	<script src="${contextPath}/assets/js/ace-elements.min.js"></script>
	<script src="${contextPath}/assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
	<script>
    //导航
    $(function(){

        //点击节点生成TAB页
        function setTab(obj) {
            window.main.addTab($(obj).attr('menuid'), $(obj).attr('menuname'), $(obj).attr('menuurl'));
            var tobarCurrString = "&nbsp;<a href=" + $(obj).attr('menuurl') + " target=iFrame" + $(obj).attr('menuid') + ">" + $(obj).attr('menuname') + "</a>";
        }

        //数据配置
        var sideBarData = {
            data: [
            	 
                {
                    menuid: "1",
                    menuname: "档案查询",
                    menuurl: "http://www.baidu.com",
                    tobarString: "档案借阅",
                    iconName: "icon-desktop",
                    openState: "",
                    activeState: "",
                    subData: [
                        {
                            menuid: "12",
                            menuname: "档案查看",
                            menuurl: "http://www.baidu.com",
                            tobarString: "档案查看",
                            openState: "",
                            activeState: ""
                        },
                        {
                            menuid: "13",
                            menuname: "档案统计",
                            menuurl: "http://www.baidu.com",
                            tobarString: "档案统计",
                            openState: "",
                            activeState: ""
                        }
                    ]
                },{
                    menuid: "2",
                    menuname: "档案借阅",
                    menuurl: "http://www.baidu.com",
                    tobarString: "档案借阅",
                    iconName: "icon-book",
                    openState: "",
                    activeState: "",
                    subData: [
                        {
                            menuid: "22",
                            menuname: "档案检索查阅",
                            menuurl: "http://www.baidu.com",
                            tobarString: "档案检索查阅",
                            openState: "",
                            activeState: ""
                        },
                        {
                            menuid: "23",
                            menuname: "档案归还",
                            menuurl: "http://www.baidu.com",
                            tobarString: "档案归还",
                            openState: "",
                            activeState: ""
                        }
                    ]
                },{
                    menuid: "3",
                    menuname: "档案归档",
                    menuurl: "http://www.baidu.com",
                    tobarString: "档案归档",
                    iconName: "icon-folder-close-alt",
                    openState: "",
                    activeState: "",
                    subData: [
                        {
                            menuid: "31",
                            menuname: "档案目录设置",
                            menuurl: "http://www.baidu.com",
                            tobarString: "档案目录设置",
                            openState: "",
                            activeState: ""
                        },
                        {
                            menuid: "32",
                            menuname: "档案录入",
                            menuurl: "http://www.baidu.com",
                            tobarString: "档案录入",
                            openState: "",
                            activeState: ""
                        }
                    ]
                },
                {
                    menuid: "5",
                    menuname: "档案销毁",
                    menuurl: "${contextPath}/blog",
                    tobarString: "档案销毁",
                    iconName: "icon-laptop",
                    openState: "",
                    activeState: ""
                },
                {
                    menuid: "6",
                    menuname: "我的账户",
                    menuurl: "ljhy_wdzh.html",
                    tobarString: "我的账户",
                    iconName: "icon-user",
                    openState: "",
                    activeState: ""
                }
            ]
        };
        //模板渲染
        function sideBarBuild() {
            var sideBarHtml = template("_sidebarTpl", sideBarData);
            $("#sidebar").html(sideBarHtml);
        }

        //初始化
        sideBarBuild();

        //点击一级菜单
        $(document).on('click', '.nav-list>li', function () {
            var markid = $(this).data('markid');
            _.each(sideBarData.data, function (sideBarDataItem) {
                if (sideBarDataItem.menuid == markid) {
                    if (sideBarDataItem.subData) {
                        _.each(sideBarDataItem.subData,function(sideBarSubDataItem){
                            sideBarSubDataItem.activeState='';
                        });
                        if (sideBarDataItem.openState == 'open') {
                            sideBarDataItem.openState = '';
                        } else {
                            sideBarDataItem.openState = 'open';
                        }
                        if (sideBarDataItem.activeState == 'active') {
                            sideBarDataItem.activeState = '';
                        } else {
                            sideBarDataItem.activeState = 'active';
                        }
                    } else {
                        sideBarDataItem.activeState = 'active';
                    }
                } else {
                    sideBarDataItem.openState = '';
                    sideBarDataItem.activeState = '';
                }
                sideBarBuild();
            })
        });

        //点击submenu子菜单
        $(document).on('click', '.nav-list>li .submenu>li', function () {
            var markid = $(this).data('markid');
            _.each(sideBarData.data, function (sideBarDataItem) {
                _.each(sideBarDataItem.subData, function (sideBarSubDataItem) {
                    if (sideBarSubDataItem.menuid == markid) {
                        _.each(sideBarData.data,function(sideBarDataItem){
                            sideBarDataItem.activeState='';
                        });
                        sideBarDataItem.activeState = 'active';
                        sideBarSubDataItem.activeState = 'active';
                    } else {
                        sideBarSubDataItem.activeState = '';
                    }
                });
            });
            sideBarBuild();
            return false;
        });

        //点击跳转
        $(document).on('click','.nav-list a',function(){
            setTab(this);
        });

        //点击折叠
        $(document).on('click','#sidebar-collapse',function(){
            var collapseIcon=$(this).children('i');
           if($("#sidebar").hasClass('menu-min')){
               $("#sidebar").removeClass('menu-min');
               collapseIcon.attr('class','icon-double-angle-left');
           }else{
               $("#sidebar").addClass('menu-min');
               collapseIcon.attr('class','icon-double-angle-right');
           }
        });
    })
</script>
</body>
</html>