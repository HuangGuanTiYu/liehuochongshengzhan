//
//  SettingCell.m
//  SchoolBus
//
//  Created by edz on 2017/3/30.
//  Copyright © 2017年 顾海波. All rights reserved.
//

#import "SettingCell.h"
#import "UIView+Extension.h"

@interface SettingCell()

//标题
@property(nonatomic, strong) UILabel *titleLabel;

//箭头
@property(nonatomic, strong) UIImageView *nextImage;

//分割线
@property(nonatomic, strong) UIView *divisionView;

@end

@implementation SettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLabel];
        
        self.nextImage = [[UIImageView alloc] init];
        self.nextImage.contentMode = UIViewContentModeCenter;
        self.nextImage.image = [UIImage imageNamed:@"ic_line_more"];
        [self.contentView addSubview:self.nextImage];
        
        self.divisionView = [[UIView alloc] init];
        [self.contentView addSubview:self.divisionView];
        
        self.cacheLabel = [[UILabel alloc] init];
        self.cacheLabel.font = [UIFont systemFontOfSize:14];
        self.cacheLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.cacheLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.nextImage.frame = CGRectMake(self.width - 13 - 15, 0, 13, 13);
    self.nextImage.centerY = self.height * 0.5;
    
    self.titleLabel.frame = CGRectMake(10, 0, self.width -  10 * 2, self.height);
    self.cacheLabel.frame = CGRectMake(self.width * 0.5, 0, self.width * 0.5 - 15, self.height);
    
    self.divisionView.frame = CGRectMake(0, self.contentView.height - 1, self.width, 1);
    
}
/*
 * 设置标题
 * title 标题
 */
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
    
    if ([title isEqualToString:@"清除缓存"]) {
        self.cacheLabel.hidden = NO;
        self.nextImage.hidden = YES;
        NSUInteger intg = 312;
        //
        NSString * currentVolum = [NSString stringWithFormat:@"%@",[self fileSizeWithInterge:intg]];
        self.cacheLabel.text = currentVolum;
    }else
    {
        self.cacheLabel.hidden = YES;
        self.nextImage.hidden = NO;
    }
}

//计算出大小
- (NSString *)fileSizeWithInterge:(NSInteger)size{
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024;
        return [NSString stringWithFormat:@"%.0fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fG",aFloat];
    }
}

@end
