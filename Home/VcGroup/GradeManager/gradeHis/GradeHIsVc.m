//
//  GradeHIsVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/9.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "GradeHIsVc.h"
#import "GradeHisCell.h"

@interface GradeHIsVc ()

@end

@implementation GradeHIsVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)creatUI
{
    self.title = @"历史记录";
    self.automaticallyAdjustsScrollViewInsets = NO;
}
-(void)creatDataSource
{
    self.exampleArr = [[NSMutableArray alloc]initWithArray:@[@"2016.10.01",@"2016.10.02",@"2016.10.03",@"2016.10.04",@"2016.10.05"]];
    self.dataSource1 = @[@"2016.10.01",@"2016.10.02",@"2016.10.03",@"2016.10.04",@"2016.10.05"];
    self.dataSource2 = @[@"03级1班",@"03级2班",@"03级3班",@"03级4班",@"03级5班"];
}
#pragma mark 重写父类的方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchVC.active) {
        return self.searchArr.count;//搜索结果
    }else
    {
        return self.exampleArr.count;//原始数据
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GradeHisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gradeHisCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GradeHisCell" owner:nil options:nil]lastObject];
    }
    if (!self.searchVC.active) {
        cell.timeL.text = [NSString stringWithFormat:@"%@",self.dataSource1[indexPath.row]];
        cell.classL.text = [NSString stringWithFormat:@"%@",self.dataSource2[indexPath.row]];
    }else
    {
        if (self.bt1) {
            cell.timeL.text = [NSString stringWithFormat:@"%@",self.searchArr[indexPath.row]];
            NSString * str = [NSString stringWithFormat:@"%@",self.searchArr[indexPath.row]];
            NSInteger i = [self.dataSource1 indexOfObject:str];
            cell.classL.text = [NSString stringWithFormat:@"%@",self.dataSource2[i]];
            NSLog(@"时间被选中");
        }else
        {
            cell.classL.text = [NSString stringWithFormat:@"%@",self.searchArr[indexPath.row]];
            
            NSString * str = [NSString stringWithFormat:@"%@",self.searchArr[indexPath.row]];
            NSInteger i = [self.dataSource2 indexOfObject:str];
            cell.timeL.text = [NSString stringWithFormat:@"%@",self.dataSource1[i]];
            NSLog(@"班级被选中%ld",(long)i);
        }
    }
    cell.searchD = ^(){
        NSLog(@"你点击了第%ld个cell的查看详情",indexPath.row);
    };
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"重写父累点击了-》%ld",(long)indexPath.row);
    
}
#pragma mark 搜索框的代理方法
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = [self.searchVC.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    if (self.searchArr!= nil) {
        [self.searchArr removeAllObjects];
    }
    //过滤数据
    self.searchArr= [NSMutableArray arrayWithArray:[self.exampleArr filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
}
#pragma mark 重写按钮点击方法
-(void)buttonClick:(UIButton *)button
{
    UIButton *b1 = (UIButton *)[self.view viewWithTag:1111];
    UIButton *b2 = (UIButton *)[self.view viewWithTag:1112];
    if (button.tag == 1111) {
        b1.selected = YES;
        b2.selected = NO;
        self.bt1 = YES;
        self.bt2 = NO;
        self.searchVC.searchBar.text = @"";
        self.searchVC.searchBar.placeholder = @"请输入日期";
        NSLog(@"子类日期");
        [self.exampleArr removeAllObjects];
        [self.exampleArr addObjectsFromArray:@[@"2016.10.01",@"2016.10.02",@"2016.10.03",@"2016.10.04",@"2016.10.05"]];
    }
    if (button.tag == 1112) {
        NSLog(@"子类班级顺序");
        self.bt2 = YES;
        self.bt1 = NO;
        self.searchVC.searchBar.text = @"";
        self.searchVC.searchBar.placeholder = @"请输入班级";
        b1.selected = NO;
        b2.selected = YES;
        [self.exampleArr removeAllObjects];
        [self.exampleArr addObjectsFromArray:@[@"03级1班",@"03级2班",@"03级3班",@"03级4班",@"03级5班"]];
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
