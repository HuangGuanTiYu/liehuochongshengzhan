//
//  HBNavigationController.m
//  TattooMan
//
//  Created by 吴迪 on 15/10/19.
//  Copyright © 2015年 HB. All rights reserved.
//

#import "HBNavigationController.h"
#import "DCFileTool.h"
#import "UIBarButtonItem+Extension.h"

#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]
#define DCReadMode @"DCReadMode"//阅读模式
#define DCReadDefaultMode @"DCReadDefaultMode"//默认模式（白天）

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]


@interface HBNavigationController ()

@end

@implementation HBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

}

+ (void)initialize
{
    //设置默认信息
    if(![[NSUserDefaults standardUserDefaults] objectForKey:DCReadMode])
    {
        [[NSUserDefaults standardUserDefaults] setObject:DCReadDefaultMode forKey:DCReadMode];
    }
    
    //tabBar主题 title文字属性
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    NSMutableDictionary *tabBarItemDict = [NSMutableDictionary dictionary];
    tabBarItemDict[NSForegroundColorAttributeName] = HBRGB(102, 102, 102);
    tabBarItemDict[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [tabBarItem setTitleTextAttributes:tabBarItemDict forState:UIControlStateNormal];
    
    NSMutableDictionary *tabBarItemDictSelect = [NSMutableDictionary dictionary];
    tabBarItemDictSelect[NSForegroundColorAttributeName] = RGBCOLOR_HEX(0xFF5858);
    tabBarItemDictSelect[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [tabBarItem setTitleTextAttributes:tabBarItemDictSelect forState:UIControlStateSelected];
    
    //导航栏主题 title文字属性
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barTintColor = RGBCOLOR_HEX(0xFF5858);
    NSMutableDictionary *navBarDict = [NSMutableDictionary dictionary];
    navBarDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    navBarDict[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:navBarDict];
    
    //导航栏左右文字主题
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    NSMutableDictionary *batButtonDict = [NSMutableDictionary dictionary];
    batButtonDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    batButtonDict[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [barButtonItem setTitleTextAttributes:batButtonDict forState:UIControlStateNormal];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_back@2x") target:self selector:@selector(back)];

    }
    [super pushViewController:viewController animated:YES];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
