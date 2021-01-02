# iOS转屏

## 参考

[https://www.jianshu.com/p/1993144ea35e](https://www.jianshu.com/p/1993144ea35e)


## 要点

事实上在这里我们要了解一个问题，就是关于横竖屏控制的优先级。对于限于VC范围来讲优先级最高的是当前的`window`的`rootViewController`，而往往我们的项目结构是容器视图控制器控制VC，`tabBarController`控制`navigationController`之后是VC，而横竖屏控制的优先级也是跟你的项目架构一样。而且是一旦优先级高的关闭了横竖屏配置，优先级低的无论如何配置都无法做到横竖屏。所以在你接受这个需求的时候，你需要看一下根视图的配置。

`general == appDelegate >> rootViewController >> nomalViewController`

当我们需要present VC的时候，除非我们指定了context，否则UIKit会优先选择presenting VC所属的容器类做为presentation context，如果没有容器类，那么会选择rootViewController。但是，UIKit搜索context的方式还与presented VC的modalPresentationStyle属性有关，当modalPresentationStyle为UIModalPresentationFullScreen、UIModalPresentationOverFullScreen等模式时，UIKit会直接选择rootViewController做为context。当modalPresentationStyle为UIModalPresentationOverCurrentContext、UIModalPresentationCurrentContext模式时，UIKit搜索context的方式如下：

UIModalPresentationOverCurrentContext、UIModalPresentationCurrentContext模式下，一个VC能否成为presentation context 是由VC的definesPresentationContext属性决定的，这是一个BOOL值，默认UIViewController的definesPresentationContext属性值是NO，而 container view controller的definesPresentationContext默认值是YES，这也是上文中，UIKit总是将container view controller做为presentation context的原因。如果我们想指定presenting VC做为context，只需要在presenting VC的viewDidLoad方法里添加如下代码即可：

```
self.definesPresentationContext = YES
```

> UIKit搜索presentation context的顺序为：
1. presenting VC
2. presenting VC 的父VC
3. presenting VC 所属的container VC
4. rootViewController

还有另外一种特殊情况，当我们在一个presented VC上再present一个VC时，UIKit会直接将这个presented VC做为presentation context。