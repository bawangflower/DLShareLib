
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DLPlatformData.h"

/**
 设置分平台对应内容的基类
 
 */
@interface DLSocialSnsData : NSObject

/**
 平台名
 
 */
@property (nonatomic, assign) DLPlatformType snsName;

/**
 分享标题
 
 */
@property (nonatomic, copy) NSString *shareTitle;

/**
 分享内容
 
 */
@property (nonatomic, copy) NSString *shareText;

/**
 分享图片
 
 */
@property (nonatomic, strong) UIImage *shareImage;

/**
 分享链接
 
 */
@property (nonatomic, copy) NSString *shareUrl;

/**
图片压缩系数
 
 */
@property (nonatomic, assign) float shareImageCompressionQuality;

/**
 *  是否纯图片
 */
@property (nonatomic, assign) BOOL isTypeImage;

@end
