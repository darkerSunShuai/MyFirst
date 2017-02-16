//
//  PayHistoryCell.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/5.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UILabel *classL;
@property (weak, nonatomic) IBOutlet UILabel *detL;
@property (weak, nonatomic) IBOutlet UIButton *lookB;
@property(nonatomic,strong)void(^lookDet)();
@end
