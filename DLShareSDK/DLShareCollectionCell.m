//
//  ShareCollectionCell.m
//  DLShareSDK
//
//  Created by 杭州东灵 on 16/6/21.
//  Copyright © 2016年 杭州东灵. All rights reserved.
//

#import "DLShareCollectionCell.h"

#import "Masonry.h"

@interface DLShareCollectionCell ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation DLShareCollectionCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    
    _imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageView];

    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.right.equalTo(self.contentView);
        
    }];
    
    _textLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_textLabel];
    
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(_imageView.mas_bottom).offset(5);
        make.bottom.equalTo(self.contentView);
    }];
    
}

- (void)configureCellWithParams:(NSString *)icon text:(NSString *)text {
    _imageView.image = [UIImage imageNamed:icon];
    _textLabel.text = text;
    _textLabel.textColor = [UIColor blackColor];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.font = [UIFont systemFontOfSize:14];
}

@end
