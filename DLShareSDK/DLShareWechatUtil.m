

#import "DLShareWechatUtil.h"

@implementation DLShareWechatUtil

/**
 *  分享到微信好友
 */
- (void)shareToWeixinSession
{
    if (self.socialSnsData.isTypeImage) {
        [self shareToWeixinTypeImage:WXSceneSession];
    }
    else {
        [self shareToWeixinBase:WXSceneSession];
    }
}

/**
 *  分享到微信朋友圈
 */
- (void)shareToWeixinTimeline
{
    if (self.socialSnsData.isTypeImage) {
        [self shareToWeixinTypeImage:WXSceneTimeline];
    }
    else {
        [self shareToWeixinBase:WXSceneTimeline];
    }

}

- (void)shareToWeixinBase:(enum WXScene)scene
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = self.socialSnsData.shareTitle;
    message.description = self.socialSnsData.shareText;
    [message setThumbImage:self.socialSnsData.shareImage];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = self.socialSnsData.shareUrl;
    
    message.mediaObject = ext;
    message.mediaTagName = @"WECHAT_TAG_JUMP_SHOWRANK";
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    [WXApi sendReq:req];
    
}

/**
 *  纯图片分享
 *
 *  @param scene 分享场景
 */
- (void)shareToWeixinTypeImage:(enum WXScene)scene
{
    WXImageObject *imageObject = [WXImageObject object];
    imageObject.imageData = UIImageJPEGRepresentation(self.socialSnsData.shareImage, self.socialSnsData.shareImageCompressionQuality);
    
    WXMediaMessage *message = [WXMediaMessage message];
    message.mediaObject = imageObject;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    [WXApi sendReq:req];
    
}

+ (instancetype)sharedInstance
{
    
    static DLShareWechatUtil* util;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        util = [[DLShareWechatUtil alloc] init];
        
    });
    return util;
    
}

@end
