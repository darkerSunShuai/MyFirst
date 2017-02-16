//
//  SignCalendarCell.h
//  Unionp
//
//  Created by 刘星宇 on 16/9/6.
//  Copyright © 2016年 vanhelp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignCalendarCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *calendarLbl;

- (void)getDataWithArr:(NSArray *)arr
                 index:(NSIndexPath *)indexPath
                   dic:(NSMutableDictionary *)dic;


@end
