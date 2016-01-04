//
//  HJTabBarController.h
//
//
//  Created by http://weibo.com/hanjunzhao  on 16/01/04.
//  Copyright (c) 2016年  https://github.com/CoderHJZhao . All rights reserved.
//

#import "HJTabBarController.h"
#import "HJTabBar.h"
#import <objc/runtime.h>

#define CFColor(r,g,b)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
@interface HJTabBarController () <UITabBarControllerDelegate>

@end

@implementation HJTabBarController



- (void)viewDidLoad {
    self.delegate = self;
    [super viewDidLoad];
 
    
}

- (void)setTabBarBackRoundImage:(UIImage *)tabBarBackRoundImage
{
    _tabBarBackRoundImage = tabBarBackRoundImage;
    self.tabBar.backgroundImage = [_tabBarBackRoundImage resizableImageWithCapInsets:UIEdgeInsetsMake(_tabBarBackRoundImage.size.height/2, _tabBarBackRoundImage.size.width/2, _tabBarBackRoundImage.size.height/2 - 1 , _tabBarBackRoundImage.size.width/2 - 1)];
   

}

- (void)setPresentVc:(UIViewController *)presentVc
{
    objc_setAssociatedObject(self, @selector(presentVc), presentVc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIViewController *)presentVc
{
    return objc_getAssociatedObject(self, @selector(presentVc));
}

- (void)tabBarPlusButtonImageName:(NSString *)imageName SelectedImageName:(NSString *)selectedImageName

{
 
    //更换系统自带的tabbar
    HJTabBar *tabBar = [[HJTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    [tabBar addImageName:imageName SelectedImageName:selectedImageName];

}

/** 添加控制器，设置tabbar的属性 */
- (void)addChildVc:(NSArray *)childVcs Titles:(NSArray *)titles TitleColor:(UIColor *)titleColor SelectedTitleColor:(UIColor *)selectedTitleColor ImageNames:(NSArray *)imageNames SelectedImageNames:(NSArray *)selectedImageNames HaveNavigationBar:(BOOL)haveNavigationBar
{
    for (NSInteger i=0; i<titles.count; i++) {
        UIViewController *childVc = childVcs[i];
        // 设置子控制器的图片
        childVc.tabBarItem.image = [UIImage imageNamed:imageNames[i]];
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageNames[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        // 设置文字的样式
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = titleColor;
        NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
        selectTextAttrs[NSForegroundColorAttributeName] = selectedTitleColor;
        [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
        [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
        
        [childVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
        
        // 设置子控制器的文字
        if (haveNavigationBar) {
            childVc.title = titles[i];

            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
            [self addChildViewController:nav];

        }
        else
        {
            childVc.tabBarItem.title = titles[i];
            [self addChildViewController:childVc];

        }

    }

}

#pragma mark - HJTabBarDelegate代理方法

- (void)tabBarDidClickPlusButton:(HJTabBar *)tabBar
{
    if (self.presentVc) {
        [self presentViewController:self.presentVc animated:YES completion:nil];

    }
    
}


@end
