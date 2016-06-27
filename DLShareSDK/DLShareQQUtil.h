
#import <Foundation/Foundation.h>

#import "DLShareUtil.h"

#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
//  分享到QQ的类型
typedef NS_ENUM(NSInteger, SHARE_QQ_TYPE){
    
    //  QQ会话
    SHARE_QQ_TYPE_SESSION,
    
    //  QQ空间
    SHARE_QQ_TYPE_QZONE
    
};

@interface DLShareQQUtil : DLShareUtil

@property (nonatomic,copy) NSString *APP_KEY_QQ;

/**
 *  分享到QQ会话
 */
- (void)shareToQQ;

/**
 *  分享到QQ空间 
 */
- (void)shareToQzone;

+ (instancetype)sharedInstance;

@end
