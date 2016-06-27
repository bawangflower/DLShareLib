
#import "DLShareView.h"

#import "DLShareCollectionCell.h"

#import "DLShareWeiboUtil.h"
#import "DLShareWechatUtil.h"
#import "DLShareQQUtil.h"

#import "Masonry.h"

@interface DLShareView () <UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic,strong) DLPlatformData *platformData;

@property (strong, nonatomic) UICollectionView *shareCollectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *collectionViewLayout;

@end

// 水平间隔
static const CGFloat itemHorPadding = 17.0;

static NSString * const KCellIdentifier = @"CellIdentifier";

#define WEAKSELF typeof(self) __weak weakSelf = self;

@implementation DLShareView

#pragma mark - lifeCycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureData];
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    //  背景色黑色半透明
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    
    //  点击关闭
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(clickClose)];
    [self addGestureRecognizer:tap];
    tap.delegate = self;
    
    _collectionViewLayout = [[UICollectionViewFlowLayout alloc]init];
    _collectionViewLayout.minimumInteritemSpacing = itemHorPadding;
    _collectionViewLayout.estimatedItemSize = CGSizeMake(50, 80);
    _collectionViewLayout.sectionInset = UIEdgeInsetsMake(0, 13, 0, 13);
     _collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _shareCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_collectionViewLayout];
    _shareCollectionView.dataSource = self;
    _shareCollectionView.delegate = self;
    _shareCollectionView.backgroundColor = [UIColor whiteColor];
    
    [_shareCollectionView registerClass:[DLShareCollectionCell class] forCellWithReuseIdentifier:KCellIdentifier];
    [self addSubview:_shareCollectionView];
    
    [self.shareCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@117);
        make.left.right.bottom.equalTo(self);
    }];

}

/**
 *  初始化数据
 */
- (void)configureData {
    _platformData = [[DLPlatformData alloc] init];
    
    _platformData.iconList = [[NSMutableArray alloc] init];
    _platformData.textList = [[NSMutableArray alloc] init];
    _platformData.platformTypeList = [[NSMutableArray alloc] init];
    
    /**
     *  判断应用是否安装，可用于是否显示
     *  QQ和Weibo分别有网页版登录与分享，微信目前不支持
     */
    BOOL hadInstalledWeixin = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]];
    
    if(hadInstalledWeixin){
        
        [_platformData.iconList addObject:@"icon_share_wechat"];
        [_platformData.iconList addObject:@"icon_share_moment"];
        [_platformData.textList addObject:NSLocalizedString(@"微信好友", nil)];
        [_platformData.textList addObject:NSLocalizedString(@"朋友圈", nil)];
        [_platformData.platformTypeList addObject:[NSNumber numberWithInteger:DLPlatformTypeWechat]];
        [_platformData.platformTypeList addObject:[NSNumber numberWithInteger:DLPlatformTypeWechatTimeline]];
    }
    
    [_platformData.iconList addObject:@"icon_share_qq"];
    [_platformData.iconList addObject:@"icon_share_qzone"];
    [_platformData.textList addObject:NSLocalizedString(@"QQ", nil)];
    [_platformData.textList addObject:NSLocalizedString(@"QQ空间", nil)];
    [_platformData.platformTypeList addObject:[NSNumber numberWithInteger:DLPlatformTypeTencent]];
    [_platformData.platformTypeList addObject:[NSNumber numberWithInteger:DLPlatformTypeQzone]];
    
    [_platformData.iconList addObject:@"icon_share_webo"];
    [_platformData.textList addObject:NSLocalizedString(@"微博", nil)];
    [_platformData.platformTypeList addObject:[NSNumber numberWithInteger:DLPlatformTypeSina]];

}

#pragma mark - User Interface

/**
 *  点击分享
 *
 *  @param shareText    文本
 *  @param shareImage   图像
 *  @param platformName 分享平台
 */
- (void)shareToPlatform:(DLPlatformType )platformName {
    
    self.socialSnsData.snsName = platformName;
    
    WEAKSELF
    switch (platformName) {
        case DLPlatformTypeSina:
            [weakSelf shareToWeibo:weakSelf.socialSnsData];
            break;
            
        case DLPlatformTypeTencent:
            [weakSelf shareToQQ:weakSelf.socialSnsData];
            break;
            
        case DLPlatformTypeQzone:
            [weakSelf shareToQzone:weakSelf.socialSnsData];
            break;
            
        case DLPlatformTypeWechat:
            [weakSelf shareToWeixinSession:weakSelf.socialSnsData];
            break;
            
        case DLPlatformTypeWechatTimeline:
            [weakSelf shareToWeixinTimeline:weakSelf.socialSnsData];
            break;
            
        default:
            break;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;
    }];
    
    if ([self.delegate respondsToSelector:@selector(selectSharePlatformFinished:)]) {
        [self.delegate selectSharePlatformFinished:platformName];
    }
}

- (void)shareToWeixinSession:(DLSocialSnsData *)SocialSnsData
{
    
    DLShareWechatUtil *util = [DLShareWechatUtil sharedInstance];
    util.socialSnsData = SocialSnsData;
    
    [util shareToWeixinSession];
    
}

- (void)shareToWeixinTimeline:(DLSocialSnsData *)SocialSnsData
{
    
    DLShareWechatUtil *util = [DLShareWechatUtil sharedInstance];
    util.socialSnsData = SocialSnsData;
    
    [util shareToWeixinTimeline];
    
}

- (void)shareToQQ:(DLSocialSnsData *)SocialSnsData
{
    DLShareQQUtil *util = [DLShareQQUtil sharedInstance];
    util.socialSnsData = SocialSnsData;

    [util shareToQQ];
}

- (void)shareToQzone:(DLSocialSnsData *)SocialSnsData
{
    DLShareQQUtil *util = [DLShareQQUtil sharedInstance];
    util.socialSnsData = SocialSnsData;

    [util shareToQzone];
}

- (void)shareToWeibo:(DLSocialSnsData *)SocialSnsData
{
    DLShareWeiboUtil *util = [DLShareWeiboUtil sharedInstance];
    util.socialSnsData = SocialSnsData;

    [util shareToWeibo];
    
}

/**
 *  暗色背景
 */
- (void)clickClose
{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;
    }];
    
    if ([self.delegate respondsToSelector:@selector(cancel)]) {
        [self.delegate cancle];
    }
}

#pragma mark - Collectionview Datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _platformData.iconList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DLShareCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KCellIdentifier forIndexPath:indexPath];
    
    [cell configureCellWithParams:_platformData.iconList[indexPath.row] text:_platformData.textList[indexPath.row]];
    
    return cell;
    
}

#pragma mark - Collectionview Delegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //分享库调用
    NSNumber *platformType = _platformData.platformTypeList[indexPath.row];
    
    [self shareToPlatform:platformType.integerValue];
}

#pragma mark - UIGestureRecognizerDelegate

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch

{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"DLShareView"]) {
        
        return YES;
    }
    
    return NO;
}


#pragma mark - Setters and Getters

- (DLSocialSnsData *)socialSnsData {
    if (!_socialSnsData) {
        _socialSnsData = [[DLSocialSnsData alloc] init];
    }
    return _socialSnsData;
}

@end
