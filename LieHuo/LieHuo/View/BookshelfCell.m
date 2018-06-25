//
//  BookshelfCell.m
//  HBIOSFrame
//
//  Created by 顾海波 on 2018/4/19.
//  Copyright © 2018年 HB. All rights reserved.
//

#import "BookshelfCell.h"
#import "UIView+Extension.h"
#import "DCBookModel.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

@implementation BookshelfCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _topImage = [[UIImageView alloc] init];
        _topImage.userInteractionEnabled = YES;
        _topImage.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_topImage];
        
        _botlabel = [[UILabel alloc] init];
        _botlabel.textAlignment = NSTextAlignmentCenter;
        _botlabel.textColor = RGBCOLOR_HEX(0x555555);
        _botlabel.font = [UIFont systemFontOfSize:14];
        _botlabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_botlabel];
        
        _jindulabel = [[UILabel alloc] init];
        _jindulabel.textAlignment = NSTextAlignmentCenter;
        _jindulabel.font = [UIFont systemFontOfSize:12];
        _jindulabel.textColor = RGBCOLOR_HEX(0xFF5858);
        [self.contentView addSubview:_jindulabel];
        
        _selectedButton = [[UIButton alloc] init];
        _selectedButton.hidden = YES;
        [_selectedButton setImage:[UIImage imageNamed:ImagePath(@"ic_xuan_normal")] forState:UIControlStateNormal];
        [_selectedButton setImage:[UIImage imageNamed:ImagePath(@"ic_xuan_press")] forState:UIControlStateSelected];
        [_selectedButton addTarget:self action:@selector(_selectedButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_selectedButton];

    }
    return self;
}

- (void) _selectedButtonClick : (UIButton *) button
{
    
    button.selected = !button.selected;
    
    if (button.selected) {
        self.model.isXuanZhong = YES;
    }else
    {
        self.model.isXuanZhong = NO;
    }
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    _selectedButton.frame = CGRectMake(0, 0, 44, 44);
    _selectedButton.center = _topImage.center;
    
}


- (void)setModel:(DCBookModel *)model
{
    
    _model = model;
    
    self.topImage.image = [UIImage imageNamed:model.image];
    
    NSLog(@"model.image = %@", model.image);
    
    _topImage.frame = CGRectMake(0, 0, self.width, self.height * 0.7);

    _botlabel.text = model.name;
    [_botlabel sizeToFit];
    _botlabel.y = CGRectGetMaxY(_topImage.frame) + 10;
    _botlabel.centerX = self.width * 0.5;
    
    _jindulabel.text = @"未读";
    [_jindulabel sizeToFit];
    _jindulabel.y = CGRectGetMaxY(_botlabel.frame) + 5;
    _jindulabel.centerX = _botlabel.centerX;
    
    if (model.isBianji) {
        _selectedButton.hidden = NO;
    }else
    {
        _selectedButton.selected = NO;
        _selectedButton.hidden = YES;
    }
    }


@end
