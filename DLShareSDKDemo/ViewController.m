//
//  ViewController.m
//  DLShareSDK
//
//  Created by 杭州东灵 on 16/6/17.
//  Copyright © 2016年 杭州东灵. All rights reserved.
//

#import "ViewController.h"
#import "DLShare.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) DLPlatformData *platformData;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *shareBtn = [[UIButton alloc] init];
    
    [shareBtn setTitle:@"share" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:shareBtn];
    [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(@100);
        make.height.equalTo(@50);
    }];

     [shareBtn addTarget:self action:@selector(shareBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)shareBtnClicked:(UIButton *)button {
    NSString *shareTitle = @"这是标题";
    NSString *shareText = @"这是描述";
    UIImage *shareImage = [UIImage imageNamed:@"set"];
    NSString *shareUrl = @"http://objccn.io/";
    float imageCompressionQuality = 0.5;
    
    DLSocialSnsService *socialSnsService = [[DLSocialSnsService alloc] init];
    
    [socialSnsService configureShareViewWithParams:[UIApplication sharedApplication].keyWindow shareTitle:shareTitle shareText:shareText shareImage:shareImage shareUrl:shareUrl shareImageCompressionQuality:imageCompressionQuality isTypeImage:YES];
}

#pragma mark - DLSocialSnsServiceControllerDelegate

- (void)selectSharePlatformFinished:(DLPlatformType)plateformType {
     [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cancle {
     [self dismissViewControllerAnimated:YES completion:nil];
}


@end
