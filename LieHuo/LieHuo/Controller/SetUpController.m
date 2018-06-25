//
//  SetUpController.m
//  SchoolBus
//
//  Created by edz on 2017/3/30.
//  Copyright © 2017年 顾海波. All rights reserved.
//

#import "SetUpController.h"
#import "SettingCell.h"
#import "UIView+Extension.h"

@interface SetUpController ()<UITableViewDelegate, UITableViewDataSource>

//标题数组
@property(nonatomic, strong) NSArray *titles;

@end

@implementation SetUpController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpData];

    [self setUpUI];
}

#pragma mark 初始化数据
- (void) setUpData
{
    self.titles = @[@"清除缓存"];
}

#pragma mark 初始化UI
- (void) setUpUI
{

    self.title = @"设置";
    
    //列表
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"SettingCell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.title = self.titles[indexPath.row + (indexPath.section * 2)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.cacheLabel.text = @"0B";
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
}

#pragma mark 行个数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;//section头部高度
}

#pragma mark section尾部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 78.0f;
}

#pragma mark 行高
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 78)];
        UIButton *logout = [[UIButton alloc] initWithFrame:CGRectMake(0, 30, footerView.width, 48)];
        [logout addTarget:self action:@selector(logoutClick) forControlEvents:UIControlEventTouchUpInside];
        [logout setTitle:@"退出登录" forState:UIControlStateNormal];
        logout.titleLabel.textAlignment = NSTextAlignmentCenter;
        logout.backgroundColor = [UIColor redColor];
        [logout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        logout.titleLabel.font = [UIFont systemFontOfSize:16];
        [footerView addSubview:logout];
        return footerView;
    }
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectZero];
    return footerView;
}

#pragma mark 退出登录
- (void) logoutClick
{
   
    
}

@end
