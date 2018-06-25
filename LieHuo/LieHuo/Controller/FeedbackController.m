//
//  FeedbackController.m
//  SchoolBus
//
//  Created by edz on 2017/4/6.
//  Copyright © 2017年 顾海波. All rights reserved.
//

#import "FeedbackController.h"
#import "OrangeButton.h"
#import "UITextView+Placeholder.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


@interface FeedbackController ()<UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextViewDelegate>

//图片数组
@property(nonatomic, strong) NSMutableArray *photos;

//删除按钮数组
@property(nonatomic, strong) NSMutableArray *buttons;

//图片长宽
@property(nonatomic, assign) CGFloat photoW;

//添加图片区域
@property(nonatomic, strong) UIView *photoView;

//添加图标
@property(nonatomic, strong) UIButton *addImageView;

//tag
@property(nonatomic, assign) int photoTag;

//输入框
@property(nonatomic, strong) UITextView *textView;

//图片URL数组
@property(nonatomic, strong) NSMutableArray *imageUrls;
    
//提交按钮
@property(nonatomic, strong) OrangeButton * commit;

@end

@implementation FeedbackController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.photos = [NSMutableArray array];
    self.buttons = [NSMutableArray array];
    self.imageUrls = [NSMutableArray array];
    
    [self setUpUI];
    
}

#pragma mark 初始化UI
- (void) setUpUI
{
    
    self.title = @"意见反馈";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //输入框
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.textView.delegate = self;
    self.textView.height = self.view.height * 0.5;
    self.textView.placeholder = @"请输入您的意见反馈,以帮助我们做的更好!";
    self.textView.font = [UIFont systemFontOfSize:14];
    self.textView.placeholderLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.textView];
    
    //分割线
    UIView *divisionView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textView.frame) - 1,  self.view.width, 1)];
    divisionView.backgroundColor = HBRGB(245, 245, 245);
    [self.view addSubview:divisionView];
    
    //提交
    self.commit = [OrangeButton buttonWithType:UIButtonTypeCustom];
    self.commit.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.commit addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
    self.commit.frame = CGRectMake(0, CGRectGetMaxY(self.textView.frame) + 50, self.view.width * 0.8, 50);
    self.commit.layer.cornerRadius = 25;
    self.commit.layer.masksToBounds = YES;
    self.commit.centerX = self.view.width * 0.5;
    [self.commit setTitle:@"提交" forState:UIControlStateNormal];
    [self.commit addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.commit];
}

#pragma mark 提交
- (void) commitClick
{
   
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:YES];
}

@end
