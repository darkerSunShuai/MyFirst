//
//  FacultyVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/10.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "FacultyVc.h"
#import "facultyCell.h"

@interface FacultyVc ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation FacultyVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatUi];
    [self creatTableview];
}
-(void)creatUi
{
    self.title = @"师资力量";
}
-(void)creatTableview
{
    CGRect r = _myView.frame;
    CGRect rs = [UIScreen mainScreen].bounds;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,r.size.height, r.size.width, rs.size.height-r.size.height-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
//    label.numberOfLines = 0;
//    
//    label.lineBreakMode = NSLineBreakByWordWrapping;
//    
//    label.text = @"本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你一同创造！";
//    
//    CGSize size = [label sizeThatFits:CGSizeMake(label.frame.size.width, MAXFLOAT)];
//    
//    label.frame =CGRectMake(0, 100, 300, size.height);
//    
//    label.font = [UIFont systemFontOfSize:14];
//    
//    [self.view addSubview:label];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"我是section的个数");
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"我是rows的个数");
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    facultyCell *cell =(facultyCell *)[tableView cellForRowAtIndexPath:indexPath];
//    CGRect r = cell.introduceT.frame;
//    if ((r.size.height-63)>0) {
//        return 120 + r.size.height-63;
//    }else
//    {
//        return 120;
//    }
    facultyCell * cell = [tableView dequeueReusableCellWithIdentifier:@"facultCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"facultyCell" owner:nil options:nil]lastObject];
        
    }

     NSLog(@"我是row的高度");
    return 120;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    facultyCell * cell = [tableView dequeueReusableCellWithIdentifier:@"facultCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"facultyCell" owner:nil options:nil]lastObject];
 
    }
    cell.introduceT.text = @"本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你一同创造！本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质";
    [cell.introduceT sizeToFit];
     NSLog(@"我是cell");
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
