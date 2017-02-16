//
//  DateToolSelf.m
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/30.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import "DateToolSelf.h"

@implementation DateToolSelf

// 获取当前月份的天数
+ (NSInteger)howManyDaysInThisMonth
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger year = [dateComponent year];
    NSInteger imonth = [dateComponent month];
    if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12)){
        return 31 ;
    }
    if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11)){
        return 30;
    }
    if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
    {
        return 28;
    }
    if(year%400 == 0){
        return 29;
    }
    if(year%100 == 0){
        
        return 28;
    }
    return 29;
}
+(NSString *)getNowyearMonth
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger year = [dateComponent year];
    NSInteger imonth = [dateComponent month];
    return imonth >= 10 ? [NSString stringWithFormat:@"%ld-%ld",year,imonth]:[NSString stringWithFormat:@"%ld-0%ld",year,imonth];
}
+(NSString *)getYearMonth:(BOOL)jia yearMonthStr:(NSString *)str
{
    NSDateFormatter *fmt2 = [[NSDateFormatter alloc] init];
    fmt2.dateFormat = @"yyyy-MM";
    NSDate *now = [fmt2 dateFromString:[NSString stringWithFormat:@"%@",str]];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger year = [dateComponent year];
    NSInteger imonth = [dateComponent month];
    if (jia) {
        if (imonth == 12) {
            year = year+1;
            imonth = 1;
        }else{
            imonth = imonth +1;
        }
    }else{
        if (imonth ==1) {
            year = year-1;
            imonth = 12;
        }else{
            imonth = imonth-1;
        }}
    return imonth >= 10 ? [NSString stringWithFormat:@"%ld-%ld",year,imonth]:[NSString stringWithFormat:@"%ld-0%ld",year,imonth];
}
//获取当天星期几
+ (NSInteger)whatWeekToday
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSUInteger unitFlags = NSCalendarUnitWeekday;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger week = [dateComponent weekday];
    return week;
}

+ (NSInteger) whatWeekThisMonth
{
    NSInteger weekToday = [self whatWeekToday];
    NSInteger dayToday = [self whatDayToday];
    NSInteger i = dayToday % 7;
    NSInteger j = weekToday - i + 1;
    if (!(j > 0)) {
        j = j + 7;
    }
    return j;
}

// 当天日期
+ (NSInteger) whatDayToday
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSUInteger unitFlags = NSCalendarUnitDay;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger day = [dateComponent day];
    return day;
}

+ (NSInteger) howManyDaysLastMonth
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger year = [dateComponent year];
    NSInteger imonth = [dateComponent month];
    if (imonth > 1) {
        imonth = imonth - 1;
        if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)){
            return 31 ;
        }
        if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11)){
            return 30;
        }
        if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
        {
            return 28;
        }
        if(year%400 == 0){
            return 29;
        }
        if(year%100 == 0){
            
            return 28;
        }
        return 29;
    }else{
        return 31;
    }
}

+ (NSMutableDictionary *)getCalendarDic:(NSString *)str
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSDate *now;
    if (![str isEqualToString:@""]) {
        NSDateFormatter *fmt2 = [[NSDateFormatter alloc] init];
        fmt2.dateFormat = @"yyyy-MM";
        now = [fmt2 dateFromString:[NSString stringWithFormat:@"%@",str]];
        [dic setValue:@"NO" forKey:@"haveColor"];
    }else{
        now = [NSDate date];
        [dic setValue:@"Yes" forKey:@"haveColor"];
    }
    if ([[self getNowyearMonth] isEqualToString:str]) {
        now = [NSDate date];
        [dic setValue:@"Yes" forKey:@"haveColor"];
    }
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger weekToday = [dateComponent weekday];
    NSInteger dayToday = [dateComponent day];
    [dic setValue:[NSNumber numberWithInteger:dayToday] forKey:@"todayDate"];
    NSInteger i = dayToday % 7;
    // 当月初星期几
    NSInteger j = weekToday - i + 1;
    if (!(j > 0)) {
        j = j + 7;
    }
    [dic setValue:[NSNumber numberWithInteger:j] forKey:@"weekDay"];
    
    // 当月天数
    NSInteger year = [dateComponent year];
    NSInteger imonth = [dateComponent month];
    if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12)){
        [dic setValue:[NSNumber numberWithInteger:31] forKey:@"days"];
    }else if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11)){
        [dic setValue:[NSNumber numberWithInteger:30] forKey:@"days"];
    }else if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
    {
        [dic setValue:[NSNumber numberWithInteger:28] forKey:@"days"];
    }else if(year%400 == 0){
        [dic setValue:[NSNumber numberWithInteger:29] forKey:@"days"];
    }else if(year%100 == 0){
        
        [dic setValue:[NSNumber numberWithInteger:28] forKey:@"days"];
    }else{
        [dic setValue:[NSNumber numberWithInteger:29] forKey:@"days"];
    }
    
    // 上月天数
    if (imonth > 1) {
        imonth = imonth - 1;
        if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)){
            [dic setValue:[NSNumber numberWithInteger:31] forKey:@"lastMonthDays"];
        }else if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11)){
            [dic setValue:[NSNumber numberWithInteger:30] forKey:@"lastMonthDays"];
        }else if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
        {
            [dic setValue:[NSNumber numberWithInteger:28] forKey:@"lastMonthDays"];
        }else if(year%400 == 0){
            [dic setValue:[NSNumber numberWithInteger:29] forKey:@"lastMonthDays"];
        }else if(year%100 == 0){
            
            [dic setValue:[NSNumber numberWithInteger:28] forKey:@"lastMonthDays"];
        }else{
            [dic setValue:[NSNumber numberWithInteger:29] forKey:@"lastMonthDays"];
        }
    }else{
        [dic setValue:[NSNumber numberWithInteger:31] forKey:@"lastMonthDays"];
    }
    return dic;
}


@end
