//
//  DLSocialSnsService.h
//  DLShareSDK
//
//  Created by 杭州东灵 on 16/6/22.
//  Copyright © 2016年 杭州东灵. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DLShareView.h"

@protocol DLSocialSnsServiceControllerDelegate <NSObject>

- (void)selectSharePlatformFinished:(DLPlatformType)plateformType;

- (void)cancle;

@end

@interface DLSocialSnsService : NSObject <DLShareViewDelegate>//WeiboSDKDelegate,QQApiInterfaceDelegate

@property (weak,nonatomic) id<DLSocialSnsServiceControllerDelegate> delegate;

/**
 *  设置分享弹框并弹出
 *
 *  @param keyWindow                    keyWindow
 *  @param shareTitle                   主题
 *  @param shareText                    描述
 *  @param shareImage                   图像 UIImage格式
 *  @param shareUrl                     链接
 *  @param shareImageCompressionQuality 图像压缩质量
 *  @param isTypeImage                  是否纯图片分享方式
 */
- (void)configureShareViewWithParams:(UIWindow *)keyWindow
                shareTitle:(NSString *)shareTitle
                 shareText:(NSString *)shareText
                shareImage:(UIImage *)shareImage
                  shareUrl:(NSString *)shareUrl
shareImageCompressionQuality:(float)shareImageCompressionQuality isTypeImage:(BOOL)isTypeImage;

@end
