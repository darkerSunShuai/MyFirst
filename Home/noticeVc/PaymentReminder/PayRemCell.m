//
//  PayRemCell.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/4.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "PayRemCell.h"
#import "MyHeader.h"

@implementation PayRemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    // Initialization code
}
#pragma mark - payButton
- (IBAction)payBt:(UIButton *)sender {
    if (self.payBt) {
        self.payBtClick();
    }
}
#pragma mark - parDetailButton
- (IBAction)payDetailBt:(id)sender {
    if (self.payDetailBtClick) {
        self.payDetailBtClick();
    }
}
- (IBAction)webPay:(id)sender {
    if (self.webPay) {
        self.webPay();
    }
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
