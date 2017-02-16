//
//  NoticeTableViewCell.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/3.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "NoticeTableViewCell.h"

@implementation NoticeTableViewCell

#define rgb [UIColor colorWithRed:236.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:1.0];

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
