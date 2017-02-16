//
//  loginVC.h
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/22.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *bt;
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *psw;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topHigh;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fTopHigh;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lTopHigh;

@end
