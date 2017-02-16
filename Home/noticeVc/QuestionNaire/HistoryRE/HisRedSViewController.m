//
//  HisRedSViewController.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/6.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "HisRedSViewController.h"
#import "NewHisCell.h"
#import "searchQVc.h"

@interface HisRedSViewController ()

@property(nonatomic,strong)searchQVc *sear;

@end

@implementation HisRedSViewController

static NSString * CellID=@"newCellHis";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor = [UIColor greenColor];
    [self creatPushVc];
    [self creatDataSource];
    [self creatTableHeaderView];
    [self creatTableView];
    [self creatUI];
    _searchVC = [self searchVC];
}
-(void)creatPushVc
{
    _sear = [[searchQVc alloc]init];
}
-(void)creatTableHeaderView
{
    _tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    _tableHeaderView.backgroundColor = [UIColor orangeColor];
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/4, _tableHeaderView.frame.size.height/2-12, 100, 20)];
    label1.backgroundColor = [UIColor redColor];
    label1.text = @"按日期排序";
    [_tableHeaderView addSubview:label1];
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/4*2+10, _tableHeaderView.frame.size.height/2-12, 100, 20)];
    label2.backgroundColor = [UIColor redColor];
    label2.text = @"按类型排序";
    [_tableHeaderView addSubview:label2];
    UIButton * b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [b1 setFrame:CGRectMake(label1.frame.origin.x-15, label1.frame.origin.y+2, 15, 15)];
    [b1 setImage:[UIImage imageNamed:@"thbs.jpg"] forState:UIControlStateNormal];
    b1.tag = 1111;
    b1.selected = YES;
    [b1 setImage:[UIImage imageNamed:@"thbss.jpg"] forState:UIControlStateSelected];
    [b1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_tableHeaderView addSubview:b1];
    
    UIButton * b2 = [UIButton  buttonWithType:UIButtonTypeCustom];
    b2.tag = 1112;
    [b2 setFrame:CGRectMake(label2.frame.origin.x-15, label2.frame.origin.y+2, 15, 15)];
    [b2 setBackgroundImage:[UIImage imageNamed:@"thbs.jpg"] forState:UIControlStateNormal];
    [b2 setBackgroundImage:[UIImage imageNamed:@"thbss.jpg"] forState:UIControlStateSelected];
    [b2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_tableHeaderView addSubview:b2];
    
}
-(void)buttonClick:(UIButton *)button
{
    UIButton *b1 = (UIButton *)[self.view viewWithTag:1111];
    UIButton *b2 = (UIButton *)[self.view viewWithTag:1112];
    if (button.tag == 1111) {
        b1.selected = YES;
        b2.selected = NO;
        _bt1 = YES;
        _bt2 = NO;
        _searchVC.searchBar.text = @"";
        _searchVC.searchBar.placeholder = @"请输入日期";
        NSLog(@"日期");
        [_exampleArr removeAllObjects];
        [_exampleArr addObjectsFromArray:@[@"2016.10.01",@"2016.10.02",@"2016.10.03",@"2016.10.04",@"2016.10.05"]];
    }
    if (button.tag == 1112) {
        NSLog(@"班级顺序");
        _bt2 = YES;
        _bt1 = NO;
        _searchVC.searchBar.text = @"";
        _searchVC.searchBar.placeholder = @"请输入类型";
        b1.selected = NO;
        b2.selected = YES;
        [_exampleArr removeAllObjects];
        [_exampleArr addObjectsFromArray:@[@"全校营养早餐调查",@"慈善活动小调查",@"班级课后劳动调查",@"早自习环境调查",@"夜晚睡觉时长调查"]];
        
    }
}
-(void)creatDataSource
{
    _exampleArr = [[NSMutableArray alloc]initWithArray:@[@"2016.10.01",@"2016.10.02",@"2016.10.03",@"2016.10.04",@"2016.10.05"]];
    _dataSource1 = @[@"2016.10.01",@"2016.10.02",@"2016.10.03",@"2016.10.04",@"2016.10.05"];
    _dataSource2 = @[@"全校营养早餐调查",@"慈善活动小调查",@"班级课后劳动调查",@"早自习环境调查",@"夜晚睡觉时长调查"];
}
-(void)creatUI
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.title = @"历史记录";
    _bt1 = YES;
    _bt2 = NO;
}
-(void)creatTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-44) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //    self.tableView.showsVerticalScrollIndicator = YES;
    //    self.tableView.autoresizesSubviews = YES;
    self.tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tableView];
}
#pragma mark tableView的代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"测试";
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewHisCell * cell=[tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"NewHisCell" owner:nil options:nil] lastObject];
    }
    if (!self.searchVC.active) {
        cell.dataL.text = [NSString stringWithFormat:@"%@",_dataSource1[indexPath.row]];
        cell.typeL.text = [NSString stringWithFormat:@"%@",_dataSource2[indexPath.row]];
        cell.searchBtClick = ^(){
            NSLog(@"你点击了第%ld个cell的调查",indexPath.row);
             [self.navigationController pushViewController:_sear animated:YES];
        };
    }else
    {
        if (self.bt1) {
            cell.dataL.text = [NSString stringWithFormat:@"%@",_searchArr[indexPath.row]];
            NSString * str = [NSString stringWithFormat:@"%@",_searchArr[indexPath.row]];
            NSInteger i = [_dataSource1 indexOfObject:str];
            cell.typeL.text = [NSString stringWithFormat:@"%@",_dataSource2[i]];
            NSLog(@"时间被选中");
        }else
        {
            cell.typeL.text = [NSString stringWithFormat:@"%@",_searchArr[indexPath.row]];
            
            NSString * str = [NSString stringWithFormat:@"%@",_searchArr[indexPath.row]];
            NSInteger i = [_dataSource2 indexOfObject:str];
            cell.dataL.text = [NSString stringWithFormat:@"%@",_dataSource1[i]];
            NSLog(@"班级被选中%ld",(long)i);
        }
        cell.searchBtClick = ^(){
            NSLog(@"你点击了第%ld个cell的调查",indexPath.row);
            [self.navigationController pushViewController:_sear animated:YES];
        };
    }
    //cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击了-》%ld",(long)indexPath.row);

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    NSLog(@"132132");
    return _tableHeaderView;
    //return _searchVC.searchBar;
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
    self.searchArr= [NSMutableArray arrayWithArray:[_exampleArr filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
}
- (UISearchController *)searchVC
{
    if (!_searchVC) {
        
        _searchVC = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchVC.searchResultsUpdater = self;
        
        _searchVC.dimsBackgroundDuringPresentation = NO;
        
        _searchVC.searchBar.placeholder = @"请输入日期";
        
        [_searchVC.searchBar setValue:@"取消" forKey:@"_cancelButtonText"];
        
        [_searchVC.searchBar setTintColor:[UIColor blackColor]];
        
        _searchVC.hidesNavigationBarDuringPresentation = NO;
        
        _searchVC.searchBar.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, 44.0);
        
        self.tableView.tableHeaderView = self.searchVC.searchBar;
        //s[self.view addSubview:self.searchVC.searchBar];
    }
    return _searchVC;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.searchVC.active = NO;
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
