//
//  OrangeButton.m
//  SchoolBus
//
//  Created by 顾海波 on 2017/3/25.
//  Copyright © 2017年 顾海波. All rights reserved.
//

#import "OrangeButton.h"
#import "UIImage+Extension.h"

#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

@implementation OrangeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage createImageWithColor:RGBCOLOR_HEX(0xFF5858)] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

@end
