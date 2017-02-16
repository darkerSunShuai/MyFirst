//
//  PaymentReminderVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/4.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "PaymentReminderVc.h"
#import "PayRemCell.h"
#import "payDetailVc.h"
#import "PayHistoryVC.h"
#import "DataAnalysis.h"

#define rgb [UIColor colorWithRed:236.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:1.0];

@interface PaymentReminderVc ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)payDetailVc *payDetail;
@property(nonatomic,strong)PayHistoryVC *payHistory;
@property(nonatomic,strong)DataAnalysis *dataAny;

@end

@implementation PaymentReminderVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatVc];
    [self creatUI];
    [self creatTB];
}
-(void)creatVc
{
    _payDetail = [[payDetailVc alloc]init];
    _payHistory = [[PayHistoryVC alloc]init];
    _dataAny = [[DataAnalysis alloc]init];
}
-(void)creatUI
{
    self.title = @"缴费管理";
    self.view.backgroundColor = rgb;
}
#pragma mark tableview创建
-(void)creatTB
{
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, _myView.frame.size.height, ScreenW, ScreenH-_myView.frame.size.height-NavBarHigh-TabbarHeight) style:UITableViewStylePlain];
    _table.backgroundColor = rgb;
    _table.delegate = self;
    _table.dataSource = self;
//  _table.separatorStyle = NO;
    [self.view addSubview:_table];
}
#pragma mark - tableView - delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PayRemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"payCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"PayRemCell" owner:nil options:nil]lastObject];
    }
    cell.payBtClick = ^(){
        NSLog(@"你点击了第%ld个cell的在线支付",indexPath.row);
    };
    cell.webPay = ^(){
        NSLog(@"你点击了第%ld个cell的跳转到银行卡支付页面",indexPath.row);
    };

    cell.payDetailBtClick = ^(){
        NSLog(@"你点击了第%ld个cell的缴费明细",indexPath.row);
        [self.navigationController pushViewController:_payDetail animated:YES];
    };
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark 历史记录点击按钮的方法
- (IBAction)HistoryReco:(UIButton *)sender {
    [self.navigationController pushViewController:_payHistory animated:YES];
}
#pragma mark 数据分析
- (IBAction)dataAny:(UIButton *)sender {
    [self.navigationController pushViewController:_dataAny animated:YES];
}
#pragma mark 近期缴费
- (IBAction)recentPay:(UIButton *)sender {
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
