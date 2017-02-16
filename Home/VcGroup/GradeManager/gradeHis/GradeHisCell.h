//
//  GradeHisCell.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/9.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradeHisCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UILabel *classL;
@property (weak, nonatomic) IBOutlet UILabel *dataL;
@property(nonatomic,strong) void (^searchD)();

@end
