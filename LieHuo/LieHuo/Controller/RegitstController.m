//
//  RegitstController.m
//  Qihuo
//
//  Created by 顾海波 on 2018/3/2.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "RegitstController.h"
#import "UIBarButtonItem+Extension.h"
#import "UITextField+Extension.h"
#import "OrangeButton.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface RegitstController ()

//手机号
@property(nonatomic, strong) UITextField *phoneNumber;

//密码
@property(nonatomic, strong) UITextField *password;

//密码
@property(nonatomic, strong) UITextField *password2;

@end

@implementation RegitstController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = HBRGB(245, 245, 245);
    self.title = @"注册";
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 150)];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    
    //手机号
    self.phoneNumber = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
    self.phoneNumber.placeholder = @"用户";
    self.phoneNumber.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:self.phoneNumber];
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.phoneNumber.frame), self.view.width, 1)];
    sepaView.backgroundColor = HBRGB(245, 245, 245);
    [headerView addSubview:sepaView];
    
    //密码
    self.password = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.phoneNumber.frame), self.view.width, 50)];
    self.password.font = [UIFont systemFontOfSize:15];
    self.password.placeholder = @"密码";
    [headerView addSubview:self.password];
    
    //密码
    self.password2 = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.password.frame), self.view.width, 50)];
    self.password2.font = [UIFont systemFontOfSize:15];
    self.password2.placeholder = @"确认密码";
    [headerView addSubview:self.password2];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_back@2x") target:self selector:@selector(back)];
    
    //设置左内边距
    [self.phoneNumber setLefSpacing:10];
    [self.password setLefSpacing:10];
    [self.password2 setLefSpacing:10];

    //登录
    OrangeButton *loginButton= [OrangeButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(0, CGRectGetMaxY(headerView.frame) + 50, self.view.width * 0.7, 40);
    loginButton.centerX = self.view.width * 0.5;
    loginButton.layer.cornerRadius = 20;
    loginButton.layer.masksToBounds = YES;
    [loginButton setTitle:@"注册" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}

- (void) back
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) loginButtonClick
{
    if ([self.firstViewControllerDelegate respondsToSelector:@selector(login:)]) {
        [self.firstViewControllerDelegate login:self.phoneNumber.text];
    }
    [self back];
}

@end
