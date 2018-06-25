//
//  MainTabBarController.m
//  XiuMei
//
//  Created by edz on 2017/11/11.
//  Copyright © 2017年 xiuMie. All rights reserved.
//

#import "MainTabBarController.h"
#import "BookshelfController.h"
#import "LikeController.h"
#import "MineController.h"
#import "HBNavigationController.h"
#import "ShuChengController.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BookshelfController *homeVc = [[BookshelfController alloc] init];
    [self addChildViewController:homeVc title:@"书架" normalImage:ImagePath(@"ic_shouye_press")
                   selectedImage:ImagePath(@"homeIcon")];
    
    ShuChengController *shuchengVc = [[ShuChengController alloc] init];
    [self addChildViewController:shuchengVc title:@"书城" normalImage:ImagePath(@"ic_shouye_press")
                   selectedImage:ImagePath(@"homeIcon")];
    
    LikeController *circleVc = [[LikeController alloc] init];
    [self addChildViewController:circleVc title:@"圈子" normalImage:ImagePath(@"ic_hangqing_press") selectedImage:ImagePath(@"ic_shouye_normal")];
    
    MineController *mineVc = [[MineController alloc] init];
    [self addChildViewController:mineVc title:@"我的" normalImage:ImagePath(@"ic_xinwen_press") selectedImage:ImagePath(@"ic_xinwen_normal")];
}

- (void)addChildViewController:(UIViewController *)childController title : (NSString *)title normalImage : (NSString *)normalImage selectedImage : (NSString *)selectedImage
{
    childController.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",normalImage]];
    childController.title = title;
    UIImage *selected = [UIImage imageNamed:[NSString stringWithFormat:@"%@",selectedImage]];
    // 声明：这张图片按照原始的样子显示出来，不要渲染成其他的颜色（比如说默认的蓝色）
    selected = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = selected;
//    childController.view.backgroundColor = HBRGB(245, 245, 245);
    HBNavigationController *hbNav = [[HBNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:hbNav];
}


- (BOOL)shouldAutorotate
{
    return NO;
}


#pragma mark 全项目支持竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end
