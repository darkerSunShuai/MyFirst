//
//  facultyCell.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/10.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "facultyCell.h"

@implementation facultyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSLog(@"被创建");
   //    CGSize size = [self.introduceT sizeThatFits:CGSizeMake(self.introduceT.frame.size.width, MAXFLOAT)];
//    self.introduceT.frame =CGRectMake(120,49, 247, size.height);
}
-(void)cellAutoLayoutHeight:(NSString *)str
{
    self.introduceT.numberOfLines = 0;
    self.introduceT.lineBreakMode = NSLineBreakByCharWrapping;
    //self.introduceT.font = [UIFont systemFontOfSize:10];
    self.introduceT.adjustsFontSizeToFitWidth = YES;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
