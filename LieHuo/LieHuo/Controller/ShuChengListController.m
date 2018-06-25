//
//  ShuChengListController.m
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/6/25.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "ShuChengListController.h"
#import "UIView+Extension.h"
#import "ShuChengCell.h"
#import "ShuChengModel.h"
#import "StudyCircleDetailController.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

@interface ShuChengListController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation ShuChengListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datas = [NSMutableArray array];
    
    self.title = @"热门推荐";
    
    if (self.isZuiXin) {
        self.title = @"最新图书";
    }
    
    ShuChengModel *m1 = [[ShuChengModel alloc] init];
    m1.imageUrl = ImagePath(@"bookImage15");
    m1.title = @"武动仙惊";
    m1.bj = @"bj16";
    m1.contentString = @"洪金新书已发，书名《金牌江湖》，推荐处有链接： 每个热血男儿心中，都有一个浩荡江湖。江湖中有纵马奔驰快意恩仇的风尘侠气，有一诺千金生死与共的兄弟情义，有刻骨铭心荡气回肠的爱恨纠缠。人会老去，江湖情怀只会越来越浓。";
    m1.auth = @"红金";
    
    ShuChengModel *m2 = [[ShuChengModel alloc] init];
    m2.imageUrl = ImagePath(@"bookImage16");
    m2.title = @"武炼巅峰";
    m2.bj = @"bj17";
    m2.contentString = @"武之巅峰，是孤独，是寂寞，是漫漫求索，是高处不胜寒 逆境中成长，绝地里求生，不屈不饶，才能堪破武之极道。 凌霄阁试炼弟子兼扫地小厮杨开偶获一本无字黑书，从此踏上漫漫武道";
    m2.auth = @"莫默";
    
    ShuChengModel *m3 = [[ShuChengModel alloc] init];
    m3.imageUrl = ImagePath(@"bookImage17");
    m3.title = @"武炼星空";
    m3.bj = @"bj18";
    m3.contentString = @"我的武道，永不破灭！我的魂魄，永世长存！我的血液，烈若骄阳！亿万世的轮回，磨灭不掉我的执着！灭天碎宇的神魔，高悬苍穹的天道大帝们！用你们的尸体来铺就我通往星空的彼岸吧！这一世，我等待很久了！我，就是萧禹！以我之名，炼化星空！……诸天万界颤栗吧…";
    m3.auth = @"缘君不弃";
    
    ShuChengModel *m4 = [[ShuChengModel alloc] init];
    m4.imageUrl = ImagePath(@"bookImage21");
    m4.title = @"寻神之旅";
    m4.bj = @"bbj22";
    m4.contentString = @"地动山摇，李御风进入苍茫异世， 原来山海经是真的，上古传说是真的，那洪荒诸神呢？ 祝融，共工，刑天，蚩尤，这些大神，究竟在哪里？ 妖兽，龙族，战族，人族，不同种族间，将兴起怎样的冲突？ 五行，八卦，元素，绚丽功法争奇斗艳。 他，渐渐熟悉这陌生的世界，踏上寻神之旅， 玄天缘火";
    m4.auth = @"铁重";
    
    ShuChengModel *m5 = [[ShuChengModel alloc] init];
    m5.imageUrl = ImagePath(@"bookImage22");
    m5.title = @"遗落世界";
    m5.bj = @"bj23";
    m5.contentString = @"遗落世界的简介：神魔之战，天地残；万法归尘，独留一脉；神兽凤凰，涅槃重生，其血可生死；桃李树下，琴竹瑟；情之所系，道法自然，终来成神。";
    m5.auth = @"天剑阁阁主";
    
    if (self.isZuiXin) {
        m1.imageUrl = ImagePath(@"bookImage18");
        m1.title = @"武灭天穹";
        m1.bj = @"bj19";
        m1.contentString = @"血池洗礼，绝世天才归来 少年意气，让他光芒绽放 修炼肉身，妖孽悟性，助他开启争霸之路 妖娆狐女，美女导师，帝国公主，各色美人之间，他流连忘返 以武荡天地，以力灭苍穹！ 等级提升：先天、武者、武师、武灵、武将、武王、武皇、武宗，武尊，武帝，武圣，武神 一定完本，男人的诺言。";
        m1.auth = @"飞马城之约";
        
        m2.imageUrl = ImagePath(@"bookImage19");
        m2.title = @"武破长生";
        m2.bj = @"bj20";
        m2.contentString = @"尘世一俗人凌浩，自从于古墓中捡到一老婆开始，就被迫走上了一条不归路，一条没有回家的路。 峥嵘岁月，是随波逐流，还是逆流直上，三尺剑芒追风逐月，长路漫漫，唯剑作伴。 新书求支持，那怕点滴累积，都是我前行的动力。";
        m2.auth = @"道士";
        
        m3.imageUrl = ImagePath(@"bookImage20");
        m3.title = @"星震九天";
        m3.bj = @"bj21";
        m3.contentString = @"会当凌绝顶，一览众山小！ 天才，到哪里都是天才！ 当一代地球古武学大师萧北，肉身被毁，灵魂穿越到异世一名大家族私生子身上，他如何的让人大跌眼球之余，走上至高强者之路？ 且看萧北成就非凡道业，铸天地大道之力，挥手间，星辰舞动，蔑视九天！";
        m3.auth = @"追忆夜魄";
        
        m4.imageUrl = ImagePath(@"bookImage23");
        m4.title = @"异界圣骑士";
        m4.bj = @"bj24";
        m4.contentString = @"骑士2—《异界圣骑士》开始了，大家“轰轰”的砸票吧！ ～～～～～～～～～ 林风购买游戏头盔，结果穿越到了异界，成为了骑士。 村长：“骑士林风，十五级的白银怪物四臂冰猿魔要袭击我们村庄了，请拯救我们吧。” 骑士林风：“好！” “啊！我才1级，还没武器。” 村长：“哦，杀小怪会爆武器";
        m4.auth = @"冷石";
        
        m5.imageUrl = ImagePath(@"bookImage24");
        m5.title = @"最散仙";
        m5.bj = @"bj25";
        m5.contentString = @"作为一名散仙，唐擎感到压力很大，因为你永远不知道下一次天劫会什么时候降临，也不知道渡过多少次天劫才算是尽头，刚刚渡过第九重天劫，唐擎的肉身被变态的天劫轰的虚弱不堪，从废墟中爬出来后，一次莫名其妙的偶然，他成了一群天之骄女的道侣……";
        m5.auth = @"九哼";
    }
    
    [self.datas addObject:m1];
    [self.datas addObject:m2];
    [self.datas addObject:m3];
    [self.datas addObject:m4];
    [self.datas addObject:m5];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
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

@end
