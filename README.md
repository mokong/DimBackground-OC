# DimBackground-OC
DimBackgound OC
类似下图这样一个半透明效果的实现：
![image1.png](http://upload-images.jianshu.io/upload_images/1208479-15f3607b1fbd1617.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 起因：
我今天在推库上面闲逛的时候，看到了这样一篇文章[用 Swift 编写面向协议的视图](http://www.tuicool.com/articles/AzAZvqQ)，里面介绍的是一个颤动的效果，分别采用直接实现、category实现以及protocol extension实现，来表现swift面向协议的强大，推荐大家仔细看看。

在文章的末尾，附有一个链接，是[透明视图控制器及背景遮罩](http://www.totem.training/swift-ios-tips-tricks-tutorials-blog/ux-chops-dim-the-lights)，我点开看了一下，是一个采用protocol extension实现的类似图一的半透明的实现；只不过是swift的。

然后我仔细回想了一下，类似这种效果的需求在开发中不少，但是每次我实现都是自定义一个view然后用动画效果实现，现在想想这样不但繁琐，而且很low，有木有。

然后想想上面的那个实现，我把它翻译成OC的怎么样，能不能使用，OC里面是没有protocol extension的，那我就直接用category实现，至少比每次实现都重写方便。

then，here is the result.  [DimBackground-OC](https://github.com/mokong/DimBackground-OC)里面很简单，使用的时候只需要导入这两个文件，然后使用即可。
![image2.png](http://upload-images.jianshu.io/upload_images/1208479-b48961b1a633fd65.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**但是需要注意的是**，要present出来的那个界面，这个Presention必须设置为Over Current Context，这个默认的不是这个值，如果不修改的话，会发现最终显示出来的是黑色的背景，看不到背后的界面。
![image3.png](http://upload-images.jianshu.io/upload_images/1208479-725c7d1e70f81a0b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)