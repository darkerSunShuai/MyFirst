//
//  MyHeader.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/2/6.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#ifndef MyHeader_h
#define MyHeader_h

#pragma mark - 通用的尺寸
#define TabbarHeight 41
#define NavBarHigh self.navigationController.navigationBar.frame.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

#pragma mark - 通用的背景颜色
#define rgb [UIColor colorWithRed:236.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:1.0];

#pragma mark - 三个按钮的背景高度是140 - 大屏幕的时候
#define ViewHigh 140
#define ButtonHigh 26

#pragma mark - 小屏幕的时候 分别是100和10
#define SViewHigh 100
#define SButtonHigh 10

#endif /* MyHeader_h */
