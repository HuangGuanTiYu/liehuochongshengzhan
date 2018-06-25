//
//  LoginController.h
//  Qihuo
//
//  Created by 顾海波 on 2018/3/2.
//  Copyright © 2018年 com.qihuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginControllerDelegate <NSObject>

- (void) login : (NSString *) name;

@end

@interface LoginController : UIViewController

@property (nonatomic, weak) id<LoginControllerDelegate> firstViewControllerDelegate;


@end
