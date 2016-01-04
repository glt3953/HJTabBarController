//
//  AppDelegate.m
//  HJTabBarController
//
//  Created by ZhaoHanjun on 16/1/4.
//  Copyright © 2016年 https://github.com/CoderHJZhao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TwoViewController.h"
#import "HJTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //初始化各个控制器
    ViewController *v1 = [[ViewController alloc] init];
    TwoViewController *v2 = [[TwoViewController alloc] init];
    ViewController *v3 = [[ViewController alloc] init];
    TwoViewController *v4 = [[TwoViewController alloc] init];
    TwoViewController *v5 = [[TwoViewController alloc] init];
    v5.view.backgroundColor = [UIColor blueColor];
    
    //初始化tabBarCController
    HJTabBarController *tabBarVc = [[HJTabBarController alloc] init];
    //设置tabBarCController的基本属性
    [tabBarVc addChildVc:@[v1,v2,v3,v4] Titles:@[@"消息",@"联系人",@"发现",@"我的"] TitleColor:[UIColor lightGrayColor] SelectedTitleColor:[UIColor brownColor] ImageNames:@[@"tabbar_mainframe",@"tabbar_contacts",@"tabbar_discover",@"tabbar_me"] SelectedImageNames:@[@"tabbar_mainframeHL",@"tabbar_contactsHL",@"tabbar_discoverHL",@"tabbar_meHL"] HaveNavigationBar:YES];
     //设置tabBarCController的中间按钮
    [tabBarVc tabBarPlusButtonImageName:@"tabbar_discover" SelectedImageName:@"tabbar_discover"];
    //设置tabBarCController的中背景图片
    tabBarVc.tabBarBackRoundImage = [UIImage imageNamed:@"tabbarBkg"];
    //设置点击中间按钮present出来的控制器
    tabBarVc.presentVc = v5;
    self.window.rootViewController = tabBarVc;
    
    
    
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
