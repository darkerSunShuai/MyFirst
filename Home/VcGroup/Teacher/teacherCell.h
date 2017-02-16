//
//  teacherCell.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/9.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface teacherCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *term;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btbDis;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *distance;

@end
