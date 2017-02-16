//
//  SchoolBroadcastVc.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/9.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
@interface SchoolBroadcastVc : RootViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UIScrollView *contentSc;
@property (weak, nonatomic) IBOutlet UIButton *school;
@property (weak, nonatomic) IBOutlet UIButton *news;
@property (weak, nonatomic) IBOutlet UIButton *classD;
@property(nonatomic,strong)UITableView *table1;
@property(nonatomic,strong)UITableView *table2;
@property(nonatomic,strong)UITableView *table3;
@property(nonatomic,strong)NSMutableArray *array1;
@end
