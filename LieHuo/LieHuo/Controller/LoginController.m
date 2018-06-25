//
//  LoginController.m
//  Qihuo
//
//  Created by 顾海波 on 2018/3/2.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "LoginController.h"
#import "UIBarButtonItem+Extension.h"
#import "UITextField+Extension.h"
#import "OrangeButton.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface LoginController ()

//手机号
@property(nonatomic, strong) UITextField *phoneNumber;

//密码
@property(nonatomic, strong) UITextField *password;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = HBRGB(245, 245, 245);
    self.title = @"登录";
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 100)];
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
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_back@2x") target:self selector:@selector(back)];

    //设置左内边距
    [self.phoneNumber setLefSpacing:10];
    [self.password setLefSpacing:10];
    
    //登录
    OrangeButton *loginButton= [OrangeButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(0, CGRectGetMaxY(headerView.frame) + 50, self.view.width * 0.7, 40);
    loginButton.centerX = self.view.width * 0.5;
    loginButton.layer.cornerRadius = 20;
    loginButton.layer.masksToBounds = YES;
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}

- (void) loginButtonClick
{
    if ([self.firstViewControllerDelegate respondsToSelector:@selector(login:)]) {
        [self.firstViewControllerDelegate login:self.phoneNumber.text];
    }
    [self back];
}

- (void) back
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
