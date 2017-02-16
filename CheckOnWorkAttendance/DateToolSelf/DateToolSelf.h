//
//  DateToolSelf.h
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/30.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateToolSelf : NSObject
// 获取当前月份天数
+ (NSInteger) howManyDaysInThisMonth;

//获取当天星期几

+ (NSInteger) whatWeekToday;

// 获取当月初星期几
+ (NSInteger) whatWeekThisMonth;

// 获取当天日期
+ (NSInteger) whatDayToday;

// 获取上个月共多少天

+ (NSInteger) howManyDaysLastMonth;

+ (NSMutableDictionary *)getCalendarDic:(NSString *)str;
+(NSString *)getNowyearMonth;
+(NSString *)getYearMonth:(BOOL)jia yearMonthStr:(NSString *)str;

@end
