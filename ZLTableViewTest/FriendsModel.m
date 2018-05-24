//
//  FriendsModel.m
//  ZLTableViewTest
//
//  Created by zhulin on 2018/5/23.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "FriendsModel.h"

@implementation FriendsModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)FriendModelWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

@end
