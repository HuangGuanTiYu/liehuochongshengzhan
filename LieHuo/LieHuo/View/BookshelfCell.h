//
//  BookshelfCell.h
//  HBIOSFrame
//
//  Created by 顾海波 on 2018/4/19.
//  Copyright © 2018年 HB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCBookModel;

@interface BookshelfCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *topImage;

@property (strong, nonatomic) UILabel *botlabel;

@property (strong, nonatomic) UILabel *jindulabel;

@property (strong, nonatomic) UIButton *selectedButton;

@property (nonatomic, strong) DCBookModel *model;

@end
