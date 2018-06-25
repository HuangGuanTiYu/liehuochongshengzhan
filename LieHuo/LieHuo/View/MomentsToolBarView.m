//
//  momentsToolBarView.m
//  SoolyMomentCell
//
//  Created by SoolyChristina on 2016/11/25.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import "MomentsToolBarView.h"
#import "MomentViewModel.h"
#import "Moments.h"
#import "UIColor+HexString.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

#define circleCellToolBarTintColor [UIColor colorWithHexString:@"#ffffff"]              //工具条图标、字体颜色
#define circleCellToolBarTittleFont [UIFont systemFontOfSize:14]                        //工具条btn字号

@interface MomentsToolBarView ()<UIActionSheetDelegate>

@property (nonatomic ,weak) UIButton *likeBtn;
@property (nonatomic ,weak) UIButton *commentBtn;

@end

@implementation MomentsToolBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加子控件
        [self setChildView];
        self.layer.cornerRadius = 7.0;
        self.layer.masksToBounds = NO;
    }
    return self;
}

- (void)setChildView{
    self.backgroundColor = [UIColor whiteColor];
    //点赞
    UIButton *likeBtn = [[UIButton alloc] init];
    [likeBtn addTarget:self action:@selector(likeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [likeBtn setImage:[UIImage imageNamed:ImagePath(@"like@2x")] forState:UIControlStateNormal];
    [likeBtn setImage:[UIImage imageNamed:ImagePath(@"likeed@2x")] forState:UIControlStateSelected];
    [likeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    likeBtn.titleLabel.font = circleCellToolBarTittleFont;
    likeBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15);
    [self addSubview:likeBtn];
    self.likeBtn = likeBtn;
    
    //评论
    UIButton *commentBtn = [[UIButton alloc] init];
    [commentBtn addTarget:self action:@selector(commentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [commentBtn setTitle:@"举报" forState:UIControlStateNormal];
    [commentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    commentBtn.titleLabel.font = circleCellToolBarTittleFont;
    [self addSubview:commentBtn];
    self.commentBtn = commentBtn;
}

- (void)setMomentFrames:(MomentViewModel *)momentFrames{
    _momentFrames = momentFrames;
    self.likeBtn.frame = momentFrames.toolLikeFrame;
    [self.likeBtn setTitle:[NSString stringWithFormat:@" %@",momentFrames.moment.like_count] forState:UIControlStateNormal];
    
    self.commentBtn.frame = momentFrames.toolCommentFrame;
}

- (void) commentBtnClick
{
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"广告",@"不感兴趣",@"内容反感",nil];
    actionSheet.tag = 0;
    [actionSheet showInView:self];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 3) {
        return;
    }
}

- (void) likeBtnClick : (UIButton *) button
{
    
    button.selected = !button.selected;
    if (button.selected) {
        [self.likeBtn setTitle:[NSString stringWithFormat:@"%d",[self.likeBtn.titleLabel.text intValue] + 1] forState:UIControlStateNormal];
    }else
    {
        [self.likeBtn setTitle:[NSString stringWithFormat:@"%d",[self.likeBtn.titleLabel.text intValue] - 1] forState:UIControlStateNormal];
        
    }
}

@end

