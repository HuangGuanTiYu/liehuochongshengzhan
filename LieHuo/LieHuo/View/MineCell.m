//
//  MineCell.m
//  XiuMei
//
//  Created by edz on 2017/11/18.
//  Copyright © 2017年 xiuMie. All rights reserved.
//

#import "MineCell.h"
#import "UIView+Extension.h"
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface MineCell()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *nextImage;

@end

@implementation MineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconView];

        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.titleLabel];
        
        self.nextImage = [[UIImageView alloc] init];
        self.nextImage.image = [UIImage imageNamed:ImagePath(@"ic_next@2x")];
        [self.contentView addSubview:self.nextImage];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.nextImage.frame = CGRectMake(self.contentView.width - 30, 0, 20, 20);
    self.nextImage.centerY = self.height * 0.5;
    
    self.iconView.frame = CGRectMake(10, 0, 30, 30);
    self.iconView.centerY = self.height * 0.5;
    
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.iconView.frame) + 10, 0, self.nextImage.x - CGRectGetMaxX(self.iconView.frame) - 2 * 10, self.height);
}

- (void)setIcons:(NSString *)icons
{

    _icons = icons;
    
    [self.iconView setImage:[UIImage imageNamed:icons]];
}

- (void)setTitles:(NSString *)titles
{

    _titles = titles;
    
    self.titleLabel.text = titles;
}

@end
