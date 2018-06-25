//
//  MineController.m
//  Qihuo
//
//  Created by 顾海波 on 2018/2/15.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import "MineController.h"
#import "VideoCell.h"
#import "MineCell.h"
#import "LoginController.h"
#import "HBNavigationController.h"
#import "FeedbackController.h"
#import "AboutController.h"
#import "SetUpController.h"
#import "RegitstController.h"
#import "UIView+Extension.h"

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]


@interface MineController ()<UITableViewDelegate, UITableViewDataSource, LoginControllerDelegate, RegitstControllerDelegate>

@property (nonatomic, strong) NSArray *icons;

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) UIView *sepaView;

@property (nonatomic, strong) UIButton *registButton;

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 70)];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.5, 30)];
    self.loginButton = loginButton;
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [loginButton setTitleColor:RGBCOLOR_HEX(0xFF5858) forState:UIControlStateNormal];
    loginButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    loginButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [headerView addSubview:loginButton];
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, 15)];
    self.sepaView = sepaView;
    sepaView.centerX = self.view.width * 0.5;
    sepaView.backgroundColor = [UIColor orangeColor];
    [headerView addSubview:sepaView];
    
    UIButton *registButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width * 0.5, 0, self.view.width * 0.5, 30)];
    self.registButton = registButton;
    [registButton addTarget:self action:@selector(registButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    registButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [registButton setTitleColor:RGBCOLOR_HEX(0xFF5858) forState:UIControlStateNormal];
    registButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    registButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [headerView addSubview:registButton];
    sepaView.centerY = loginButton.centerY = registButton.centerY = headerView.height * 0.5;

    loginButton.backgroundColor = registButton.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = HBRGB(242, 242, 242);
    tableView.y = CGRectGetMaxY(headerView.frame) + 10;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, headerView.width, 30)];
    self.nameLabel = nameLabel;
    nameLabel.centerY = registButton.centerY;
    nameLabel.textColor = RGBCOLOR_HEX(0xFF5858);
    nameLabel.font = [UIFont systemFontOfSize:25];
    [headerView addSubview:nameLabel];

    self.icons = @[ImagePath(@"ic_shouyi@2x"),ImagePath(@"ic_meibi@2x"),ImagePath(@"ic_xinxi@2x")];
    self.titles = @[@"意见反馈",@"关于我们",@"设置"];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cell";
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.icons = self.icons[indexPath.row];
    cell.titles = self.titles[indexPath.row];
    return cell;
}

- (void) loginButtonClick
{
    
    LoginController *vc = [[LoginController alloc] init];
    vc.firstViewControllerDelegate = self;
    [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
}

- (void)login:(NSString *)name
{
    
    self.loginButton.hidden = self.registButton.hidden = self.sepaView.hidden = YES;
    self.nameLabel.text = name;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失

    if (indexPath.row == 0) {
        FeedbackController *vc = [[FeedbackController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1) {
        AboutController *vc = [[AboutController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        SetUpController *vc = [[SetUpController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}

- (void) registButtonClick
{
    
    RegitstController *vc = [[RegitstController alloc] init];
    vc.firstViewControllerDelegate = self;
    [self presentViewController:[[HBNavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
}

@end
