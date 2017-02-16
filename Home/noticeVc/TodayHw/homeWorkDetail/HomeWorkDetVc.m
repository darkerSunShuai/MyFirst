//
//  HomeWorkDetVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/4.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "HomeWorkDetVc.h"
#import "ZZCircleProgress.h"


#define ZZRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface HomeWorkDetVc ()

@end

@implementation HomeWorkDetVc
{
    ZZCircleProgress *circle1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    // Do any additional setup after loading the view from its nib.
}
-(void)creatUI
{
    self.title = @"XXX作业";
    UILabel *rightL = [[UILabel alloc]initWithFrame:CGRectMake(self.navigationController.navigationBar.frame.size.width/4*3+10, self.navigationController.navigationBar.frame.size.height/2-10, self.navigationController.navigationBar.frame.size.width/4, 20)];
    //rightL.backgroundColor = [UIColor orangeColor];
    [rightL setText:@"2016.06.06"];
    UIFont * f = [UIFont systemFontOfSize:13.0];
    [rightL setFont:f];
    rightL.tag = 1100;
    [self.navigationController.navigationBar addSubview:rightL];
    CGFloat xCrack = (ScreenW-150)/2;
    CGFloat yCrack =(ScreenH-150)/2-100;
    
    
    
    CGFloat itemWidth = 150;
    if (ScreenW < 375) {
        yCrack = _viewHeight.constant+10;

    }
    
    //默认状态
    circle1 = [[ZZCircleProgress alloc] initWithFrame:CGRectMake(xCrack, yCrack, itemWidth, itemWidth) pathBackColor:[UIColor yellowColor] pathFillColor:[UIColor greenColor] startAngle:90 strokeWidth:10];
    circle1.progress = 0.65;
    circle1.animationModel = CircleIncreaseSameTime;
    //circle1.reduceValue = 30;
    [self.view addSubview:circle1];
    
    //设置label的位置
    self.rL1.frame = CGRectMake((ScreenW-150)/2-48-30,(ScreenH-150)/2-25, 48, 21);
    self.rL2.frame = CGRectMake((ScreenW-150)/2-40,(ScreenH-150)/2-25,40, 21);
    self.wL1.frame = CGRectMake((ScreenW-150)/2-48-30+150+78,(ScreenH-150)/2-25, 48, 21);
    self.wL2.frame = CGRectMake((ScreenW-150)/2-40+150+78,(ScreenH-150)/2-25,40, 21);
    self.tL1.frame = CGRectMake((ScreenW-168)/2,(ScreenH-150)/2+60,168,21);
    self.tL2.frame = CGRectMake((ScreenW-168)/2+168-42,(ScreenH-150)/2+60,42,21);
    self.cL1.frame = CGRectMake((ScreenW-91)/4,(ScreenH-150)/2+90,91,21);
    self.cL2.frame = CGRectMake((ScreenW-91)/4+91-25,(ScreenH-150)/2+90,42,21);
    self.ccL1.frame = CGRectMake((ScreenW-91)/4*3, (ScreenH-150)/2+90, 59, 21);
    self.CcL2.frame = CGRectMake((ScreenW-91)/4*3+55, (ScreenH-150)/2+90, 42, 21);
    self.teacL1.frame = CGRectMake((ScreenW-150)/2-48-30, (ScreenH-150)/2+120, 107, 36);
    //self.teacL2.frame = CGRectMake((ScreenW-150)/2-48-30+110, (ScreenH-150)/2+120, 107, 36);
    if (ScreenW < 375) {
        self.rL1.frame = CGRectMake((ScreenW-150)/2-48-30,(ScreenH-150)/2-15, 48, 21);
        self.rL2.frame = CGRectMake((ScreenW-150)/2-40,(ScreenH-150)/2-15,40, 21);
        self.wL1.frame = CGRectMake((ScreenW-150)/2-48-30+150+78,(ScreenH-150)/2-15, 48, 21);
        self.wL2.frame = CGRectMake((ScreenW-150)/2-40+150+78,(ScreenH-150)/2-15,40, 21);
        self.tL1.frame = CGRectMake((ScreenW-168)/2,(ScreenH-150)/2+70,168,21);
        self.tL2.frame = CGRectMake((ScreenW-168)/2+168-42,(ScreenH-150)/2+70,42,21);
        self.cL1.frame = CGRectMake((ScreenW-91)/4,(ScreenH-150)/2+100,91,21);
        self.cL2.frame = CGRectMake((ScreenW-91)/4+91-25,(ScreenH-150)/2+100,42,21);
        self.ccL1.frame = CGRectMake((ScreenW-91)/4*3, (ScreenH-150)/2+100, 59, 21);
        self.CcL2.frame = CGRectMake((ScreenW-91)/4*3+55, (ScreenH-150)/2+100, 42, 21);
        self.teacL1.frame = CGRectMake((ScreenW-150)/2-48-30, (ScreenH-150)/2+130, 107, 36);
        //self.teacL2.frame = CGRectMake((ScreenW-150)/2-48-30+110, (ScreenH-150)/2+130, 107, 36);

    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    UILabel * la = [self.navigationController.navigationBar viewWithTag:1100];
    [la removeFromSuperview];
//    for (UIView *view in [self.view subviews]) {
//        if (view.tag == 1100) {
//            [view removeFromSuperview];
//        }
//    }
}
-(void)viewWillAppear:(BOOL)animated
{
    circle1.progress = 0.65;
    UILabel * la = [self.navigationController.navigationBar viewWithTag:1100];
    [self.navigationController.navigationBar addSubview:la];
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
