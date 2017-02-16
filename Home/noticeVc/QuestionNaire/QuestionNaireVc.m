//
//  QuestionNaireVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/6.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "QuestionNaireVc.h"
#import "searchQVc.h"
#import "DataAnalysis.h"
#import "HisRedSViewController.h"

@interface QuestionNaireVc()

@property(nonatomic,strong)searchQVc *searchVc;
@property(nonatomic,strong)DataAnalysis *dataAn;
@property(nonatomic,strong)HisRedSViewController *hist;

@end

@implementation QuestionNaireVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatVc];
}
-(void)creatVc{
    _searchVc = [[searchQVc alloc]init];
    _dataAn = [[DataAnalysis alloc]init];
    _hist = [[HisRedSViewController alloc]init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addQ:(UIButton *)sender {
    NSLog(@"填写问卷");
    [self.navigationController pushViewController:_searchVc animated:YES];
}
- (IBAction)dataAny:(UIButton *)sender {
    NSLog(@"数据分析");
    [self.navigationController pushViewController:_dataAn animated:YES];
}
- (IBAction)HistoryR:(UIButton *)sender {
    NSLog(@"历史记录");
    [self.navigationController pushViewController:_hist animated:YES];

}
- (IBAction)contract:(UIButton *)sender {
    NSLog(@"链接");
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
