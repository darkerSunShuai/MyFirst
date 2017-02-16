//
//  NewHisCell.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/6.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "NewHisCell.h"

@implementation NewHisCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)searchBt:(UIButton *)sender {
    if (self.searchBtClick) {
        self.searchBtClick();
    }
}

@end
