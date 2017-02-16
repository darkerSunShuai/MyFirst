//
//  CheckOnViewController.h
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/24.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//


#import "RootViewController.h"
@interface CheckOnViewController : RootViewController
@property (weak, nonatomic) IBOutlet UIButton *dataAnalysis;
@property (weak, nonatomic) IBOutlet UIButton *historicRecords;
@property (weak, nonatomic) IBOutlet UIButton *checkMoon;
@property (weak, nonatomic) IBOutlet UICollectionView *calendarCollectionView;
//三个按钮view距离底部的距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewToBtom;
//背景View的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeigh;
//按钮距上部的距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonToTop;

@end
