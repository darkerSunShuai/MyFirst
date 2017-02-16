//
//  TimeTableVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/10.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "TimeTableVc.h"

@interface TimeTableVc ()

@end

@implementation TimeTableVc

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
 if ([self.title isEqualToString:@"作息时间"]) {
        self.myImageView.image = [UIImage imageNamed:@"TimeTable.jpg"];
    }else if([self.title isEqualToString:@"办公电话"])
    {
        self.myImageView.image = [UIImage imageNamed:@"iph.jpg"];
    }else
    {
        self.myImageView.image = [UIImage imageNamed:@"car.jpg"];
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
