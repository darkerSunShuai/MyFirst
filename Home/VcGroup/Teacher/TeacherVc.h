//
//  TeacherVc.h
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/26.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//


#import "RootViewController.h"
@interface TeacherVc : RootViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end
