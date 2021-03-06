//
//  MomentsTableViewCell.h
//  SoolyMomentCell
//
//  Created by SoolyChristina on 2016/11/25.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MomentViewModel,MomentsTableViewCell;

@protocol MomentsTableViewCellDelgate<NSObject>

-(void)bookListViewdidSelectRowAtIndex:(MomentsTableViewCell *)cell;

@end

@interface MomentsTableViewCell : UITableViewCell

@property (nonatomic,strong) NSMutableArray *moments;
@property (nonatomic,strong) MomentViewModel *momentFrames;

+ (instancetype)momentsTableViewCellWithTableView:(UITableView *)tableView;
@property (nonatomic, weak) id<MomentsTableViewCellDelgate> delegate;

@end
