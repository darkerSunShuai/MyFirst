//
//  TeacherVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/26.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import "TeacherVc.h"
#import "teacherCell.h"
@interface TeacherVc ()

@property(nonatomic,strong)NSMutableArray *data;

@end

@implementation TeacherVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatUI];
    [self creatData];
    [self creatTabView];
}
-(void)creatUI
{
    self.title = @"教师评语";
}
-(void)creatData
{
    _data = [NSMutableArray arrayWithArray:@[@[@"2015-2016年度 上学期",@"2015-2016年度 下学期"],@[@"2014-2015年度 上学期",@"2014-2015年度 下学期"],@[@"2013-2014年度 上学期",@"2013-2014年度 下学期"]]];
}
-(void)creatTabView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
#pragma mark - 代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return @"2015年度教师评价";
        }
            break;
        case 1:
        {
            return @"2014年度教师评价";
        }
            break;
        case 2:
        {
            return @"2013年度教师评价";
        }
            break;
        default:
            break;
    }
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    teacherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teacherCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"teacherCell" owner:nil options:nil]lastObject];
    }
    cell.term.text = _data[indexPath.section][indexPath.row];
    return cell;
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
