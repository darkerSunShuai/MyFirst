//
//  NoticeTableViewCell.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/3.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *ntitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftTo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightTo;

@end
