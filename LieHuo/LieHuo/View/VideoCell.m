//
//  VideoCell.m
//  Qihuo
//
//  Created by 顾海波 on 2018/2/15.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "VideoCell.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


@interface VideoCell ()

@property (nonatomic, strong) UIImageView *headerView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation VideoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.headerView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headerView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.titleLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = HBRGB(153, 153, 153);
        [self.contentView addSubview:self.timeLabel];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.headerView.frame = CGRectMake(10, 0, 90, 60);
    self.headerView.centerY = self.contentView.height * 0.5;
    
    CGFloat headerX = CGRectGetMaxX(self.headerView.frame) + 10;
    self.titleLabel.frame = CGRectMake(headerX, self.headerView.y - 10, self.contentView.width - headerX - 10, self.height * 0.6);
    
    self.timeLabel.frame = CGRectMake(self.titleLabel.x, CGRectGetMaxY(self.titleLabel.frame) - 10, self.titleLabel.width, self.contentView.height - CGRectGetMaxY(self.titleLabel.frame));
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    
    self.headerView.image = [UIImage imageNamed:imageName];
    
}

- (void)setTitle:(NSString *)title
{

    _title = title;
    self.titleLabel.text = title;
    
}

- (void)setTime:(NSString *)time
{
    
    _time = time;
    self.timeLabel.text = time;
    
    [self.timeLabel sizeToFit];
}

@end
