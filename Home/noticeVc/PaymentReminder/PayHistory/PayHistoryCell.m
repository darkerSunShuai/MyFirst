//
//  PayHistoryCell.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/5.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "PayHistoryCell.h"

@implementation PayHistoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    // Initialization code
}
#pragma mark - 查看详情
- (IBAction)lookB:(UIButton *)sender {
    if (self.lookDet) {
        self.lookDet();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
