//
//  buttonBar.h
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/23.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageController.h"
@class MyTabBarCr;
@interface buttonBar : UIView
@property(nonatomic,assign)BOOL isTheLast;
@property(nonatomic,strong)MyTabBarCr * home;
@property(nonatomic,assign)NSInteger tabHi;
-(void)creatBt:(NSString *)mode andwithArray:(NSArray *)array andWith:(CGRect) rect;
@end
