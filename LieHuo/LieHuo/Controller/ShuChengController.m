//
//  ShuChengController.m
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/6/21.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "ShuChengController.h"
#import "UIView+Extension.h"
#import "BookView.h"
#import "ShuChengCell.h"
#import "ShuChengModel.h"
#import "StudyCircleDetailController.h"
#import "ShuChengListController.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]
#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


@interface ShuChengController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation ShuChengController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datas = [NSMutableArray array];
    
    ShuChengModel *m1 = [[ShuChengModel alloc] init];
    m1.imageUrl = ImagePath(@"bookImage10");
    m1.title = @"吞噬天下";
    m1.bj = @"bj11";
    m1.contentString = @"这是一个仙魔林立，鬼怪乱舞的世界，现代青年肖阳被黑洞带到了这个世界。在这个强者如林的世界里，他该如何生存？ 一次偶然中，他发现自己竟然拥有了和黑洞一样的吞噬能力.....";
    m1.auth = @"屯田";
    
    ShuChengModel *m2 = [[ShuChengModel alloc] init];
    m2.imageUrl = ImagePath(@"bookImage11");
    m2.title = @"问龙纪";
    m2.bj = @"bj12";
    m2.contentString = @"平凡少年叶问龙，从小迷恋传说中的龙，偶得龙涎金水基因变异，获金龙臂，进龙武学府，从此踏上修龙途。 一条弱者奋起路，一曲热血少年歌。一路强者尽低头，一群美女揽入怀。 龙啸九天，震撼苍穹！ 最初武力（善力）等级：息灾、调伏、增益、敬爱、钩召，每一阶一到十级。";
    m2.auth = @"屯田";
    
    ShuChengModel *m3 = [[ShuChengModel alloc] init];
    m3.imageUrl = ImagePath(@"bookImage12");
    m3.title = @"无尽神功";
    m3.bj = @"bj13";
    m3.contentString = @"一个资质低、悟性差的“真·废柴”武修之路。 功法与武者之间存在“契合度”，契合度越高修炼越快，传说契合度达到七分之后，每增加一分，修炼效率加倍！一次意外，杨硕获得查看自己与功法之间的契合度的能力…… 天才们修神功秘典，消耗无数天材地宝，穷毕生之力，勉强摸到武圣境界的门槛。 杨硕修低";
    m3.auth = @"灵隐狐";
    
    ShuChengModel *m4 = [[ShuChengModel alloc] init];
    m4.imageUrl = ImagePath(@"bookImage13");
    m4.title = @"武道霸主";
    m4.bj = @"bj14";
    m4.contentString = @"醒掌杀人权，醉卧美人膝，在这个以武为尊的混乱大陆，优胜劣汰的自然法则演绎到极致的世界，好男儿，当为枭雄霸主，主宰万众生命！ 为此，周绍在努力……";
    m4.auth = @"铁重";
    
    ShuChengModel *m5 = [[ShuChengModel alloc] init];
    m5.imageUrl = ImagePath(@"bookImage14");
    m5.title = @"武敌天下";
    m5.bj = @"bj15";
    m5.contentString = @"初春的旱州府，早晨依旧寒气逼人，毕竟是西北之地，这浓郁的寒意还要再过上几月才能真正散去。";
    m5.auth = @"战袍染血";
    
    [self.datas addObject:m1];
    [self.datas addObject:m2];
    [self.datas addObject:m3];
    [self.datas addObject:m4];
    [self.datas addObject:m5];

    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 0)];
    
    UIImageView *topImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.view.width - 20, 80)];
    topImage.image = [UIImage imageNamed:ImagePath(@"ic_banner2@2x")];
    [headerView addSubview:topImage];
    
    UILabel *remenLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(topImage.frame) + 10, 0, 0)];
    remenLabel.text = @"热门推荐";
    [remenLabel sizeToFit];
    remenLabel.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:remenLabel];
    
    UILabel *remenDes = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(remenLabel.frame) + 5, self.view.width, self.view.height)];
    remenDes.numberOfLines = 0;
    remenDes.text = @"【读书时要深思多问。只读而不想，就可能人云亦云，沦为书本的奴隶；或者走马观花，所获甚微】";
    [remenDes sizeToFit];
    remenDes.textColor = RGBCOLOR_HEX(0x666666);
    remenDes.font = [UIFont systemFontOfSize:14];
    [headerView addSubview:remenDes];
    
    UIButton *moreButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [moreButton setTitle:@"查看更多" forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(moreButtonClick) forControlEvents:UIControlEventTouchUpInside];
    moreButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [moreButton setTitleColor:RGBCOLOR_HEX(0x333333) forState:UIControlStateNormal];
    [moreButton sizeToFit];
    moreButton.centerX = self.view.width * 0.5;

    CGFloat bookW = (self.view.width - 40) / 3;
    
    NSArray *imageUrls = @[@"bookImage15",@"bookImage16",@"bookImage17"];
    NSArray *booknames = @[@"武动仙惊",@"武炼巅峰",@"武炼星空"];
    NSArray *authnames = @[@"红金",@"莫默",@"缘君不弃"];

    for (int i = 0 ; i < 3; i ++) {
        BookView *bookView = [[BookView alloc] initWithFrame:CGRectMake(10 + i * (bookW + 10), CGRectGetMaxY(remenDes.frame) + 5, bookW, 185)];
        bookView.userInteractionEnabled = YES;
        bookView.tag = i;
        [bookView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookViewClick:)]];
        bookView.imageUrl = ImagePath(imageUrls[i]);
        bookView.bookname = booknames[i];
        bookView.authname = authnames[i];
        [headerView addSubview:bookView];
        
        if (i == 2) {
            moreButton.y = CGRectGetMaxY(bookView.frame) + 20;
        }
    }
    
    [headerView addSubview:moreButton];
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(moreButton.frame) + 10, self.view.width, 10)];
    sepaView.backgroundColor = HBRGB(245, 245, 245);
    [headerView addSubview:sepaView];
    
    UILabel *zuixinLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(sepaView.frame) + 10, 0, 0)];
    zuixinLabel.text = @"最新图书";
    [zuixinLabel sizeToFit];
    zuixinLabel.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:zuixinLabel];
    
    UILabel *zuixinDes = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(zuixinLabel.frame) + 5, self.view.width, self.view.height)];
    zuixinDes.numberOfLines = 0;
    zuixinDes.text = @"【不去读书就没有真正的教养，同时也不可能有什么鉴别力】";
    [zuixinDes sizeToFit];
    zuixinDes.textColor = RGBCOLOR_HEX(0x666666);
    zuixinDes.font = [UIFont systemFontOfSize:14];
    [headerView addSubview:zuixinDes];
    
    UIButton *moreButton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [moreButton1 setTitle:@"查看更多" forState:UIControlStateNormal];
    [moreButton1 addTarget:self action:@selector(moreButtonClick1) forControlEvents:UIControlEventTouchUpInside];
    moreButton1.titleLabel.font = [UIFont systemFontOfSize:14];
    [moreButton1 setTitleColor:RGBCOLOR_HEX(0x333333) forState:UIControlStateNormal];
    [moreButton1 sizeToFit];
    moreButton1.centerX = self.view.width * 0.5;
    
    NSArray *imageUrl2s = @[@"bookImage18",@"bookImage19",@"bookImage20"];
    NSArray *bookname2s = @[@"武灭天穹",@"武破长生",@"星震九天"];
    NSArray *authname2s = @[@"飞马城之约",@"道士",@"追忆夜魄"];
    
    for (int i = 0 ; i < 3; i ++) {
        BookView *bookView = [[BookView alloc] initWithFrame:CGRectMake(10 + i * (bookW + 10), CGRectGetMaxY(zuixinDes.frame) + 5, bookW, 185)];
        bookView.userInteractionEnabled = YES;
        bookView.tag = i;
        [bookView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookViewClick2:)]];
        bookView.imageUrl = ImagePath(imageUrl2s[i]);
        bookView.bookname = bookname2s[i];
        bookView.authname = authname2s[i];
        [headerView addSubview:bookView];
        
        if (i == 2) {
            moreButton1.y = CGRectGetMaxY(bookView.frame) + 20;
        }
    }
    
    [headerView addSubview:moreButton1];

    UIView *sepaView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(moreButton1.frame) + 10, self.view.width, 10)];
    sepaView2.backgroundColor = HBRGB(245, 245, 245);
    [headerView addSubview:sepaView2];
    
    UILabel *cainixihuanLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(sepaView2.frame) + 10, 0, 0)];
    cainixihuanLabel.text = @"猜你喜欢";
    [cainixihuanLabel sizeToFit];
    cainixihuanLabel.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:cainixihuanLabel];
    
    headerView.height = CGRectGetMaxY(cainixihuanLabel.frame);
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.height = self.view.height - 64;
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = headerView;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"ShuChengCell";
    ShuChengCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ShuChengCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    ShuChengModel *model = self.datas[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 126;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失

    ShuChengModel *model = self.datas[indexPath.row];

    StudyCircleDetailController *vc = [[StudyCircleDetailController alloc] init];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) bookViewClick : (UIGestureRecognizer *) gestureRecognizer
{
    StudyCircleDetailController *vc = [[StudyCircleDetailController alloc] init];
    ShuChengModel *model = [[ShuChengModel alloc] init];
    
    BookView *bookView = (BookView *)gestureRecognizer.view;
    
    NSArray *imageUrls = @[@"bookImage15",@"bookImage16",@"bookImage17"];
    NSArray *booknames = @[@"武动仙惊",@"武炼巅峰",@"武炼星空"];
    NSArray *bjs = @[@"bj16",@"bj17",@"bj18"];
    NSArray *authnames = @[@"红金",@"莫默",@"缘君不弃"];
    NSArray *contents = @[@"会当凌绝顶，一览众山小！ 天才，到哪里都是天才！ 当一代地球古武学大师萧北，肉身被毁，灵魂穿越到异世一名大家族私生子身上，他如何的让人大跌眼球之余，走上至高强者之路？ 且看萧北成就非凡道业，铸天地大道之力，挥手间，星辰舞动，蔑视九天！",@"武之巅峰，是孤独，是寂寞，是漫漫求索，是高处不胜寒 逆境中成长，绝地里求生，不屈不饶，才能堪破武之极道。 凌霄阁试炼弟子兼扫地小厮杨开偶获一本无字黑书，从此踏上漫漫武道",@"我的武道，永不破灭！我的魂魄，永世长存！我的血液，烈若骄阳！亿万世的轮回，磨灭不掉我的执着！灭天碎宇的神魔，高悬苍穹的天道大帝们！用你们的尸体来铺就我通往星空的彼岸吧！这一世，我等待很久了！我，就是萧禹！以我之名，炼化星空！……诸天万界颤栗吧…"];

    model.imageUrl = ImagePath(imageUrls[bookView.tag]);
    model.title = booknames[bookView.tag];
    model.contentString = contents[bookView.tag];
    model.auth = authnames[bookView.tag];
    model.bj = bjs[bookView.tag];
    
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];

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

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    
}

- (void) moreButtonClick
{
    ShuChengListController *vc = [[ShuChengListController alloc] init];
    vc.isZuiXin = NO;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void) moreButtonClick1
{
    
    ShuChengListController *vc = [[ShuChengListController alloc] init];
    vc.isZuiXin = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
