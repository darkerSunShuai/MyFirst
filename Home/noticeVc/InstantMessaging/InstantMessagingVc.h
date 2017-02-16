//
//  InstantMessagingVc.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/5.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//


#import "RootViewController.h"
@interface InstantMessagingVc : RootViewController<UISearchControllerDelegate,UISearchResultsUpdating>
@property (weak, nonatomic) IBOutlet UIScrollView *bacSc;
@property (weak, nonatomic) IBOutlet UIView *bView;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property(nonatomic ,strong)NSArray * dataSource1;
@property(nonatomic,strong)NSArray * dataSource2;
@property (nonatomic ,strong)NSMutableArray *exampleArr;
@property (nonatomic ,strong)NSMutableArray *searchArr;
@property (nonatomic ,strong)UISearchController *searchVC1;
@property (nonatomic ,strong)UISearchController *searchVC;

@end
