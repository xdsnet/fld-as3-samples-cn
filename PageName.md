# 编译说明 #
## Flash CS 环境 ##
> 每个子项目中的.fla文件需要Flash CS环境，均在Flash CS4下进行了测试。直接打开src目录下的GeometricShapes.fla文件就可以进行生成。

## FlashDevelop环境 ##
> 测试用的版本是FlashDevelop([flashdevelop主页](http://www.flashdevelop.org/)）的版本3.0.6 RTM，安装FlashDevelop需要Microsoft .NET Framework 2.0 ([下载Microsoft .NET Framework 2.0 版可再发行组件包 (x86)](http://www.microsoft.com/downloads/details.aspx?FamilyID=0856EACB-4362-4B0D-8EDD-AAB15C5E04F5&displaylang=zh-cn))支持。你需要预先安装并且配置好FlashDevelop环境，特别是配置好Flex SDK（[Flex主页](http://opensource.adobe.com/wiki/display/flexsdk/Flex+SDK)）路径，这样才能正常的编译。

> 部分项目需要用到FlSWC.swc文件，这类项目中在lib文件下有一个需要FlSWC.swc的说明（包含版本信息），但不放置FlSWC.swc文件，请自行下载并放置在lib下即可。

## 关于FlSWC.swc文件 ##
> FlSWC.swc是as-form项目成果，其主页在[http://code.google.com/p/asform/](http://code.google.com/p/asform/)，下载地址是[http://asform.googlecode.com/files/FlSWC.swc](http://asform.googlecode.com/files/FlSWC.swc)。