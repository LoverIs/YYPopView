//
//  AppDelegate.m
//  YYPopView
//
//  Created by yangli on 16/5/29.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "AppDelegate.h"
#import "YYTestController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    YYTestController *testVc = [[YYTestController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = testVc;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
