//
//  MomentsBodyView.h
//  SoolyMomentCell
//
//  Created by SoolyChristina on 2016/11/25.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MomentViewModel;

@protocol MomentsBodyViewDelgate<NSObject>

-(void)bookListViewdidSelectRowAtIndex;

@end

@interface MomentsBodyView : UIView

@property (nonatomic,strong) MomentViewModel *momentFrames;

@property (nonatomic, weak) id<MomentsBodyViewDelgate> delegate;

@end
