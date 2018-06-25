//
//  StudyCircleDetailController.m
//  MoveSchool
//
//  Created by edz on 2017/11/24.
//
//

#import "StudyCircleDetailController.h"
#import "ShuChengModel.h"
#import "ChatKeyBoard.h"
#import "UIView+Extension.h"
#import "BookView.h"
#import "BookCoverController.h"
#import "DCBookModel.h"

#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]


@interface StudyCircleDetailController ()

@property(nonatomic, strong) UIImageView *iconImage;

//标题
@property(nonatomic, strong) UILabel *titleLabel;

//分割线
@property(nonatomic, strong) UILabel *contentLabel;

@property(nonatomic, strong) UILabel *authLabel;

@end

@implementation StudyCircleDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = self.model.title;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.height = self.view.height - 64;
    [self.view addSubview:scrollView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [scrollView addSubview:self.titleLabel];
    
    self.iconImage = [[UIImageView alloc] init];
    [scrollView addSubview:self.iconImage];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:14];
    [scrollView addSubview:self.contentLabel];
    
    self.authLabel = [[UILabel alloc] init];
    self.authLabel.font = [UIFont systemFontOfSize:14];
    [scrollView addSubview:self.authLabel];
    
    self.contentLabel.textColor = self.authLabel.textColor = RGBCOLOR_HEX(0x666666);
    
    self.iconImage.image = [UIImage imageNamed:self.model.imageUrl];
    self.iconImage.frame = CGRectMake(10, 10, 83, 106);
    
    self.titleLabel.text = self.model.title;
    [self.titleLabel sizeToFit];
    self.titleLabel.x = CGRectGetMaxX(self.iconImage.frame) + 5;
    self.titleLabel.y = 10;
    
    self.authLabel.text = self.model.auth;
    [self.authLabel sizeToFit];
    self.authLabel.x = CGRectGetMaxX(self.iconImage.frame) + 5;
    self.authLabel.y = CGRectGetMaxY(self.titleLabel.frame) + 5;
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.iconImage.frame) + 10, self.view.width, 10)];
    sepaView.backgroundColor = HBRGB(245, 245, 245);
    [scrollView addSubview:sepaView];
    
    UILabel *jianjie = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(sepaView.frame) + 10, 0, 0)];
    jianjie.text = @"简介";
    [jianjie sizeToFit];
    jianjie.font = [UIFont systemFontOfSize:14];
    [scrollView addSubview:jianjie];

    self.contentLabel.frame = CGRectMake(10, CGRectGetMaxY(jianjie.frame) + 5, self.view.width - 20, 100);
    self.contentLabel.text = self.model.contentString;
    self.contentLabel.numberOfLines = 0;
    [self.contentLabel sizeToFit];
    
    UIView *sepaView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.contentLabel.frame) + 10, self.view.width, 10)];
    sepaView2.backgroundColor = HBRGB(245, 245, 245);
    [scrollView addSubview:sepaView2];
    
    UILabel *cainixihuanLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(sepaView2.frame) + 10, 0, 0)];
    cainixihuanLabel.text = @"猜你喜欢";
    [cainixihuanLabel sizeToFit];
    cainixihuanLabel.font = [UIFont systemFontOfSize:16];
    [scrollView addSubview:cainixihuanLabel];
    
    CGFloat bookW = (self.view.width - 40) / 3;

    NSArray *imageUrls = @[@"bookImage15",@"bookImage16",@"bookImage17"];
    NSArray *booknames = @[@"武动仙惊",@"武炼巅峰",@"武炼星空"];
    NSArray *authnames = @[@"红金",@"莫默",@"缘君不弃"];
    
    for (int i = 0 ; i < 3; i ++) {
        BookView *bookView = [[BookView alloc] initWithFrame:CGRectMake(10 + i * (bookW + 10), CGRectGetMaxY(cainixihuanLabel.frame) + 10, bookW, 185)];
        bookView.userInteractionEnabled = YES;
        bookView.tag = i;
        [bookView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookViewClick:)]];
        bookView.imageUrl = ImagePath(imageUrls[i]);
        bookView.bookname = booknames[i];
        bookView.authname = authnames[i];
        [scrollView addSubview:bookView];
        
        if (i == 2) {
            scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(bookView.frame) + 20);
        }
    }
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, self.view.height - 44 - 10, self.view.width - 20, 44)];
    button.backgroundColor = RGBCOLOR_HEX(0xFF5858);
    [button setTitle:@"去阅读" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void) buttonClick
{
    NSMutableArray *bookArr = [NSMutableArray array];
    DCBookModel *book9 = [[DCBookModel alloc] init];
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"Resources.bundle/%@.txt",self.model.title]];
    book9.name = self.model.title;
    book9.path = path;
    book9.image = ImagePath(@"bookImage9");
    [bookArr addObject:book9];
    
    //封皮
    BookCoverController *vc = [[BookCoverController alloc] init];
    vc.imageName = ImagePath(self.model.bj);
    
    vc.row = 0;
    vc.books = bookArr;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    
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

@end
