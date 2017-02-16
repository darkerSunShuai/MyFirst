//
//  GradeManagerCell.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/9.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradeManagerCell : UITableViewCell
@property(nonatomic,strong)void(^exam)();
@property(nonatomic,strong)void(^grade)();
@end
