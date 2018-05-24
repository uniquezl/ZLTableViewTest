//
//  GroupModel.h
//  ZLTableViewTest
//
//  Created by zhulin on 2018/5/23.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject

@property (nonatomic, assign) BOOL sectionDisplay;
@property (nonatomic, strong) NSArray * friends;
@property (nonatomic, assign) NSInteger online;
@property (nonatomic, copy) NSString * name;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

+ (instancetype)FriendGroupWithDictionary:(NSDictionary *)dict;

@end
