//
//  GradeManagerVC.h
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/26.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//


#import "RootViewController.h"
@interface GradeManagerVC : RootViewController
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIButton *recentlyExam;
@property (weak, nonatomic) IBOutlet UIButton *dataAny;
@property (weak, nonatomic) IBOutlet UIButton *historyRecord;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonToTop;

@end
