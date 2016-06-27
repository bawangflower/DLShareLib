
#import "DLSocialSnsData.h"

@protocol DLShareViewDelegate <NSObject>

- (void)selectSharePlatformFinished:(DLPlatformType)plateformType;

- (void)cancle;

@end

@interface DLShareView : UIView

@property (weak,nonatomic) id<DLShareViewDelegate> delegate;

@property (nonatomic,strong) DLSocialSnsData *socialSnsData;

@end

