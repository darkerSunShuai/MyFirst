//
//  HisRedSViewController.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/6.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//


#import "RootViewController.h"
@interface HisRedSViewController : RootViewController<UITableViewDataSource,UITableViewDelegate,UISearchControllerDelegate,UISearchResultsUpdating>
@property (nonatomic ,strong)UISearchController *searchVC;
@property(nonatomic ,strong)UIView *tableHeaderView;
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic ,strong)NSArray * dataSource1;
@property(nonatomic,strong)NSArray * dataSource2;
@property (nonatomic ,strong)NSMutableArray *exampleArr;
@property (nonatomic ,strong)NSMutableArray *searchArr;
@property(nonatomic,assign)BOOL bt1;
@property(nonatomic,assign)BOOL bt2;
-(void)creatDataSource;
-(void)buttonClick:(UIButton *)button;


@end
