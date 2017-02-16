//
//  NewHisCell.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/6.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewHisCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dataL;
@property (weak, nonatomic) IBOutlet UILabel *classL;
@property (weak, nonatomic) IBOutlet UILabel *typeL;
@property (weak, nonatomic) IBOutlet UIButton *searchBt;
@property(nonatomic,strong)void(^searchBtClick)();
@end
