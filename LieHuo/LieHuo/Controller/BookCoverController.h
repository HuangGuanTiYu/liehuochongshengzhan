//
//  BookCoverController.h
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/5/4.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCBookModel;

@interface BookCoverController : UIViewController

@property (nonatomic,copy) NSString *imageName;

@property (nonatomic, assign) NSInteger row;

@property (nonatomic,strong) NSArray<DCBookModel *> *books;

@end
