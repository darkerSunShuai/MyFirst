//
//  PayRemCell.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/4.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayRemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *payBt;
@property (weak, nonatomic) IBOutlet UIButton *payDetailBt;
@property(nonatomic,strong)void(^payBtClick)();
@property(nonatomic,strong)void(^payDetailBtClick)();
@property(nonatomic,strong)void(^webPay)();

@end
