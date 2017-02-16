//
//  teacherCell.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/9.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "teacherCell.h"
#import "MyHeader.h"

@implementation teacherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    if(ScreenW < 375)
    {
        _btbDis.constant = 15;
        _distance.constant = 5;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
