//
//  HJTabBar.h
//
//
//  Created by http://weibo.com/hanjunzhao  on 16/01/04.
//  Copyright (c) 2016年  https://github.com/CoderHJZhao . All rights reserved.
//

#import "HJTabBar.h"
#import "HJTabBarController.h"
#import "UIView+Extension.h"

#define IphoneWidth [UIScreen mainScreen].bounds.size.width
#define IphoneHeight [UIScreen mainScreen].bounds.size.height

@interface HJTabBar()

@property (nonatomic, weak) UIButton *plusBtn;

@end

@implementation HJTabBar



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加一个按钮到tabbar中
        UIButton *plusBtn = [[UIButton alloc] init];
        plusBtn.size = CGSizeMake(IphoneWidth/5, 49);
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}

- (void)addImageName:(NSString *)imageName SelectedImageName:(NSString *)selectedImageName
{
    [self.plusBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.plusBtn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateHighlighted];

}
/**
 *  加号按钮点击
 */
- (void)plusClick
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置加号按钮的位置
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    
    // 2.设置其他tabbarButton的位置和尺寸
    CGFloat tabbarButtonW = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置宽度
            child.width = tabbarButtonW;
            // 设置x
            child.x = tabbarButtonIndex * tabbarButtonW;
            
            // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}



@end
