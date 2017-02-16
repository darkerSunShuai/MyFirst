//
//  TodayHwVC.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/3.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "TodayHwVC.h"
#import "TodayHwCell.h"
#import "HistoryRecordVc.h"
#import "THistoryVc.h"
#import "HomeWorkDetVc.h"
#import "DataAnalysis.h"
#import "MyHeader.h"

@interface TodayHwVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)HistoryRecordVc *hisVc;
@property(nonatomic,strong)THistoryVc *tHistoryVc;
@property(nonatomic,strong)HomeWorkDetVc *homeWd;
@property(nonatomic,strong)DataAnalysis *analysis;
//@property(nonatomic,strong)
@end

@implementation TodayHwVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatUI];
    [self creatTB];
    [self creatVc];
}
-(void)creatUI
{
    self.title = @"作业管理";
    self.view.backgroundColor = rgb;
    if (ScreenW < 375) {
        _viewHeight.constant = SViewHigh;
        _buttonToTop.constant = SButtonHigh;
    }
}
#pragma mark - 创建要跳转的页面
-(void)creatVc
{
    _hisVc = [[HistoryRecordVc alloc]init];
    _tHistoryVc = [[THistoryVc alloc]init];
    _homeWd = [[HomeWorkDetVc alloc]init];
    _analysis = [[DataAnalysis alloc]init];
}
#pragma mark tableview创建
-(void)creatTB
{
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0,_viewHeight.constant,ScreenW, ScreenH-_viewHeight.constant) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.backgroundColor = rgb;
    //_table.separatorStyle = NO;
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
    TodayHwCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todayHw"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TodayHwCell" owner:nil options:nil]lastObject];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:_homeWd animated:YES];
}
#pragma mark 今日作业
- (IBAction)todayHw:(UIButton *)sender {
}
#pragma mark 数据分析
- (IBAction)dataAy:(UIButton *)sender {
    [self.navigationController pushViewController:_analysis animated:YES];
}
#pragma mark 历史
- (IBAction)historyRec:(UIButton *)sender {
    [self.navigationController pushViewController:_tHistoryVc animated:YES];
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
