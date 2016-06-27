

#import <Foundation/Foundation.h>

#import "DLShareUtil.h"

#import "weiboSDK/WeiboSDK.h"

@interface DLShareWeiboUtil : DLShareUtil

@property (nonatomic, copy) NSString *APP_KEY_WEIBO;

/**
 *  分享到微博
 */
- (void)shareToWeibo;

+ (instancetype)sharedInstance;

@end
