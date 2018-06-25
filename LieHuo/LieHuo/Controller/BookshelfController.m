//
//  BookshelfController.m
//  HBIOSFrame
//
//  Created by 顾海波 on 2018/4/19.
//  Copyright © 2018年 HB. All rights reserved.
//

#import "BookshelfController.h"
#import "BookshelfCell.h"
#import "DCBookModel.h"
#import "DCPageVC.h"
#import "UIView+Extension.h"
#import "BookCoverController.h"
#import "UIBarButtonItem+Extension.h"

#define ImagePath(path) [@"Resources.bundle" stringByAppendingPathComponent:path]

#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

@interface BookshelfController()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *mainCollectionView;
    
}

@property (nonatomic,strong) NSArray<DCBookModel *> *books;

@property (nonatomic, assign) BOOL isDelete;


@end

@implementation BookshelfController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"书架";
    
    NSMutableArray *bookArr = [NSMutableArray array];
    
    DCBookModel *book0 = [[DCBookModel alloc] init];
    
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/烈火重生斩.txt"];
    book0.name = @"烈火重生斩";
    book0.path = path;
    book0.image = ImagePath(@"bookImage0");
    [bookArr addObject:book0];
    
    DCBookModel *book = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/狠人大帝.txt"];
    book.name = @"狠人大帝";
    book.path = path;
    book.image = ImagePath(@"bookImage");
    [bookArr addObject:book];
    
    DCBookModel *book1 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/净月恶魔.txt"];
    book1.name = @"净月恶魔";
    book1.path = path;
    book1.image = ImagePath(@"bookImage1");
    [bookArr addObject:book1];
    
    DCBookModel *book2 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/炼鬼修仙.txt"];
    book2.name = @"炼鬼修仙";
    book2.path = path;
    book2.image = ImagePath(@"bookImage2");
    [bookArr addObject:book2];
    
    DCBookModel *book3 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/龙武之祖.txt"];
    book3.name = @"龙武之祖";
    book3.path = path;
    book3.image = ImagePath(@"bookImage3");
    [bookArr addObject:book3];
    
    DCBookModel *book4 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/龙战天下.txt"];
    book4.name = @"龙战天下";
    book4.path = path;
    book4.image = ImagePath(@"bookImage4");
    [bookArr addObject:book4];
    
    DCBookModel *book5 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/龙战星野.txt"];
    book5.name = @"龙战星野";
    book5.path = path;
    book5.image = ImagePath(@"bookImage5");
    [bookArr addObject:book5];
    
    DCBookModel *book6 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/魔法武器.txt"];
    book6.name = @"魔法武器";
    book6.path = path;
    book6.image = ImagePath(@"bookImage6");
    [bookArr addObject:book6];
    
    DCBookModel *book7 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/魔凌九霄.txt"];
    book7.name = @"魔凌九霄";
    book7.path = path;
    book7.image = ImagePath(@"bookImage7");
    [bookArr addObject:book7];
    
    DCBookModel *book8 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/魔龙翻天.txt"];
    book8.name = @"魔龙翻天";
    book8.path = path;
    book8.image = ImagePath(@"bookImage8");
    [bookArr addObject:book8];
    
    DCBookModel *book9 = [[DCBookModel alloc] init];
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources.bundle/神雷诀.txt"];
    book9.name = @"神雷诀";
    book9.path = path;
    book9.image = ImagePath(@"bookImage9");
    [bookArr addObject:book9];
    
    self.books = [NSArray arrayWithArray:bookArr];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 74, self.view.width - 20, 80)];
    topImageView.image = [UIImage imageNamed:ImagePath(@"ic_banner1@2x")];
    [self.view addSubview:topImageView];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    mainCollectionView.y = CGRectGetMaxY(topImageView.frame) + 10;
    mainCollectionView.height = self.view.height - CGRectGetMaxY(topImageView.frame) - 30;
    [self.view addSubview:mainCollectionView];
    
    mainCollectionView.backgroundColor = [UIColor whiteColor];
    [mainCollectionView registerClass:[BookshelfCell class] forCellWithReuseIdentifier:@"cellId"];
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotificationAction:) name:@"FanHui" object:nil];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_bianji@2x") target:self selector:@selector(bianji)];

}

- (void) bianji
{
    self.isDelete = !self.isDelete;
    
    for (DCBookModel *model in self.books) {
        model.isBianji = YES;
    }
    
    if (self.isDelete) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(bianji)];
    }else
    {
        NSMutableArray *array = [NSMutableArray array];
        for (DCBookModel *model in self.books) {
            model.isBianji = NO;
            if (!model.isXuanZhong) {
                [array addObject:model];
            }
        }
        
        self.books = array;
        
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:ImagePath(@"ic_bianji@2x") target:self selector:@selector(bianji)];
    }
    
    [mainCollectionView reloadData];

}

- (void)getNotificationAction:(NSNotification *)notification{
    NSDictionary * infoDic = [notification object];
    
    // 这样就得到了我们在发送通知时候传入的字典了
    NSString *index = infoDic[@"index"];
    
    BookshelfCell *cell = (BookshelfCell *)[mainCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:[index integerValue] inSection:0]];
    
    int x = arc4random() % 10;
    
    cell.jindulabel.text = [NSString stringWithFormat:@"已读:%d%%",x];
    [cell.jindulabel sizeToFit];
    cell.jindulabel.centerX = cell.width * 0.5;
    cell.jindulabel.textColor = RGBCOLOR_HEX(0x666666);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.books.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BookshelfCell *cell = (BookshelfCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    DCBookModel *model = self.books[indexPath.row];
    cell.model = model;
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.width - 20 * 4) / 3, (self.view.width - 20 * 4) / 3 * 1.75 + 30);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    //封皮
    BookCoverController *vc = [[BookCoverController alloc] init];
    if (indexPath.row == 0) {
        vc.imageName = ImagePath(@"bj0");
    }else if (indexPath.row == 1)
    {
        vc.imageName = ImagePath(@"bj1");

    }else if (indexPath.row == 2)
    {
        vc.imageName = ImagePath(@"bj2");

    }else if (indexPath.row == 3)
    {
        vc.imageName = ImagePath(@"bj3");
        
    }else if (indexPath.row == 4)
    {
        vc.imageName = ImagePath(@"bj4");
        
    }else if (indexPath.row == 5)
    {
        vc.imageName = ImagePath(@"bj5");
        
    }else if (indexPath.row == 6)
    {
        vc.imageName = ImagePath(@"bj6");
        
    }else if (indexPath.row == 7)
    {
        vc.imageName = ImagePath(@"bj7");
        
    }else if (indexPath.row == 8)
    {
        vc.imageName = ImagePath(@"bj8");
        
    }else if (indexPath.row == 9)
    {
        vc.imageName = ImagePath(@"bj9");
        
    }else if (indexPath.row == 10)
    {
        vc.imageName = ImagePath(@"bj10");
        
    }
    vc.row = indexPath.row;
    vc.books = self.books;
    [self.navigationController pushViewController:vc animated:YES];
    return;

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 15;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];

}


@end
