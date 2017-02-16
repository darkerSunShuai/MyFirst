//
//  HomePageController.h
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/22.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//


#import "RootViewController.h"
@interface HomePageController : RootViewController
@property(nonatomic,assign)NSInteger tabHi;
@property (weak, nonatomic) IBOutlet UIScrollView *imgSc;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeighToTop;

@end
