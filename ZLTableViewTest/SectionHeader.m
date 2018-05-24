//
//  SectionHeader.m
//  ZLTableViewTest
//
//  Created by zhulin on 2018/5/23.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "SectionHeader.h"
#import "GroupModel.h"

@interface SectionHeader ()

//Creat a headerButt on variable to change its value in diffrent mehods
@property (nonatomic, weak) UIButton *headerButton;
//Creat a online lable on variable to change its value in diffrent mehods
@property (nonatomic, weak) UILabel *onlineLabel;

@end
@implementation SectionHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //Load user interface for headerView
        [self setupUI];
        
        
    }
    return self;
}

- (void)setupUI
{
    //Add a button as section header
    UIButton *headerButton = [UIButton new];
    self.headerButton = headerButton;
    [self.headerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //Set the contents of button as horizontal align
    self.headerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.headerButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    self.headerButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    //Add a click event for headerButton
    [self.headerButton addTarget:self action:@selector(didClickHeaderViewButton:) forControlEvents:UIControlEventTouchUpInside];
    //Set background image
    [self.headerButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateNormal];
    [self.headerButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
    //Set rotation pattern
    self.headerButton.imageView.contentMode = UIViewContentModeCenter;
    self.headerButton.imageView.clipsToBounds = NO;
    [self.contentView addSubview:headerButton];
    
    //Add a online Label into headr button
    UILabel *onlineLabel = [UILabel new];
    onlineLabel.textAlignment = NSTextAlignmentRight;
    self.onlineLabel = onlineLabel;
    [headerButton addSubview:onlineLabel];
}
//Set frame
- (void)layoutSubviews {
    [super layoutSubviews];
    self.headerButton.frame = self.contentView.bounds;
    CGFloat onlineLableWidth = 100;
    CGFloat onlineLableHeight = 30;
    CGFloat onlineLableX = self.headerButton.frame.size.width-onlineLableWidth-20;
    CGFloat onlineLableY = (self.headerButton.frame.size.height-onlineLableHeight)/2;
    self.onlineLabel.frame = CGRectMake(onlineLableX, onlineLableY, onlineLableWidth, onlineLableHeight);
}
//setup model
- (void)setGroup:(GroupModel *)groupModel {
    _group = groupModel;
    [self.headerButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
    [self.headerButton setTitle:groupModel.name forState:UIControlStateNormal];
    self.onlineLabel.text = [NSString stringWithFormat:@"%ld/%ld",groupModel.online,groupModel.friends.count];
}

//Write a method which rotate the image view on this button
- (void)rotateImage {
    self.headerButton.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
}
//Rewite the setting method for angleDirection
- (void)setAngleDirection:(TriangleDirection)angleDirection {
    _angleDirection = angleDirection;
    if (_angleDirection == triangleDirectionToButton) {
        [self rotateImage];
    }
}
//Implementation the method of click headerview button
- (void)didClickHeaderViewButton:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(sectionHeader:didClickHeaderViewButton:)]) {
        [self.delegate sectionHeader:self didClickHeaderViewButton:button];
    }
}
@end
