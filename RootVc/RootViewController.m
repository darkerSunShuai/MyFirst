//
//  RootViewController.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/20.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "RootViewController.h"




@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]init];
    bar.title = @"返回";
    self.navigationItem.backBarButtonItem = bar;
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
