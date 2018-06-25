//
//  DCPageTopView.m
//  DCBooks
//
//  Created by cheyr on 2018/3/14.
//  Copyright © 2018年 cheyr. All rights reserved.
//

#import "DCPageTopView.h"
#import "SDAutoLayout.h"
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface DCPageTopView()
@property (nonatomic,strong) UIButton *backBtn;

@end

@implementation DCPageTopView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor darkGrayColor];
        [self setupUI];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backBtn.frame = CGRectMake(10, 0, 30, 30);
    self.backBtn.centerY = self.height * 0.5 + 10;

}
-(void)setupUI
{
    [self addSubview:self.backBtn];
}

-(void)back
{
    if([self.delegate respondsToSelector:@selector(backInDCPageTopView:)])
    {
        [self.delegate backInDCPageTopView:self];
    }
}
-(UIButton *)backBtn
{
    if(_backBtn == nil)
    {
        _backBtn = [[UIButton alloc]init];
        [_backBtn setImage:[UIImage imageNamed:ImagePath(@"icon_back")] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
@end
