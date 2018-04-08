<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${contextPath}/assets/plugins/yui/tabview.css" />
    <script src="${contextPath}/assets/js/jquery-1.10.2.min.js"></script>
    <script src="${contextPath}/assets/plugins/yui/yahoo-dom-event.js"></script>
    <script src="${contextPath}/assets/plugins/yui/connection-min.js"></script>
    <script src="${contextPath}/assets/plugins/yui/element-beta-min.js"></script>
    <script src="${contextPath}/assets/plugins/yui/tabview-min.js"></script>
    <link rel="stylesheet" href="${contextPath}/assets/css/ljhy.css" />
    <link rel="stylesheet" href="${contextPath}/assets/css/font-awesome.min.css" />
    <style>
    	.close-tab{
    		color:#000
    	}
    	.close-tab:hover{
    		color:#ff0000
    	}
    	
    	.nav-my-tab{
    padding-left: 0px;
    margin-bottom: 0px;
}
.nav-my-tab .middletab{
    height: 36px;
    overflow: hidden;
    border-bottom: 3px #3498db solid;
    position: relative;
    background: #fafafa;
}
.nav-my-tab li{
    list-style-type: none;
}
.nav-my-tab li a{
    padding:5px 10px;
}
.nav-my-tab .leftbackward{
    float: left;
    background: #fff;
    padding-top: 7px;
    border-top: 1px #ddd solid;
    height:36px;
    border-bottom: 3px #3498db solid;
}
.nav-my-tab .leftbackward a{
    border-left-width: 0px;
    color: #999;
    padding-top: 9px;
    padding-bottom: 8px;
    margin-right: -1px;
}
.nav-my-tab .leftbackward a:hover,.nav-my-tab .leftbackward a:focus{
    text-decoration: none;
    background: #ddd;
}

.nav-my-tab .rightforward{
    float:right;
    position: relative;
    line-height: 2.6;
    background: #fff;
    border-top: 1px #ddd solid;
    border-bottom: 3px #3498db solid;
    
}
.nav-my-tab .rightforward a{
    width: 35.5px;
    line-height: 2;
    color: #999;
    height: 35px;
    padding: 8px 10px;
    padding-left: 13px;
    border-left: 1px #ddd solid;
}
.nav-my-tab .rightforward a:hover,.nav-my-tab .rightforward a:focus{
    text-decoration: none;
    background: #ddd;
}
    </style>
    <script type='text/javascript' charset='utf-8'>


        var tabView = new YAHOO.widget.TabView();
        var tabHeight;
        //最多打开tab个数
        var tabNum = 8;
        init = function()
        {
            tabView.appendTo('yuicontainer');
            addTab('0', '首页', 'ljhy_welcome.jsp');

        }

        addTab = function(id,label,src)
        {
            //同一菜单只允许打开一次,多次打开视为切换tab页
            for(var tabIndex=0;tabIndex<tabView.get("tabs").length;tabIndex++){
                var tab=tabView.getTab(tabIndex);
                if(tab.get("id")==id){
                    tabView.set('activeTab',tab,true);
                    return;
                }
            }

            //if(document.getElementById("iFrame"+id))
            //{
            //是否一个ID链接只能打开一个tab
            //}
            //判断是否tab个数达到限定个数

            if(tabView.get("tabs").length == tabNum)
            {
                if(!confirm("打开窗口个数已经达到"+tabNum+"个,新开窗口将会关闭第一个窗口,是否继续?"))
                {
                    return;
                }
                //删除第一个窗口
                tabView.removeTab(tabView.getTab("0"));
            }
            var labelText = label+" <i class='close-tab icon-ban-circle' id='close-tab_"+id+"''></i>";
            var content = '<div class="iframe_container"><div id="tobarDiv'+id+'" class="tobarDiv"></div><iframe class="tabFrame" id="iFrame'+id+'" name="iFrame'+id+'" frameBorder=0 scrolling="auto" width="100%" height="100%" resizeable="yes"  src="'+src+'"></iframe></div>';
            var tab = new YAHOO.widget.Tab({ label: labelText,content:content });
            tabView.addTab(tab);
            tabView.set('activeTab',tab,true);
            tab.set('title',label);
            tab.set("id",id);
            //tab.addListener('dblclick',dblClickEvent);
            var close_id = "close-tab_"+id;
            $("#"+close_id).click(function(){
           	 	closeTab(id);
            });
        }
        //双击TAB头关闭事件
        function dblClickEvent(e)
        {
            var tab=tabView.get('activeTab');
            var id=tab.get("id");
            document.getElementById("iFrame"+id).src="";
            tabView.removeTab(tab);
        }
		
        //获取当前TAB的resource_id
        function getResourceId()
        {
            if(tabView.get('activeTab'))
            {
                return tabView.get('activeTab').get("id");
            }
            else
            {
                return null;
            }

        }

        function setTobarDiv(id,content){
/*            var tobarDiv=document.getElementById("tobarDiv"+id);
            if(tobarDiv!=null&&tobarDiv){
                tobarDiv.innerHTML=content;
            }*/
        }

        /**
         * 关闭菜单
         * tabId
         */
        function closeTab(tabId)
        {
            for(var tabIndex=0;tabIndex<tabView.get("tabs").length;tabIndex++){
                var tab=tabView.getTab(tabIndex);
                if(tab.get("id")==tabId){
                    document.getElementById("iFrame"+tabId).src="";
                    tabView.removeTab(tab);
                    return;
                }
            }
        }


    </script>

</head>
<body onload="init();" style="margin:0;padding:0; background:#fff">

                              <div id="yuicontainer" ></div>


</body>
</html>