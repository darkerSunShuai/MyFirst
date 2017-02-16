//
//  GradeManagerCell.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/9.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "GradeManagerCell.h"

@implementation GradeManagerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    // Initialization code
}
- (IBAction)examManager:(id)sender {
    if(_exam)
    {
        self.exam();
    }
}
- (IBAction)gradeP:(id)sender {
    if (_grade) {
        _grade();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
