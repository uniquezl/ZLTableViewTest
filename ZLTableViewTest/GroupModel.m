//
//  GroupModel.m
//  ZLTableViewTest
//
//  Created by zhulin on 2018/5/23.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "GroupModel.h"
#import "FriendsModel.h"

@implementation GroupModel


- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray * tempArray = [NSMutableArray array];
        //dictionary weishenme yao zhuanhuan
        for (NSDictionary * dict in self.friends)
        {
            FriendsModel * friend = [FriendsModel FriendModelWithDictionary:dict];
            [tempArray addObject:friend];
        }
        self.friends = tempArray;
    }
    return self;
}

+ (instancetype)FriendGroupWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}


@end


