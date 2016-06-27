
#import <Foundation/Foundation.h>

#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface DLSocialQQHandler : NSObject <QQApiInterfaceDelegate>

- (BOOL)handleOpenURL:(NSURL *)url;

/**
 设置分享到手机QQ和QQ空间的应用ID
 
 @param appId QQ互联应用Id
 */
+(void)setQQWithAppId:(NSString *)appId;

@end
