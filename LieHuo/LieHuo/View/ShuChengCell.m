//
//  ShuChengCell.m
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/6/21.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "ShuChengCell.h"
#import "UIView+Extension.h"
#import "ShuChengModel.h"

#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

@interface ShuChengCell()

@property(nonatomic, strong) UIImageView *iconImage;

//标题
@property(nonatomic, strong) UILabel *titleLabel;

//分割线
@property(nonatomic, strong) UILabel *contentLabel;

@property(nonatomic, strong) UILabel *authLabel;


@end

@implementation ShuChengCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.titleLabel];
        
        self.iconImage = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconImage];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.contentLabel];
        
        self.authLabel = [[UILabel alloc] init];
        self.authLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.authLabel];
        
        self.contentLabel.textColor = self.authLabel.textColor = RGBCOLOR_HEX(0x666666);

    }
    return self;
}

- (void)setModel:(ShuChengModel *)model
{
    
    _model = model;
    
    self.iconImage.image = [UIImage imageNamed:model.imageUrl];
    self.iconImage.frame = CGRectMake(10, 10, 83, 106);

    self.titleLabel.text = model.title;
    [self.titleLabel sizeToFit];
    self.titleLabel.x = CGRectGetMaxX(self.iconImage.frame) + 5;
    self.titleLabel.y = 10;
    
    self.contentLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImage.frame) + 5, CGRectGetMaxY(self.titleLabel.frame) + 5, self.width - CGRectGetMaxX(self.iconImage.frame) - 15, 100);
    self.contentLabel.text = model.contentString;
    self.contentLabel.numberOfLines = 3;
    [self.contentLabel sizeToFit];

    self.authLabel.text = [NSString stringWithFormat:@"作者：%@",model.auth];
    [self.authLabel sizeToFit];
    self.authLabel.x = CGRectGetMaxX(self.iconImage.frame) + 5;
    self.authLabel.y = CGRectGetMaxY(self.contentLabel.frame) + 5;
}


@end
