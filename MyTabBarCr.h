//
//  MyTabBarCr.h
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/25.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarCr : UITabBarController
@property(nonatomic,strong)UIView * myView;
@property(nonatomic,strong)UIButton * tab;
-(void)removeBtView;
@end
