//
//  GradeManagerVC.m
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/26.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import "GradeManagerVC.h"
#import "GradeManagerCell.h"
#import "GradeHIsVc.h"
#import "DataAnalysis.h"

@interface GradeManagerVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)GradeHIsVc *gradeHis;
@property(nonatomic,strong)DataAnalysis *dat;

@end

@implementation GradeManagerVC

static NSString * cellID = @"gradeManager";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatVc];
    [self creatUI];
    [self creatTab];
}
-(void)creatVc
{
    _gradeHis = [[GradeHIsVc alloc]init];
    _dat = [[DataAnalysis alloc]init];
}
-(void)creatUI
{
    self.title = @"成绩管理";
    self.view.backgroundColor = rgb;
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (ScreenW < 375) {
        _viewHeight.constant = SViewHigh;
        _buttonToTop.constant = SButtonHigh;
    }
}
#pragma mark -creatTabView;
-(void)creatTab
{
    CGFloat viewY = ViewHigh;
    if (ScreenW < 375) {
        viewY = SViewHigh;
    }
    CGFloat viewX = ScreenW;
    CGFloat viewSC =ScreenH;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, viewY, viewX, viewSC-viewY) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.backgroundColor = rgb;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
#pragma mark tableView的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GradeManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GradeManagerCell" owner:nil options:nil]lastObject];
    }
    cell.exam = ^(){NSLog(@"我是考场安排");};
    cell.grade = ^(){NSLog(@"我是成绩排名");};
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - 历史记录
- (IBAction)historyRecord:(id)sender {
    
    [self.navigationController pushViewController:_gradeHis animated:YES];
}
#pragma mark - 数据分析
- (IBAction)dataAny:(id)sender {
    [self.navigationController pushViewController:_dat animated:YES];
}
#pragma mark - 近期考试
- (IBAction)recentlyExam:(id)sender {
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
