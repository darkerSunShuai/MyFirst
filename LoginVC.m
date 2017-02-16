//
//  loginVC.m
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/22.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import "LoginVC.h"
#import "HomePageController.h"
#import "NavController.h"
#import "MyTabBarCr.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    // Do any additional setup after loading the view from its nib.
    self.bt.backgroundColor=[UIColor redColor];
}
-(void)creatUI
{
    if ([UIScreen mainScreen].bounds.size.width < 375) {
        _topHigh.constant = 100;
        _fTopHigh.constant = 80;
        _lTopHigh.constant = 126;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginBt:(UIButton *)sender {
//    HomePageController *vc = [[HomePageController alloc]init];
//    NavController * nav = [[NavController alloc]initWithRootViewController:vc];
//    nav.view.backgroundColor=[UIColor whiteColor];
    MyTabBarCr *myTab = [[MyTabBarCr alloc]init];
    [self presentViewController: myTab animated:YES completion:^{
        nil;
    }];
}
- (IBAction)switch:(UISwitch *)sender {
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        NSLog(@"%d",isButtonOn);
    }else {
        NSLog(@"%d",isButtonOn);
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_account resignFirstResponder];
    [_psw resignFirstResponder];
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
