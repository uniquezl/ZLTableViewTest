//
//  SectionHeader.h
//  ZLTableViewTest
//
//  Created by zhulin on 2018/5/23.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupModel,SectionHeader;
@protocol SectionHeaderDelegate <NSObject>
@optional

- (void)sectionHeader:(SectionHeader *)sectionHeader didClickHeaderViewButton:(UIButton *)button;

@end

typedef NS_ENUM(BOOL, TriangleDirection) {
    triangleDirectionToButton,
    triangleDirectionToRight
};

@interface SectionHeader : UITableViewHeaderFooterView

@property (nonatomic, strong) GroupModel * group;

//Set a variable as its delegate
@property (nonatomic, weak) id<SectionHeaderDelegate> delegate;
//Change the direction of triangle image
@property (nonatomic, assign) TriangleDirection angleDirection;

@end
