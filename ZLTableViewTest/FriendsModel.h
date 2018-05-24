//
//  FriendsModel.h
//  ZLTableViewTest
//
//  Created by zhulin on 2018/5/23.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendsModel : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL vip;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)FriendModelWithDictionary:(NSDictionary *)dict;

@end
