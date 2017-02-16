//
//  HistoryRecordTableViewCell.h
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/28.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryRecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bWeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bHeight;
@property (weak, nonatomic) IBOutlet UIButton *buttonS;

@end
