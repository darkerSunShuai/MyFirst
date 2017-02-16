//
//  payDetailVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/5.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "payDetailVc.h"

@interface payDetailVc ()

@end

@implementation payDetailVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatUI];
}
-(void)creatUI
{
    self.title = @"缴费明细";
    self.view.backgroundColor = rgb;
    if (ScreenW < 375) {
        _imgHeght.constant = 150;
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
