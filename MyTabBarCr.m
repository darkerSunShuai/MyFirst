//
//  MyTabBarCr.m
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/25.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import "MyTabBarCr.h"
#import "HomePageController.h"
#import "NavController.h"
#import "buttonBar.h"
#import "PersonInformationVc.h"
#import "AcademicInformationVc.h"
#import "NoticeVc.h"
#import "ClassScheduleController.h"
#import "TodayHwVC.h"
#import "GradeManagerVC.h"
#import "TeacherVc.h"
#import "CheckOnViewController.h"
#import "InstantMessagingVc.h"
#import "SchoolBroadcastVc.h"
#import "PaymentReminderVc.h"
#import "QuestionNaireVc.h"
#import "MapVc.h"
#import "PersonInformationVcS.h"

#define rgb [UIColor colorWithRed:236.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:1.0];

@interface MyTabBarCr ()
{
        NSMutableArray *btnArray;
        //tabbar按钮类
        buttonBar *barbt1;
        buttonBar *barbt2;
        buttonBar *barbt3;
        buttonBar *barbt4;
        buttonBar *barbt5;
        //每个按钮的跟踪布尔变量
        BOOL b1;
        BOOL b2;
        BOOL b3;
        BOOL b4;
        BOOL b5;

}
@end

@implementation MyTabBarCr

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    HomePageController *hvc = [[HomePageController alloc] init];
    //RootViewController * root = [[hvc.superclass alloc]init];
   [hvc.view setBackgroundColor:[UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:240.0/255.0 alpha:1.0]];
    NavController *nav = [[NavController alloc] initWithRootViewController:hvc];
    nav.navigationBar.translucent = NO;
    nav.navigationItem.backBarButtonItem.title = @"返回";
    self.tabBarController.tabBar.translucent = NO;
    self.viewControllers=@[nav];
   
    b1 = YES;
    b2 = YES;
    b3 = YES;
    b4 = YES;
    b5 = YES;
    //删除原来的tabbar
    CGRect rect = self.tabBar.frame;
    NSLog(@"我是tab的高度：%lf",rect.size.height);
    [self.tabBar removeFromSuperview];
    
    _myView = [[UIView alloc] init];
    
    _myView.frame = CGRectMake(rect.origin.x, rect.origin.y+8, rect.size.width, 41);
    
    hvc.tabHi = _myView.frame.size.height;
    
    _myView.tag = 3000;
    
    [self.view addSubview:_myView];
    [self cteatBarButton];
    //背景
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _myView.frame.size.height)];
    [imv setImage:[UIImage imageNamed:@"t2.jpg"]];
    _myView.backgroundColor = rgb;
    [_myView addSubview:imv];
    //NSArray *arr = @[@"信息",@"学习",@"互动",@"其他",@"安全"];
    NSArray *arr = @[@"",@"",@"",@"",@""];
    
    for (int i = 0; i < 5; i++)
    {
        _tab = [UIButton buttonWithType:UIButtonTypeCustom];
        
        float width = [UIScreen mainScreen].bounds.size.width/5;
        
        _tab.frame = CGRectMake(i*width, 0,width , rect.size.height);
        
        [_tab setTitle: arr[i] forState:UIControlStateNormal];
        _tab.backgroundColor=[UIColor clearColor];
        _tab.tag = i;
        
        [_tab addTarget:self action:@selector(itemButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_myView addSubview:_tab];
        
        [self->btnArray addObject:_tab];
    }
}
#pragma 自定义tabbat底部按钮
-(void)itemButtonClick:(UIButton *)btn
{
    NSLog(@"子类中的。。。");
    switch (btn.tag)
    {
        case 0:
        {
            NSLog(@"选中了第%ld个",(long)btn.tag);
            if(b1){
                //将其他按钮类移除,随后自己再出现。
                [self removeBtView];
                [self.view addSubview:barbt1];
                NSLog(@"信息出现");
                b1 = NO;
            }else{
                for (UIView *subviews in [self.view subviews]) {
                    if (subviews.tag==1001) {
                        [subviews removeFromSuperview];
                    }
                }
                NSLog(@"信息消失");
                b1 = YES;
            }

        }
            break;
        case 1:
        {
            NSLog(@"选中了第%ld个",(long)btn.tag);
            if(b2){
                //将其他按钮类移除,随后自己再出现。
                [self removeBtView];
                [self.view addSubview:barbt2];
                NSLog(@"学习出现");
                b2 = NO;
            }else{
                for (UIView *subviews in [self.view subviews]) {
                    if (subviews.tag==1002) {
                        [subviews removeFromSuperview];
                    }
                }
                NSLog(@"学习消失");
                b2 = YES;
            }

        }
            break;
        case 2:
        {
            NSLog(@"选中了第%ld个",(long)btn.tag);
            if(b3){
                //将其他按钮类移除,随后自己再出现。
                [self removeBtView];
                [self.view addSubview:barbt3];
                NSLog(@"互动出现");
                b3 = NO;
            }else{
                for (UIView *subviews in [self.view subviews]) {
                    if (subviews.tag==1003) {
                        [subviews removeFromSuperview];
                    }
                }
                NSLog(@"互动消失");
                b3 = YES;
            }

        }
            break;
        case 3:
        {
            NSLog(@"选中了第%ld个",(long)btn.tag);
            if(b4){
                //将其他按钮类移除,随后自己再出现。
                [self removeBtView];
                [self.view addSubview:barbt4];
                NSLog(@"其他出现");
                b4 = NO;
            }else{
                for (UIView *subviews in [self.view subviews]) {
                    if (subviews.tag==1004) {
                        [subviews removeFromSuperview];
                    }
                }
                NSLog(@"其他消失");
                b4 = YES;
            }

        }
            break;
        case 4:
        {
            NSLog(@"选中了第%ld个",(long)btn.tag);
            if(b5){
                //将其他按钮类移除,随后自己再出现。
                [self removeBtView];
                [self.view addSubview:barbt5];
                NSLog(@"安全出现");
                b5 = NO;
            }else{
                for (UIView *subviews in [self.view subviews]) {
                    if (subviews.tag==1005) {
                        [subviews removeFromSuperview];
                    }
                }
                NSLog(@"安全消失");
                b5 = YES;
            }

        }
            break;

        default:
            break;
    }
}
#pragma 每次点击底部按钮都要先清空按钮的view
- (void)removeBtView{
    //每次点击按钮要将按钮弹出累的view移除
    for (UIView *subviews in [self.view subviews]) {
        for (int i = 1; i <= 5; i++) {
            if (subviews.tag==1000+i) {
                [subviews removeFromSuperview];
            }
        }
    }
    b1 = YES;
    b2 = YES;
    b3 = YES;
    b4 = YES;
    b5 = YES;
}
-(void)cteatBarButton
{
    CGRect r = [UIScreen mainScreen].bounds;
    //实例化并设置自己封装按钮的view的tag
    barbt1 = [[buttonBar alloc]init];
    [barbt1 setTag:1001];
    //现设置按钮的tag，方便后期找按钮方便
    barbt1.home = self;
    [barbt1 creatBt:@"信息.png" andwithArray:@[@"个人信息",@"教务信息",@"通知公告"] andWith:CGRectMake(0,r.size.height-41, r.size.width/5, 44)];
    
    barbt2 = [[buttonBar alloc]init];
    [barbt2 setTag:1002];
    //现设置按钮的tag，方便后期找按钮方便
    barbt2.home = self;
    [barbt2 creatBt:@"学习.png" andwithArray:@[@"课程表",@"作业管理",@"成绩管理",@"教师评语"] andWith:CGRectMake(r.size.width/5,r.size.height-41, r.size.width/5, 44)];
    
    barbt3 = [[buttonBar alloc]init];
    [barbt3 setTag:1003];
    //现设置按钮的tag，方便后期找按钮方便
    barbt3.home = self;
    [barbt3 creatBt:@"互动.png" andwithArray:@[@"考勤管理",@"即时通讯",@"亲情对话"] andWith:CGRectMake(r.size.width/5*2,r.size.height-41, r.size.width/5, 44)];
    
    barbt4 = [[buttonBar alloc]init];
    [barbt4 setTag:1004];
    //现设置按钮的tag，方便后期找按钮方便
    
    barbt4.home = self;
    [barbt4 creatBt:@"其他.png" andwithArray:@[@"网上缴费",@"校园动态",@"调查问卷"] andWith:CGRectMake(r.size.width/5*3,r.size.height-41, r.size.width/5, 44)];
    
    barbt5 = [[buttonBar alloc]init];
    [barbt5 setTag:1005];
    barbt5.home = self;
    //最后一个
    barbt5.isTheLast = YES;
    [barbt5 creatBt:@"安全.png" andwithArray:@[@"围栏设置",@"GPS地图定位",@"路线轨迹回放",@"远程监听"] andWith:CGRectMake(r.size.width/5*4,r.size.height-41, r.size.width/5, 44)];
    
}
#pragma 伪代理方法
-(void)button:(UIButton *)button{
    
    UINavigationController *nav =  (UINavigationController *)self.viewControllers.firstObject;
    NSLog(@"view ........home    中的buttonclick%@",button.titleLabel.text);
    if ([button.titleLabel.text  isEqual: @"个人信息"]) {
        NSLog(@"1313132");
        if (ScreenW < 375) {
            PersonInformationVcS *personI = [[PersonInformationVcS alloc]init];
            [nav pushViewController:personI animated:YES];
        }else{
            PersonInformationVc *personI = [[PersonInformationVc alloc]init];
            [nav pushViewController:personI animated:YES];
        }
    }
    if ([button.titleLabel.text  isEqual: @"教务信息"]) {
        AcademicInformationVc *adc = [[AcademicInformationVc alloc]init];
        [nav pushViewController:adc animated:YES];
    }
    if ([button.titleLabel.text  isEqual: @"通知公告"]) {
        NoticeVc * notice = [[NoticeVc alloc]init];
        [nav pushViewController:notice animated:YES];
    }
    if ([button.titleLabel.text  isEqual: @"课程表"]) {
        ClassScheduleController *class = [[ClassScheduleController alloc]init];
        class.title = @"课程表";
        [nav pushViewController:class animated:YES];
        NSLog(@"课程管理");
    }
    if ([button.titleLabel.text  isEqual: @"作业管理"]) {
        TodayHwVC *today = [[TodayHwVC alloc]init];
        [nav pushViewController:today animated:YES];
        NSLog(@"课程管理");
    }
    if ([button.titleLabel.text  isEqual: @"成绩管理"]) {
        GradeManagerVC * grade = [[GradeManagerVC alloc]init];
        [nav pushViewController:grade animated:YES];
        NSLog(@"成绩");
    }
    if ([button.titleLabel.text  isEqual: @"教师评语"]) {
        TeacherVc * teacher = [[TeacherVc alloc]init];
        teacher.title = @"教师评语";
        [nav pushViewController:teacher animated:YES];
        NSLog(@"教师");
    }
    if ([button.titleLabel.text  isEqual: @"考勤管理"]) {
        CheckOnViewController * checkVc = [[CheckOnViewController alloc]init];
        [nav pushViewController:checkVc animated:YES];
    }
    if ([button.titleLabel.text  isEqual: @"即时通讯"]) {
        InstantMessagingVc *instant = [[InstantMessagingVc alloc]init];;
        [nav pushViewController:instant animated:YES];
    }
    if ([button.titleLabel.text  isEqual: @"校园动态"]) {
        SchoolBroadcastVc *campusVc = [[SchoolBroadcastVc alloc]init];
        [nav pushViewController:campusVc animated:YES];
        NSLog(@"校园");
    }
    if ([button.titleLabel.text  isEqual: @"网上缴费"]) {
        PaymentReminderVc *webPay = [[PaymentReminderVc alloc]init];
        [nav pushViewController:webPay animated:YES];
        NSLog(@"网上缴费");
    }
    if ([button.titleLabel.text  isEqual: @"调查问卷"]) {
        QuestionNaireVc *questionVc = [[QuestionNaireVc alloc]init];
        [nav pushViewController:questionVc animated:YES];
        NSLog(@"调查");
    }
    if ([button.titleLabel.text  isEqual: @"GPS地图定位"]) {
        MapVc * map = [[MapVc alloc]init];
        map.title = @"GPS地图定位";
        [nav pushViewController:map animated:YES];
    }
    if ([button.titleLabel.text  isEqual: @"围栏设置"]) {
    }
    [self removeBtView];
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
