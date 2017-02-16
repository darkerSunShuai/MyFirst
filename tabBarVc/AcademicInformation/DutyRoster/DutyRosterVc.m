//
//  DutyRosterVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/10.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "DutyRosterVc.h"

@interface DutyRosterVc ()

@end

@implementation DutyRosterVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self creatUI];
}
-(void)creatUI
{
    if ([self.title isEqualToString:@"本周值日表"]) {
        _bImg.image = [UIImage imageNamed:@"duty.jpg"];
    }else 
    {
        _bImg.image = [UIImage imageNamed:@"bbimg.jpg"];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
