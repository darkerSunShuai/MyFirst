//
//  leaveVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/3.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "leaveVc.h"

@interface leaveVc ()

@end

@implementation leaveVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    // Do any additional setup after loading the view from its nib.
}
#pragma 创建页面
-(void)creatUI{
    self.title = @"请假申请";
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
