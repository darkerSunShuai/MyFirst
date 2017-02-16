//
//  SignCalendarCell.m
//  Unionp
//
//  Created by 刘星宇 on 16/9/6.
//  Copyright © 2016年 vanhelp. All rights reserved.
//

#import "SignCalendarCell.h"

@implementation SignCalendarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)getDataWithArr:(NSArray *)arr
                 index:(NSIndexPath *)indexPath
                   dic:(NSMutableDictionary *)dic
{
    
            
        NSInteger _weekDay = [[dic valueForKey:@"weekDay"] integerValue];
        NSInteger _days = [[dic valueForKey:@"days"] integerValue];
        NSInteger _todayDate = [[dic valueForKey:@"todayDate"] integerValue];
       // NSInteger _lastMonthDays = [[dic valueForKey:@"lastMonthDays"] integerValue];
        if (indexPath.row < 7) {
            self.calendarLbl.text = arr[indexPath.row];
        }else if (indexPath.row >= 6 + _weekDay && indexPath.row < 6 + _weekDay + _days){
            self.calendarLbl.text = [NSString stringWithFormat:@"%ld",indexPath.row - 6 - _weekDay + 1];
            if ([self.calendarLbl.text integerValue] == _todayDate) {
                 if ([[dic valueForKey:@"haveColor"] isEqualToString:@"NO"]) {
                    self.calendarLbl.backgroundColor = [UIColor clearColor];

                }else{
                    self.calendarLbl.backgroundColor = [UIColor colorWithRed:249 / 255.0 green:111 / 255.0 blue:86 / 255.0 alpha:1];
                }
            }
        }else if (indexPath.row >= 6 + _weekDay + _days){
            self.calendarLbl.text = @"";
        }else{
            self.calendarLbl.text = @"";
            
        }
  
 
  }
@end
