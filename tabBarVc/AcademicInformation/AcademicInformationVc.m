//
//  AcademicInformationVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/9.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "AcademicInformationVc.h"
#import "NoticeTableViewCell.h"
#import "DutyRosterVc.h"
#import "TimeTableVc.h"
#import "FacultyVc.h"

@interface AcademicInformationVc ()
@property(nonatomic,strong)NSArray *arrayData;
@property(nonatomic,strong)DutyRosterVc *duty;
@property(nonatomic,strong)TimeTableVc *timeTable;
@property(nonatomic,strong)FacultyVc *facu;
@end

@implementation AcademicInformationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatUI];
    [self creatData];
    [self creatTb];
    [self creatVc];
}
-(void)creatVc
{
    _duty = [[DutyRosterVc alloc]init];
    _timeTable = [[TimeTableVc alloc]init];
    _facu = [[FacultyVc alloc]init];
}
#pragma 创建页面
-(void)creatUI
{
    self.title = @"教务信息";
}
#pragma 数据源
-(void)creatData
{
    _arrayData = @[@"值日表",@"作息时间",@"师资力量",@"班级简介",@"办公电话",@"车辆安排"];
}
#pragma  创建tableVIew
-(void)creatTb
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,ScreenW,ScreenH-NavBarHigh-TabbarHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.backgroundColor = rgb;
    _tableView.dataSource = self;
    _tableView.separatorStyle = NO;
    [self.view addSubview:_tableView];
}
#pragma 代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NoticeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"noticeCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NoticeTableViewCell" owner:nil options:nil]lastObject];
    }
    cell.ntitle.text = _arrayData[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case 0:
        {
            _duty.title = @"本周值日表";
            [self.navigationController pushViewController:_duty animated:YES];
        }
            break;
        case 1:
        {
            _timeTable.title = @"作息时间";
            [self.navigationController pushViewController:_timeTable animated:YES];

        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:_facu animated:YES];
        }
            break;
        case 3:
        {
              _duty.title = @"班级简介";
              [self.navigationController pushViewController:_duty animated:YES];
        }
            break;
        case 4:
        {
            _timeTable.title = @"办公电话";
            [self.navigationController pushViewController:_timeTable animated:YES];
        }
            break;
        case 5:
        {
            _timeTable.title = @"车辆安排";
            [self.navigationController pushViewController:_timeTable animated:YES];

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
