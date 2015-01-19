<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%String path = request.getContextPath();
request.setAttribute("path",path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>"><title>My JSP 'robot.jsp' starting page</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js">
        </script>
        <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.js">
        </script>
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js">
        </script>
        <style>
            
            .g-bd {
                background: url("images/images_007.jpg") repeat-x scroll center top rgba(0, 0, 0, 0);
                overflow: hidden;
                width: 100%;
            }
            
            /**
             * 距离上面20
             */
            .m-pro-exp {
                height: 515px;
                margin-top: 20px;
                width: 985px;
            }
            
            /**
             * 居中
             */
            .center-block {
                display: block;
                margin-left: auto;
                margin-right: auto;
               /** background-color: blue;**/
            }
            
            /**
             * 左边竖直的图片
             */
            .m-pro-exp-l {
                background: url("images/images_009.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
                height: 515px;
                width: 23px;
                float: left;
                /**background-color:yellow;**/
            }
            
            /**
             * 中间竖着的背景图片
             */
            .m-pro-exp-mn {
                background: url("images/images_008.png") repeat-x scroll 0 0 rgba(0, 0, 0, 0);
                height: 515px;
                width: 800px;
                float: left;
            }
            
            /**
             *文字
             */
            .m-pro-exp-tt {
                font-size: 14px;
                line-height: 45px;
                margin-top: 10px;
                padding-left: 10px;
                margin-bottom: 10px;
                text-align: left;
            }
            
            /**
             * 文本框
             */
            #chat_message {
                overflow-x: hidden;;
                overflow-y: scroll;;
                padding-left: 1.5px;
                padding-top: 10px;
                position: relative;
                height: 100%;
                margin-left: -7px;
                max-height: 280px;
                min-height: 280px;
            }
			
			
			/**
			 * 每个文本的大小
			 */
             .tuling-mn {
                clear: both;
                margin-bottom: 11px;
                min-height: 33px;
            }
			
			/**
			 * 文本框格式
			 */
            .tulingLeft {
                background: none repeat scroll 0 0 #d0d7df;
                border-radius: 3px;
                color: #000;
                font-size: 12px;
                line-height: 25px;
                margin-top: 5px;
                max-width: 550px;
                min-width: 50px;
                padding-left: 12px;
                padding-right: 12px;
            }
			
            .tulingRight {
                background: none repeat scroll 0 0 #86d152;
    			color: #fff;
                font-size: 12px;
                line-height: 33px;
            }
			
            
            /**
             * 最下面输入框
             */
            .m-pro-exp-input {
                height: 120px;
                position: relative;
                top: 15px;
                width: 100%;
                /**background-color: red;**/
            }
            
            .input {
                float: left;
   				 height: 50px;
    			padding-right: 10px;
   				 position: relative;
   				 width: 90%;
            }
            
            .buttonMenu {
                float: right;
                height: 30px;
                margin-top: 20px;
                padding-right: 10px;
                position: relative;
                text-align: right;
            }
			
            .input textarea {
                border: 1px solid white;
                outline: :#a4c6fd dotted thick;;
			 	/** border: 1px solid #a4c6fd;**/
   				 height: 100px;
    			line-height: 30px;
   			 	overflow-y: hidden;
   				 resize: none;
   				 width: 100%;
            }
            .pull-right {
                float: right !important;
            }
			.pull-left {
			    float: left !important;
			}
        </style>
        <script type="text/javascript">
            $(function(){
                $("#query").on("click", function(){
                    getrobotData();
                })
                function getrobotData(){
                    var content = $("#content").val();
					
						var html="<div class=\"tuling-mn\">";
						    html+="<img src=\"images/proexp_014.jpg\" class=\"pull-right\">";
						    html+="<span class=\"pull-right tulingLeft tulingRight\">"+content+"</span>";
						    html+="";
						    html+="</div>";
                            $("#chat_message").append(html);
                    $("#content").val("");
                    $.ajax({
                        type: "get",//使用get方法访问后台
                        dataType: "json",////jquery调用servlert ajax返回json格式的数据.
                        url: "${path}/ggj/RobotServlet",//要访问的后台地址
                        data: "content=" + content,//要发送的数据
                        success: function(data){//msg为返回的数据，在这里做数据绑定
							var html="<div class=\"tuling-mn\">";
						    html+="<img src=\"images/proexp_011.jpg\" class=\"pull-left\">";
						    html+="<span class=\"pull-left tulingLeft\">"+data.text+"</span>";
						    html+="";
						    html+="</div>";
                            $("#chat_message").append(html);
                        },
                        complete: function(){//AJAX请求完成时隐藏loading提示
                        }
                    })
                }
                
            })
        </script>
    </head>
    <body>
        <div class="g-bd">
            <div class="center-block m-pro-exp">
                <div class="m-pro-exp-l">
                </div>
                <div class="m-pro-exp-mn">
                    <div class="m-pro-exp-tt">
                        <mark>
                      	      高广金测试机器人
                        </mark>
                    </div>
                    <div id="chat_message">
                    	<div class="tuling-mn">
                    		<img src="images/proexp_011.jpg" class="pull-left">
							<span class="pull-left tulingLeft">您好！</span>
                    	</div>
                    </div>
                    <div class="m-pro-exp-input">
                        <div class="input">
                            <textarea tabindex="1" id="content">
                            </textarea>
                        </div>
						<div class="buttonMenu">
								 <button class="btn btn-danger" id="query" >
							 		发送
							 	</button>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
