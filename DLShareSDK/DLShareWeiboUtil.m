

#import "DLShareWeiboUtil.h"

@implementation DLShareWeiboUtil

- (void)shareToWeibo
{
    if (self.socialSnsData.isTypeImage) {
        WBMessageObject *messageObject =  [self MessageToShareTypeImage];
        [self shareToWeiboBase:messageObject];
    }
    else {
        WBMessageObject *messageObject =  [self messageToShare];
        [self shareToWeiboBase:messageObject];
    }
}

- (void)shareToWeiboBase:(WBMessageObject *)messageObject
{
    WBAuthorizeRequest *authRequest = [WBAuthorizeRequest request];
    authRequest.scope = @"all";
    
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:messageObject authInfo:authRequest access_token:nil];
    
    [WeiboSDK sendRequest:request];
}

- (WBMessageObject *)messageToShare
{
    
    WBMessageObject *message = [WBMessageObject message];
    BOOL hadInstalledWeibo = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weibo://"]];
    
    if(hadInstalledWeibo){
        WBWebpageObject *webpage = [WBWebpageObject object];
        webpage.objectID = @"identifier1";
        webpage.title = self.socialSnsData.shareTitle;
        webpage.description = self.socialSnsData.shareText;
        //  可改为自定义图片
        webpage.thumbnailData = UIImageJPEGRepresentation(self.socialSnsData.shareImage, self.socialSnsData.shareImageCompressionQuality);
        webpage.webpageUrl = self.socialSnsData.shareUrl;
        
        message.mediaObject = webpage;
    }
    
    message.text = [NSString stringWithFormat:@"%@ - %@ %@", self.socialSnsData.shareTitle, self.socialSnsData.shareText, self.socialSnsData.shareUrl];
    
    return message;
}

- (WBMessageObject *)MessageToShareTypeImage {
    WBImageObject *imageMessage = [[WBImageObject alloc] init];
    imageMessage.imageData = UIImageJPEGRepresentation(self.socialSnsData.shareImage, self.socialSnsData.shareImageCompressionQuality);
    
    WBMessageObject *messageObject = [WBMessageObject message];
    messageObject.text = self.socialSnsData.shareTitle;
    messageObject.imageObject = imageMessage;
    return messageObject;
}


+ (instancetype)sharedInstance
{
    
    static DLShareWeiboUtil* util;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        util = [[DLShareWeiboUtil alloc] init];
        
    });
    return util;
    
}

@end