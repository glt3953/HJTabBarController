# HJTabBarController 【UITabBarController简单封装】

简单易上手的UITabBarController的封装，支持自定义新浪微博中间的加号按钮


##导航

导入头文件

 ```Objective-C
#import "HJTabBarController.h"
 ```

两个可供调用的方法：

 ```Objective-C
/** 添加控制器，设置tabbar的属性 */
- (void)addChildVc:(NSArray *)childVcs Titles:(NSArray *)titles TitleColor:(UIColor *)titleColor SelectedTitleColor:(UIColor *)selectedTitleColor ImageNames:(NSArray *)imageNames SelectedImageNames:(NSArray *)selectedImageNames HaveNavigationBar:(BOOL)haveNavigationBar;

/** 添加中间加号按钮（可按需求定义成其他功能的按钮）） */
- (void)tabBarPlusButtonImageName:(NSString *)imageName SelectedImageName:(NSString *)selectedImageName;
 ```
 
两个可供设置的属性

 ```Objective-C
/** 设置点击加号按钮 present 出来的控制器*/
@property (nonatomic, strong) UIViewController *presentVc;
 ```
```Objective-C
/** tabBar背景图片，没有则不用设置*/
@property (nonatomic, strong) UIImage *tabBarBackRoundImage;
```
 
具体效果大家可以下载Demo观看，谢谢大家！

（更多iOS开发干货，欢迎关注  [微博@3W_狮兄 ](http://weibo.com/hanjunzhao/) ）

----------
Posted by  [微博@3W_狮兄 ](http://weibo.com/hanjunzhao/))  
原创文章，版权声明：自由转载-非商用-非衍生-保持署名 | 

