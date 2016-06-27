//
//  DLPlatformData.h
//  DLShareSDK
//
//  Created by 杭州东灵 on 16/6/21.
//  Copyright © 2016年 杭州东灵. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  分享平台标识
 */
typedef NS_ENUM(NSUInteger,DLPlatformType) {
    /**
     *  新浪微博
     */
    DLPlatformTypeSina = 100,
    /**
     *  QQ好友
     */
    DLPlatformTypeTencent = 101,
    /**
     *  QQ空间
     */
    DLPlatformTypeQzone = 102,
    /**
     *  微信好友
     */
    DLPlatformTypeWechat = 103,
    /**
     *  微信朋友圈
     */
    DLPlatformTypeWechatTimeline = 104
};

@interface DLPlatformData : NSObject

@property (nonatomic, strong) NSMutableArray *iconList;

@property (nonatomic, strong) NSMutableArray *textList;

@property (nonatomic, strong) NSMutableArray *platformTypeList;

@end
