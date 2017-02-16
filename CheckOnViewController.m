//
//  CheckOnViewController.m
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/24.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import "CheckOnViewController.h"
#import "HistoryRecordVc.h"
#import "DateToolSelf.h"
#import "SignCalendarCell.h"
#import "AttendanceDetailsVC.h"
#import "DataAnalysis.h"
#import "leaveVc.h"
#import "MyHeader.h"

@interface CheckOnViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) NSMutableDictionary *dic;
@property (strong, nonatomic) NSArray *calendarArr;
@property (weak, nonatomic) IBOutlet UILabel *yearMonthLbe;
@property(nonatomic,strong)AttendanceDetailsVC *attendVc;
@property(nonatomic,strong)DataAnalysis *analysis;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectHeight;
@property(nonatomic,strong)leaveVc *leaveVc;
@end

@implementation CheckOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self getCalendarDate];
    [self creatUi];
    UICollectionViewFlowLayout *flowLyout = [[UICollectionViewFlowLayout alloc]init];
    flowLyout.itemSize = CGSizeMake(_calendarCollectionView.frame.size.width / 7, _calendarCollectionView.frame.size.width / 7);
//    flowLyout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    // 设置行间距
    flowLyout.minimumInteritemSpacing = 0;
    // 设置列间距
    flowLyout.minimumLineSpacing = -1;
    [_calendarCollectionView setCollectionViewLayout:flowLyout];
    [self changeCollectHeight:[DateToolSelf howManyDaysInThisMonth] weekday:[DateToolSelf whatWeekThisMonth]];
    [_calendarCollectionView setNeedsLayout];
    
    _calendarCollectionView.delegate = self;
    _calendarCollectionView.dataSource = self;
    _calendarCollectionView.bounces = NO;
    _calendarCollectionView.scrollEnabled = NO;
    [_calendarCollectionView registerClass:[SignCalendarCell class] forCellWithReuseIdentifier:@"signCalendar"];
    [_calendarCollectionView registerNib:[UINib nibWithNibName:@"SignCalendarCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"signCalendar"];
    self.navigationController.navigationBarHidden = NO;
}
-(void)getCalendarDate
{
    NSString *str11 = [DateToolSelf getNowyearMonth];
    self.dic = [DateToolSelf getCalendarDic:str11];
    self.calendarArr = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    //self.yearMonthLbe.text = [DateToolSelf getNowyearMonth];
   

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 45;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SignCalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"signCalendar" forIndexPath:indexPath];
    cell.calendarLbl.backgroundColor = [UIColor whiteColor];
    [cell getDataWithArr:_calendarArr index:indexPath dic:_dic];
    if (indexPath.row < 7) {
        cell.calendarLbl.backgroundColor = [UIColor colorWithRed:30/255.0 green:167/255.0 blue:252/255.0 alpha:1];
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SignCalendarCell *cell1 =(SignCalendarCell *) [collectionView cellForItemAtIndexPath:indexPath];
    
    NSLog(@"%@---->>",cell1.calendarLbl.text);
    cell1.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:_attendVc animated:YES];
//    if (![cell1.calendarLbl.text isEqualToString:@""]) {
//        // NSInteger _todayDate = [[_dic valueForKey:@"todayDate"] integerValue];
//        if (indexPath.row >=7) {
//            for (SignCalendarCell *cell in [collectionView visibleCells]) {
//                if ([cell isEqual:cell1]) {
//                    cell.calendarLbl.backgroundColor = [UIColor colorWithRed:30/255.0 green:167/255.0 blue:252/255.0 alpha:1];
//                }else{
//                    cell.calendarLbl.backgroundColor = [UIColor whiteColor];
//                    
//                }
//                NSIndexPath *index = [collectionView indexPathForCell:cell];
//                [cell getDataWithArr:_calendarArr index:index dic:_dic];
//                if (index.row < 7) {
//                    cell.calendarLbl.backgroundColor = [UIColor colorWithRed:30/255.0 green:167/255.0 blue:252/255.0 alpha:1];
//                }
//            }
//            
//            HomeworkViewController *homeworkVC = [[HomeworkViewController alloc]init];
//            homeworkVC.DateStr = [NSString stringWithFormat:@"%@-%@",self.yearMonthLbe.text,cell1.calendarLbl.text];
//            [self.navigationController pushViewController:homeworkVC animated:NO];
//        }
//        
//    }
//    
    
}
- (void)changeCollectHeight:(NSInteger)days
                    weekday:(NSInteger)weekday
{
    if (weekday - 1 + days < 29) {
        _collectHeight.constant = 225.f+5;
    }else if (weekday - 1 + days < 36){
        _collectHeight.constant = 270.f+5;
    }else{
        _collectHeight.constant = 315.f+5;
    }
}

-(void)creatUi{
    self.title = @"考勤管理";
    if ([UIScreen mainScreen].bounds.size.width>375) {
        NSLog(@"6p--------------->");
        //[_checkMoon setAutoresizesSubviews:NO];
    }
    _attendVc = [[AttendanceDetailsVC alloc]init];
    _analysis = [[DataAnalysis alloc]init];
    _leaveVc = [[leaveVc alloc]init];
    if ([UIScreen mainScreen].bounds.size.width<375) {
        _viewHeigh.constant = SViewHigh;
        _buttonToTop.constant = SButtonHigh;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dataDnalysis:(UIButton *)sender {
    NSLog(@"数据分析");
    [self.navigationController pushViewController:_analysis animated:YES];
}
- (IBAction)historicRecords:(UIButton *)sender {
    [self.navigationController pushViewController:[[HistoryRecordVc alloc]init] animated:YES];
    NSLog(@"历史记录");
}
- (IBAction)checkMoon:(UIButton *)sender {
    NSLog(@"本月考勤");
   
}
- (IBAction)apply:(UIButton *)sender {
    [self.navigationController pushViewController:_leaveVc animated:YES];
    NSLog(@"请假申请");
}

- (void)dealloc
{

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
