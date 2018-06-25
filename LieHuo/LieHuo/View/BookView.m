//
//  BookView.m
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/6/21.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "BookView.h"
#import "UIView+Extension.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]
#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

@interface BookView ()

@property (nonatomic, strong) UIImageView *bookImage;

@property (nonatomic, strong) UILabel *bookName;

@property (nonatomic, strong) UILabel *authName;

@end

@implementation BookView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bookImage = [[UIImageView alloc] init];
        [self addSubview:self.bookImage];
        
        self.bookName = [[UILabel alloc] init];
        self.bookName.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.bookName];
        
        self.authName = [[UILabel alloc] init];
        self.authName.font = [UIFont systemFontOfSize:12];
        self.authName.textColor = RGBCOLOR_HEX(0x666666);
        [self addSubview:self.authName];
    }
    return self;
}


- (void)setImageUrl:(NSString *)imageUrl
{
    
    _imageUrl = imageUrl;
    
    self.bookImage.image = [UIImage imageNamed:imageUrl];
    
    self.bookImage.frame = CGRectMake(0, 0, self.width, 150);

}

- (void)setBookname:(NSString *)bookname
{
    
    _bookname = bookname;
    
    self.bookName.text = bookname;
    [self.bookName sizeToFit];
    self.bookName.centerX = self.width * 0.5;
    self.bookName.y = CGRectGetMaxY(self.bookImage.frame) + 5;
}


- (void)setAuthname:(NSString *)authname
{
    
    _authname = authname;
    
    self.authName.text = authname;
    [self.authName sizeToFit];
    self.authName.centerX = self.width * 0.5;
    self.authName.y = CGRectGetMaxY(self.bookName.frame) + 5;
}

@end
