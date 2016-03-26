# BearSkill纯代码搭建iOS界面

## 浅谈一下

关于iOS兼容布局一直都是开发者经常面对的问题，随着代码量的增加，很多人也有了一套自己的布局理论。本人也做了不少项目，开始用的Storyboard，xib，约束布局。因为是做的大多是应用型App，对于横竖屏的切换不是很多，所以约束的优点我们用的很少。 
随着项目变的越来越大，每次需求变动改动或者复用界面时都会有无必要的触碰到之前设置好的约束，结果很容易导致约束crash，布局乱的一塌糊涂，找了半天也不一定能完美解决反而经常浪费了不少时间。 
后来就开始基于约束布局的理念，自己整理了一套布局方式。并且整理了一些常用的布局方法，上传到自己的Pod里面。Pods里面还有一些其他方法，本文暂不讨论，只说布局这一块。

## BearSkill方法展示

BearSkillPod名称：BearSkill 
演示Demo下载地址：https://github.com/BearRan/BearSkillDemo 
关于布局的方法都在UIView+BearSet中

## 多个子类view布局方法

项目中经常会有多个子类view按照某个方向等间距布局这种情况。针对这种情况，特有如下四种方法。一切尽在gif和demo中，大家自己理解下。demo的界面上也有方法名称和适用场景说明。
`/**
 *  根据子view自动布局 自动计算:起始点，结束点，间距（三值相等）
 *  说明： 在父类view尺寸不等于需求尺寸时，会显示日志并且取消布局
 */
+ (void)BearAutoLayViewArray:(NSMutableArray *)viewArray layoutAxis:(kLAYOUT_AXIS)layoutAxis center:(BOOL)center;`
