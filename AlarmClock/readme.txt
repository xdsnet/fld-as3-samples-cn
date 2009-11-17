说明
---------------------------------------------------------------------
目录
0.版本&作者
1.概述
2.关于环境

---------------------------------------------------------------------
0.版本&作者
		版本 : 1.0.0 (2009.11.17)
		原始例子的编写 : Adobe公司
		FLSWC.swc : ezhung
		本例汉化及改写 : xdsnet (xdsnet@gmail.com)


1.概述
        这个例子来源于Programming_ActionScript3.0_samples.zip(下载地
	址http://www.adobe.com/cn/devnet/flash/)中的例子AlarmClock，
	原始例子是只能在Flash CS环境中使用，我进行了汉化和适应FlashDevelop
	的改写，保留了原始的fla文件。
	    这个例子主要用于练习自定义类的使用，是一个关于行为处理的例子。
	
2.关于环境
2.1 Flash CS 环境
		需要Flash CS环境，在Flash CS4下进行了测试。
		直接打开src目录下的AlarmClock.fla文件就可以进行生成。

2.2 FlashDevelop环境
		测试用的版本是FlashDevelop 3.0.6 RTM，安装FlashDevelop需要
	.Net2 运行时支持。你需要预先安装并且配置好FlashDevelop环境，特别是
	配置好Flex SDK路径，这样才能正常的编译。
		GeometricShapes.as3proj是FlashDevelop工程文件，是一个AS3工程。
		编译中使用了FlSWC.swc这个外部库，其来源于asform项目(actionscript3
	form-like framework)，其主页为http://code.google.com/p/asform/。	
	
