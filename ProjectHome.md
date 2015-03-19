# 项目目的 #
  * 对Adobe\_ActionScript3\_samples进行汉化并进行适应FlashDevelop的改写与改造（以纯As3实现或者以Flex实现）。

# 编译说明 #
## Flash CS 环境 ##
  * 每个子项目中的.fla文件需要Flash CS环境，均在Flash CS4下进行了测试。直接打开src目录下的.fla文件就可以进行生成。

## FlashDevelop环境 ##
  * 测试用的版本是FlashDevelop([flashdevelop主页](http://www.flashdevelop.org/)）的版本3.0.6 RTM，安装FlashDevelop需要Microsoft .NET Framework 2.0 ([下载Microsoft .NET Framework 2.0 版可再发行组件包 (x86)](http://www.microsoft.com/downloads/details.aspx?FamilyID=0856EACB-4362-4B0D-8EDD-AAB15C5E04F5&displaylang=zh-cn))支持。你需要预先安装并且配置好FlashDevelop环境，特别是配置好Flex SDK（[Flex主页](http://opensource.adobe.com/wiki/display/flexsdk/Flex+SDK)）路径，这样才能正常的编译。
  * 部分项目需要用到FlSWC.swc文件，这类项目中在lib文件下有一个需要FlSWC.swc的说明（包含版本信息），但不放置FlSWC.swc文件，请自行下载并放置在lib下即可。

## 关于FlSWC.swc文件 ##
  * FlSWC.swc是as-form项目成果，其主页在[http://code.google.com/p/asform/](http://code.google.com/p/asform/)，下载地址是[http://asform.googlecode.com/files/FlSWC.swc](http://asform.googlecode.com/files/FlSWC.swc)。
  * 如果本地已经有一个FlSWC.swc副本，则编译用到FlSWC.swc的项目时可以在其FlashDevelop的AS3项目属性中的Compile Options下的SWC Libraies中添加外部FlSWC.swc文件路径信息即可，这样不必每个项目都保留一个FlSWC.swc的副本，从而节约空间，也方便版本维护。

# 当前子项目列表 #
  1. [HelloWorld](http://fld-as3-samples-cn.googlecode.com/files/HelloWorld.zip)：一个基础的项目
  1. [HelloWorldEnhanced](http://fld-as3-samples-cn.googlecode.com/files/HelloWorldEnhanced.zip)：基础项目的扩展（增加了文本输入以及键盘行为捕获处理）
  1. [SimpleClock](http://fld-as3-samples-cn.googlecode.com/files/SimpleClock.zip)：一个关于日期与时间的简单例子。
  1. [GeometricShapes](http://fld-as3-samples-cn.googlecode.com/files/GeometricShapes.zip)：一个AS3面向对象编程的实例。
  1. [AlarmClock](http://fld-as3-samples-cn.googlecode.com/files/AlarmClock.zip)：一个关于行为处理的例子。
  1. [ProjectionDragger](http://fld-as3-samples-cn.googlecode.com/files/ProjectionDragger.zip)：拖拽行为处理（注需要编译成flash10，fla也要flash10版本）
  1. [ReorderByZ](http://fld-as3-samples-cn.googlecode.com/files/ReorderByZ.zip)：3D效果例子（注需要编译成flash10，fla也要flash10版本）
  1. [ASCIIArt](http://fld-as3-samples-cn.googlecode.com/files/ASCIIArt.zip)：关于字符串的处理
  1. [PlayList](http://fld-as3-samples-cn.googlecode.com/files/PlayList.zip)：关于数组的处理
  1. [CustomErrors](http://fld-as3-samples-cn.googlecode.com/files/CustomErrors.zip)：关于错误的处理
  1. [NewsLayout](http://fld-as3-samples-cn.googlecode.com/files/NewsLayout.zip)：关于文本格式的处理
  1. [SpriteArranger](http://fld-as3-samples-cn.googlecode.com/files/SpriteArranger.zip)：关于显示的编程
  1. [AlgorithmicVisualGenerator](http://fld-as3-samples-cn.googlecode.com/files/AlgorithmicVisualGenerator.zip)：关于绘图API的例子
  1. [DisplayObjectTransformer](http://fld-as3-samples-cn.googlecode.com/files/DisplayObjectTransformer.zip)：处理几何结构的例子
  1. [FilterWorkbench](http://fld-as3-samples-cn.googlecode.com/files/FilterWorkbench.zip)：显示滤镜处理
  1. [RuntimeAssetsExplorer](http://fld-as3-samples-cn.googlecode.com/files/RuntimeAssetsExplorer.zip):处理影片剪辑
  1. [SpinningMoon](http://fld-as3-samples-cn.googlecode.com/files/SpinningMoon.zip):处理位图
  1. [VideoJukebox](http://fld-as3-samples-cn.googlecode.com/files/VideoJukebox.zip):关于视频的处理
  1. [PodcastPlayer](http://fld-as3-samples-cn.googlecode.com/files/PodcastPlayer.zip):关于声音的处理
  1. [RSSViewer](http://fld-as3-samples-cn.googlecode.com/files/RSSViewer.zip):关于XML的处理
  * 所有例子：详见[例子下载表](http://code.google.com/p/fld-as3-samples-cn/downloads/list)