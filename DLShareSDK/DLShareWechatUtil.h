
#import <Foundation/Foundation.h>

#import "DLShareUtil.h"
#import "Weixin/WXApi.h"

@interface DLShareWechatUtil : DLShareUtil

@property (nonatomic, copy) NSString *APP_KEY_WEIXIN;

/**
 *  分享到微信会话
 */
- (void)shareToWeixinSession;

/**
 *  分享到朋友圈
 */
- (void)shareToWeixinTimeline;

+ (instancetype)sharedInstance;

@end
