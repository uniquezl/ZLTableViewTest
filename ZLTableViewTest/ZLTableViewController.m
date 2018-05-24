//
//  ZLTableViewController.m
//  ZLTableViewTest
//
//  Created by zhulin on 2018/5/24.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "ZLTableViewController.h"
#import "FriendsCell.h"
#import "GroupModel.h"
#import "SectionHeader.h"

@interface ZLTableViewController ()<SectionHeaderDelegate>

@property (nonatomic, strong) NSArray * database;

@end

@implementation ZLTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerClass:[SectionHeader class] forHeaderFooterViewReuseIdentifier:@"section"];
    [self.tableView registerClass:[FriendsCell class] forCellReuseIdentifier:@"friend"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void) loadView
{

    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
}

- (NSArray *)database
{
    if (!_database)
    {
        NSBundle * mainBundle =[NSBundle mainBundle];
        NSString * plistPath = [mainBundle pathForResource:@"friends.plist" ofType:nil];
        NSArray * tempArray = [NSArray arrayWithContentsOfFile:plistPath];
        
        NSMutableArray * tmpArray = [NSMutableArray array];
        
        for (NSDictionary * dict in tempArray)
        {
            GroupModel * group = [GroupModel FriendGroupWithDictionary:dict];
            [tmpArray addObject:group];
        }
        
        _database = tmpArray;
    }
    return _database;
}

//Amount of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.database.count;
}

//Amount of rows in each section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupModel *groupModel = self.database[section];
    return groupModel.sectionDisplay? groupModel.friends.count : 0;
}
//Set section header view's height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
//Contents of each cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"friend";
    FriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    GroupModel *groupModel = self.database[indexPath.section];
    cell.friends = groupModel.friends[indexPath.row];
    return cell;
}

//Load header view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *identifier = @"section";
    SectionHeader *sectionHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    sectionHeader.group = self.database[section];
    sectionHeader.delegate = self;
    sectionHeader.tag = section;
    
    //TransformImage
    sectionHeader.angleDirection = sectionHeader.group.sectionDisplay?triangleDirectionToButton:triangleDirectionToRight;
    return sectionHeader;
}

//Implementation the delegate method of sectionHeader and monitor the event of click header view button
- (void)sectionHeader:(SectionHeader *)sectionHeader didClickHeaderViewButton:(UIButton *)button {
    GroupModel *groupModel = self.database[sectionHeader.tag];
    groupModel.sectionDisplay = !groupModel.sectionDisplay;
    //Renew data
    NSIndexSet *indexSetTemp = [NSIndexSet indexSetWithIndex:sectionHeader.tag];
    [self.tableView reloadSections:indexSetTemp withRowAnimation:UITableViewRowAnimationFade];
    //Set the direction of triangle image to button
    sectionHeader.angleDirection = triangleDirectionToButton;
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
