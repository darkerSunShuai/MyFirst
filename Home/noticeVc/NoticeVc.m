//
//  NoticeVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/26.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import "NoticeVc.h"
#import "NoticeTableViewCell.h"
#import "CheckOnViewController.h"
#import "ClassBroadcastVc.h"
#import "TodayHwVC.h"
#import "PaymentReminderVc.h"
#import "InstantMessagingVc.h"
#import "QuestionNaireVc.h"
#import "MyHeader.h"
//#define rgb [UIColor colorWithRed:236.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:1.0];

@interface NoticeVc ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *noticeTb;

@property(nonatomic,strong)NSArray *arrayData;

@property(nonatomic,strong)NSArray *vcArray;

@property(nonatomic,strong)CheckOnViewController *checkVc;

@property(nonatomic,strong)ClassBroadcastVc *classBc;

@property(nonatomic,strong)TodayHwVC *today;

@property(nonatomic,strong)PaymentReminderVc *pay;

@property(nonatomic,strong)InstantMessagingVc *insVc;

@property(nonatomic,strong)QuestionNaireVc *question;

@property(nonnull,strong)NSMutableArray * imgArray;
@end

@implementation NoticeVc
static NSString * CellID=@"noticeCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    // Do any additional setup after loading the view from its nib.
    [self creatUI];
    [self creatData];
    [self creatPVc];
    [self creatTb];
    
}
#pragma 创建跳转页面
-(void)creatPVc
{
    _checkVc = [[CheckOnViewController alloc]init];
    _classBc = [[ClassBroadcastVc alloc]init];
    _today = [[TodayHwVC alloc]init];
    _pay = [[PaymentReminderVc alloc]init];
    _insVc = [[InstantMessagingVc alloc]init];
    _question = [[QuestionNaireVc alloc]init];
}
#pragma 创建页面
-(void)creatUI
{
    self.title = @"通知公告";
}
#pragma 数据源
-(void)creatData
{
    _arrayData = @[@"到离校通知",@"班级广播",@"今日作业",@"缴费提醒",@"未读消息",@"调查问卷"];
    _imgArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i <= 5; i ++) {
        UIImage * imag = [UIImage imageNamed:[NSString stringWithFormat:@"n%d.jpg",i]];
        [_imgArray addObject:imag];
    }
}
#pragma  创建tableVIew
-(void)creatTb
{
    _noticeTb = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-44) style:UITableViewStylePlain];
    _noticeTb.delegate = self;
    _noticeTb.showsVerticalScrollIndicator = NO;
    _noticeTb.showsHorizontalScrollIndicator = NO;
    _noticeTb.backgroundColor = rgb;
    _noticeTb.dataSource = self;
    _noticeTb.separatorStyle = NO;
    [self.view addSubview:_noticeTb];
}
#pragma 代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _imgArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NoticeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NoticeTableViewCell" owner:nil options:nil]lastObject];
    }
    cell.ntitle.text = _arrayData[indexPath.row];
    cell.img.image = _imgArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case 0:
        {
            [self.navigationController pushViewController:_checkVc animated:YES];
        }
            break;
        case 1:
        {
            [self.navigationController pushViewController:_classBc animated:YES];
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:_today animated:YES];
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:_pay animated:YES];
        }
            break;
        case 4:
        {
            [self.navigationController pushViewController:_insVc animated:YES];
        }
            break;
        case 5:
        {
            [self.navigationController pushViewController:_question animated:YES];
        }
            break;
        default:
            break;
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
