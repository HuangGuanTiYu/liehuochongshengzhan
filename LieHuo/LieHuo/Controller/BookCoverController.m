//
//  BookCoverController.m
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/5/4.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "BookCoverController.h"
#import "DCBookModel.h"
#import "DCPageVC.h"

@interface BookCoverController ()

@end

@implementation BookCoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *iamgeView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    iamgeView.userInteractionEnabled = YES;
    [iamgeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iamgeViewClick)]];
    iamgeView.image = [UIImage imageNamed:self.imageName];
    [self.view addSubview:iamgeView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];

}

- (void) iamgeViewClick
{
    
    DCBookModel *book = self.books[self.row];
    DCPageVC *vc = [[DCPageVC alloc]init];
    vc.filePath = book.path;
    vc.name = book.name;
    vc.index = self.row;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
