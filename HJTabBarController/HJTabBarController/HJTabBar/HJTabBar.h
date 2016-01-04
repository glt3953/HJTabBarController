//
//  HJTabBar.h
//
//
//  Created by http://weibo.com/hanjunzhao  on 16/01/04.
//  Copyright (c) 2016年  https://github.com/CoderHJZhao . All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJTabBar;

#warning 因为MFTabBar继承自UITabBar，所以称为HWTabBar的代理，也必须实现UITabBar的代理协议

@protocol HJTabBarDelegate <UITabBarDelegate>

@optional

- (void)tabBarDidClickPlusButton:(HJTabBar *)tabBar;

@end

@interface HJTabBar : UITabBar

- (void)addImageName:(NSString *)imageName SelectedImageName:(NSString *)selectedImageName;

@property (nonatomic, weak) id<HJTabBarDelegate> delegate;

@end
