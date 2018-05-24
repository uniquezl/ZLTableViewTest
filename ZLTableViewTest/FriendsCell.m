//
//  FriendsCell.m
//  ZLTableViewTest
//
//  Created by zhulin on 2018/5/23.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "FriendsCell.h"


@implementation FriendsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//Rewite initial method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //Add a cell separator line
        UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.bounds.size.height-0.5, 375, 0.5)];
        separator.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:separator];
    }
    return self;
}
- (void)setFriends:(FriendsModel *)friendsModel {
   _friends = friendsModel;
    self.textLabel.text = friendsModel.name;
    self.detailTextLabel.text = friendsModel.intro;
    self.imageView.image = [UIImage imageNamed:friendsModel.icon];
    if (friendsModel.vip == 1) {
        self.textLabel.textColor = [UIColor redColor];
    } else {
        self.textLabel.textColor = [UIColor blackColor];
    }
}

@end
