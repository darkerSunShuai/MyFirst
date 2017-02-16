//
//  ClassBroadcastVc.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/3.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "RootViewController.h"

@interface ClassBroadcastVc : RootViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIScrollView *contentSc;
@property (weak, nonatomic) IBOutlet UIButton *school;
@property (weak, nonatomic) IBOutlet UIButton *news;
@property (weak, nonatomic) IBOutlet UIButton *classD;
@property(nonatomic,strong)UITableView *table1;
@property(nonatomic,strong)UITableView *table2;
@property(nonatomic,strong)UITableView *table3;
@property(nonatomic,strong)NSMutableArray *array1;

@end
