//
//  DLSocialSnsService.m
//  DLShareSDK
//
//  Created by 杭州东灵 on 16/6/22.
//  Copyright © 2016年 杭州东灵. All rights reserved.
//

#import "DLSocialSnsService.h"

@implementation DLSocialSnsService

- (void)configureShareViewWithParams:(UIWindow*)keyWindow shareTitle:(NSString *)shareTitle shareText:(NSString *)shareText shareImage:(UIImage *)shareImage shareUrl:(NSString *)shareUrl shareImageCompressionQuality:(float)shareImageCompressionQuality isTypeImage:(BOOL)isTypeImage {
    //分享库调用
    DLShareView *shareView = [[DLShareView alloc] initWithFrame:keyWindow.bounds];
    
    shareView.alpha = 0.0;
    
    shareView.socialSnsData.shareTitle = shareTitle;
    shareView.socialSnsData.shareText = shareText;
    shareView.socialSnsData.shareImage = shareImage;
    shareView.socialSnsData.shareUrl = shareUrl;
    shareView.socialSnsData.shareImageCompressionQuality = shareImageCompressionQuality;
    shareView.socialSnsData.isTypeImage = isTypeImage;
    
    shareView.delegate = self;
    
    [keyWindow addSubview:shareView];
    
    [UIView animateWithDuration:0.5 animations:^{
        shareView.alpha = 1.0;
    }];
    //以上分享库的调用
}

#pragma mark - 选择分享方式代理

- (void)selectSharePlatformFinished:(DLPlatformType)plateformType {
    if ([self.delegate respondsToSelector:@selector(selectSharePlatformFinished:)]) {
        [self.delegate selectSharePlatformFinished:plateformType];
    }
}

#pragma mark - 取消选择代理

- (void)cancle {
    if ([self.delegate respondsToSelector:@selector(cancle)]) {
        [self.delegate cancle];
    }
}

@end
