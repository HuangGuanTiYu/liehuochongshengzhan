//
//  PersonController.m
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/6/21.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "PersonController.h"
#import "UIView+Extension.h"
#import "Moments.h"
#import "BookView.h"
#import "StudyCircleDetailController.h"
#import "ShuChengModel.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]
#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface PersonController ()

@end

@implementation PersonController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"主页";
    
    UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 90, 75, 75)];
    headerImage.image = [UIImage imageNamed:ImagePath(self.moment.icon)];
    headerImage.centerX = self.view.width * 0.5;
    headerImage.layer.cornerRadius = headerImage.width * 0.5;
    headerImage.layer.masksToBounds = YES;
    [self.view addSubview:headerImage];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerImage.frame) + 5, 0, 0)];
    name.text = self.moment.name;
    name.font = [UIFont systemFontOfSize:12];
    [name sizeToFit];
    name.centerX = self.view.width * 0.5;
    name.textColor = RGBCOLOR_HEX(0x666666);
    [self.view addSubview:name];
    
    UIButton *guanZhu = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(name.frame) + 10, 0, 0)];
    [guanZhu addTarget:self action:@selector(guanZhuClick:) forControlEvents:UIControlEventTouchUpInside];
    guanZhu.backgroundColor = RGBCOLOR_HEX(0xFF5858);
    [guanZhu setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [guanZhu setTitle:@"关注TA" forState:UIControlStateNormal];
    [guanZhu setTitle:@"已关注" forState:UIControlStateSelected];
    guanZhu.titleLabel.font = [UIFont systemFontOfSize:14];
    [guanZhu sizeToFit];
    guanZhu.width = guanZhu.width + 30;
    guanZhu.centerX = self.view.width * 0.5;
    [self.view addSubview:guanZhu];

    UIView *sepaView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(guanZhu.frame) + 10, self.view.width, 10)];
    sepaView2.backgroundColor = HBRGB(245, 245, 245);
    [self.view addSubview:sepaView2];
    
    UILabel *cainixihuanLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(sepaView2.frame) + 10, 0, 0)];
    cainixihuanLabel.text = @"最近阅读";
    [cainixihuanLabel sizeToFit];
    cainixihuanLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:cainixihuanLabel];
    
    CGFloat bookW = (self.view.width - 40) / 3;
    
    NSArray *imageUrl2s = @[@"bookImage18",@"bookImage19",@"bookImage20"];
    NSArray *bookname2s = @[@"武灭天穹",@"武破长生",@"星震九天"];
    NSArray *authname2s = @[@"飞马城之约",@"道士",@"追忆夜魄"];
    
    for (int i = 0 ; i < 3; i ++) {
        BookView *bookView = [[BookView alloc] initWithFrame:CGRectMake(10 + i * (bookW + 10), CGRectGetMaxY(cainixihuanLabel.frame) + 10, bookW, 185)];
        bookView.userInteractionEnabled = YES;
        bookView.tag = i;
        [bookView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookViewClick2:)]];
        bookView.imageUrl = ImagePath(imageUrl2s[i]);
        bookView.bookname = bookname2s[i];
        bookView.authname = authname2s[i];
        [self.view addSubview:bookView];
        
    }
    
}

- (void) guanZhuClick : (UIButton *) button
{
    button.selected = !button.selected;
    
    if (button.selected) {
        button.backgroundColor = RGBCOLOR_HEX(0x666666);
    }else
    {
        button.backgroundColor = RGBCOLOR_HEX(0xFF5858);
    }
}

- (void) bookViewClick2 : (UIGestureRecognizer *) gestureRecognizer
{
    StudyCircleDetailController *vc = [[StudyCircleDetailController alloc] init];
    ShuChengModel *model = [[ShuChengModel alloc] init];
    
    BookView *bookView = (BookView *)gestureRecognizer.view;
    
    NSArray *imageUrl2s = @[@"bookImage18",@"bookImage19",@"bookImage20"];
    NSArray *bookname2s = @[@"武灭天穹",@"武破长生",@"星震九天"];
    NSArray *authname2s = @[@"飞马城之约",@"道士",@"追忆夜魄"];
    NSArray *bj2s = @[@"bj19",@"bj20",@"bj21"];
    NSArray *content2s = @[@"血池洗礼，绝世天才归来 少年意气，让他光芒绽放 修炼肉身，妖孽悟性，助他开启争霸之路 妖娆狐女，美女导师，帝国公主，各色美人之间，他流连忘返 以武荡天地，以力灭苍穹！ 等级提升：先天、武者、武师、武灵、武将、武王、武皇、武宗，武尊，武帝，武圣，武神 一定完本，男人的诺言。",@"尘世一俗人凌浩，自从于古墓中捡到一老婆开始，就被迫走上了一条不归路，一条没有回家的路。 峥嵘岁月，是随波逐流，还是逆流直上，三尺剑芒追风逐月，长路漫漫，唯剑作伴。 新书求支持，那怕点滴累积，都是我前行的动力",@"会当凌绝顶，一览众山小！ 天才，到哪里都是天才！ 当一代地球古武学大师萧北，肉身被毁，灵魂穿越到异世一名大家族私生子身上，他如何的让人大跌眼球之余，走上至高强者之路？ 且看萧北成就非凡道业，铸天地大道之力，挥手间，星辰舞动，蔑视九天！"];
    
    model.imageUrl = ImagePath(imageUrl2s[bookView.tag]);
    model.title = bookname2s[bookView.tag];
    model.contentString = content2s[bookView.tag];
    model.auth = authname2s[bookView.tag];
    model.bj = bj2s[bookView.tag];
    vc.model = model;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
