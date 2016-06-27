//
//  AppDelegate.m
//  DLShareSDK
//
//  Created by 杭州东灵 on 16/6/17.
//  Copyright © 2016年 杭州东灵. All rights reserved.
//

#import "AppDelegate.h"

#import "DLShare.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSString *APP_KEY_QQ = @"222222";
    NSString *APP_KEY_WEIBO = @"2045436852";
    NSString *APP_KEY_WEIXIN = @"wxd930ea5d5a258f4f";

    [DLSocialQQHandler setQQWithAppId:APP_KEY_QQ];
    [DLSocialSinaHandler openNewSinaWithAppKey:APP_KEY_WEIBO];
    [DLSocialWechatHandler setWXAppId:APP_KEY_WEIXIN];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([[url absoluteString] hasPrefix:@"tencent"]) {
        DLSocialQQHandler *QQHandler = [[DLSocialQQHandler alloc] init];
        return [QQHandler handleOpenURL:url];
        
    }else if([[url absoluteString] hasPrefix:@"wb"]) {
        DLSocialSinaHandler *sinaHandler = [[DLSocialSinaHandler alloc] init];
        return [sinaHandler handleOpenURL:url];
        
    }else if([[url absoluteString] hasPrefix:@"wx"]) {
        DLSocialWechatHandler *wechatHandler = [[DLSocialWechatHandler alloc] init];
        return [wechatHandler handleOpenURL:url];
    }
    
    return NO;
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
