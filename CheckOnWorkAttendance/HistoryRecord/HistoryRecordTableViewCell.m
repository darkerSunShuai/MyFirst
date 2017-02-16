//
//  HistoryRecordTableViewCell.m
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/28.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import "HistoryRecordTableViewCell.h"

#define rgb [UIColor colorWithRed:236.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:1.0];

@implementation HistoryRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.view.automaticallyAdjustsScrollViewInsets = NO;
    self.backgroundColor = rgb;
    if ([UIScreen mainScreen].bounds.size.width < 375) {
        _bWeight.constant = 80;
        _bHeight.constant = 15;
        _buttonS.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
