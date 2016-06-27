
#import "DLShareQQUtil.h"

@implementation DLShareQQUtil

- (void)shareToQQ
{
    if (self.socialSnsData.isTypeImage) {
        [self shareToQQTypeImage];
    }
    else {
        [self shareToQQBase:SHARE_QQ_TYPE_SESSION];
    }
    
}

/**
 *  分享到QQ空间 url 
 */
- (void)shareToQzone
{
    [self shareToQQBase:SHARE_QQ_TYPE_QZONE];
}

/**
 *  分享到QQ会话 url
 */
- (void)shareToQQBase:(SHARE_QQ_TYPE)type
{
    NSString *utf8String = self.socialSnsData.shareUrl;
    NSString *theTitle = self.socialSnsData.shareTitle;
    NSString *description = self.socialSnsData.shareText;
    NSData *imageData = UIImageJPEGRepresentation(self.socialSnsData.shareImage, self.socialSnsData.shareImageCompressionQuality);
    
    QQApiNewsObject *newsObj = [QQApiNewsObject
                                objectWithURL:[NSURL URLWithString:utf8String]
                                title:theTitle
                                description:description
                                previewImageData:imageData];
    
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];
    
    if (type == SHARE_QQ_TYPE_SESSION) {
        
     [QQApiInterface sendReq:req];
        
    }else{
        
     [QQApiInterface SendReqToQZone:req];
        
    }
}

/**
 *  分享到QQ会话 纯图片
 */
- (void)shareToQQTypeImage {
    NSData *imageData = UIImageJPEGRepresentation(self.socialSnsData.shareImage, self.socialSnsData.shareImageCompressionQuality);
    QQApiImageObject *imgObj = [QQApiImageObject objectWithData:imageData
                                               previewImageData:imageData
                                                          title:self.socialSnsData.shareTitle
                                                    description:self.socialSnsData.shareText];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:imgObj];
    //将内容分享到qq
    [QQApiInterface sendReq:req];
}

+ (instancetype)sharedInstance
{
    static DLShareQQUtil* util;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        util = [[DLShareQQUtil alloc] init];
        
    });
    return util;

}

@end
