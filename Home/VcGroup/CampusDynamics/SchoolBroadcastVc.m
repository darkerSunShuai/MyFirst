//
//  SchoolBroadcastVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/9.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "SchoolBroadcastVc.h"
#import "NoticeTableViewCell.h"
#import "newsCell.h"
#import "ClassCell.h"

@interface SchoolBroadcastVc ()

@end

@implementation SchoolBroadcastVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatData];
    [self creatUI];
    [self creatUI2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma 创建数据源
-(void)creatData
{
    _array1 = [NSMutableArray arrayWithArray:@[@"教育时评",@"学校简介",@"团队管理",@"校训队歌",@"办学理念"]];
}
-(void)creatUI2
{
    /*
     按钮
     */
    _school.frame = CGRectMake(0, 0, ScreenW/3, 40);
    [_school setBackgroundImage:[UIImage imageNamed:@"b1.jpg"] forState:UIControlStateNormal];
    [_school setBackgroundImage:[UIImage imageNamed:@"b1h.jpg"] forState:UIControlStateSelected];
    _school.selected = YES;
    _news.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/3, 0, [UIScreen mainScreen].bounds.size.width/3, 40);
    [_news setBackgroundImage:[UIImage imageNamed:@"b2.jpg"] forState:UIControlStateNormal];
    [_news setBackgroundImage:[UIImage imageNamed:@"b2h.jpg"] forState:UIControlStateSelected];
    _news.selected = NO;
    _classD.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/3*2, 0, [UIScreen mainScreen].bounds.size.width/3, 40);
    [_classD setBackgroundImage:[UIImage imageNamed:@"b3.jpg"] forState:UIControlStateNormal];
    [_classD setBackgroundImage:[UIImage imageNamed:@"b3h.jpg"] forState:UIControlStateSelected];
    _classD.selected = NO;
    /*
     scroll
     */
    /*
     scroll
     */
    _contentSc = [[UIScrollView alloc]initWithFrame:CGRectMake(0,40,ScreenW,ScreenH-40-TabbarHeight-NavBarHigh)];
    _contentSc.scrollsToTop = YES;
    
    //禁止同时滑动（方向🔒）
    _contentSc.directionalLockEnabled = YES;
    _contentSc.contentSize = CGSizeMake(ScreenW*3,ScreenH-40-TabbarHeight-NavBarHigh);
    _contentSc.delegate = self;
    _contentSc.bounces = NO;
    _contentSc.showsHorizontalScrollIndicator = NO;
    //[_contentSc setShowsVerticalScrollIndicator:NO];
    _contentSc.showsVerticalScrollIndicator = NO;
    _contentSc.pagingEnabled = YES;
    _contentSc.showsHorizontalScrollIndicator = YES;
    _contentSc.showsVerticalScrollIndicator = YES;
    _contentSc.delegate = self;
    _contentSc.contentOffset = CGPointMake(0, 0);
    [self.view addSubview:_contentSc];

    /*
     tabview
     */
    _table1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,ScreenW, ScreenH-NavBarHigh-TabbarHeight-50) style:UITableViewStylePlain];
    _table1.backgroundColor = rgb;
    _table1.separatorStyle = NO;
    _table1.showsVerticalScrollIndicator = NO;
    _table1.dataSource = self;
    _table1.delegate = self;
    _table1.tag = 1000;
    [_contentSc addSubview:_table1];
    
    _table2 = [[UITableView alloc]initWithFrame:CGRectMake(ScreenW, 0,ScreenW, ScreenH-NavBarHigh-TabbarHeight-50) style:UITableViewStylePlain];
    _table2.dataSource = self;
    _table2.delegate = self;
    _table2.tag = 1001;
    [_contentSc addSubview:_table2];
    
    _table3 = [[UITableView alloc]initWithFrame:CGRectMake(ScreenW*2, 0,ScreenW, ScreenH-NavBarHigh-TabbarHeight-50) style:UITableViewStylePlain];
    _table3.dataSource = self;
    _table3.delegate = self;
    _table3.tag = 1002;
    [_contentSc addSubview:_table3];
    
    
}
#pragma 创建页面
-(void)creatUI
{
    self.title = @"校园动态";
    self.automaticallyAdjustsScrollViewInsets = NO;
}
#pragma scroll的代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //先判断是不是容器scroll
    
    if (scrollView.tag == 0) {
        CGPoint point = scrollView.contentOffset;
        //由偏移量算出目前是第几页
        int i = point.x / self.view.frame.size.width;
        switch (i) {
            case 0:
            {
                _school.selected = YES;
                _news.selected = NO;
                _classD.selected = NO;
            }
                break;
            case 1:
            {
                _school.selected = NO;
                _news.selected = YES;
                _classD.selected = NO;
            }
                break;
            case 2:
            {
                _school.selected = NO;
                _news.selected = NO;
                _classD.selected = YES;
            }
                break;
            default:
                break;
        }
        
    }
}
#pragma 上方三个按钮
- (IBAction)news:(id)sender {
    NSLog(@"新闻活动");
    _school.selected = NO;
    _news.selected = YES;
    _classD.selected = NO;
    [UIView animateWithDuration:0.5 animations:^{
        _contentSc.contentOffset = CGPointMake(ScreenW,0);
    }];
}
- (IBAction)school:(id)sender {
    NSLog(@"校园风采");
    _school.selected = YES;
    _news.selected = NO;
    _classD.selected = NO;
    [UIView animateWithDuration:0.5 animations:^{
        _contentSc.contentOffset = CGPointMake(0, 0);
    }];
}
- (IBAction)classD:(id)sender {
    NSLog(@"班级动态");
    _school.selected = NO;
    _news.selected = NO;
    _classD.selected = YES;
    [UIView animateWithDuration:0.5 animations:^{
        _contentSc.contentOffset = CGPointMake(ScreenW*2, 0);
    }];
}

#pragma table的代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array1.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1000) {
        NoticeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"noticeCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"NoticeTableViewCell" owner:nil options:nil]lastObject];
        }
        cell.ntitle.text = _array1[indexPath.row];
        cell.leftTo.constant = 0;
        cell.rightTo.constant = 0;
        return cell;
    }
    if (tableView.tag == 1001) {
        newsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"newsCell" owner:nil options:nil]lastObject];
        }
        cell.newsT.text = [NSString stringWithFormat:@"新闻第%ld",indexPath.row];
        return cell;
    }
    if (tableView.tag == 1002) {
        ClassCell * cell = [tableView dequeueReusableCellWithIdentifier:@"classCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ClassCell" owner:nil options:nil]lastObject];
        }
        return cell;
    }
    
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView.tag == 1000) {
        
    }
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
