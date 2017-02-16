//
//  HomePageController.m
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/22.
//  Copyright © 2016年 qiuqiu. All rights reserved.


#import "HomePageController.h"
#import "buttonBar.h"
#import "CheckOnViewController.h"
#import "ClassScheduleController.h"
#import "NoticeVc.h"
#import "GradeManagerVC.h"
#import "TeacherVc.h"
#import "SchoolBroadcastVc.h"
#import "PaymentReminderVc.h"
#import "TodayHwVC.h"
#import "QuestionNaireVc.h"
#import "PersonInformationVc.h"
#import "AcademicInformationVc.h"
#import "InstantMessagingVc.h"
#import "MapVc.h"

@interface HomePageController ()<UIScrollViewDelegate>
{
    //tabbar按钮类
    buttonBar *barbt1;
    buttonBar *barbt2;
    buttonBar *barbt3;
    buttonBar *barbt4;
    buttonBar *barbt5;
    //每个按钮的跟踪布尔变量
    BOOL b1;
    BOOL b2;
    BOOL b3;
    BOOL b4;
    BOOL b5;
}
@property(nonatomic,strong)ClassScheduleController *classVc;
@property(nonatomic,strong)CheckOnViewController *checkVc;
@property(nonatomic,strong)NoticeVc *noticeVc;
@property(nonatomic,strong)GradeManagerVC *gradeVc;
@property(nonatomic,strong)TeacherVc *teacherVc;
@property(nonatomic,strong)SchoolBroadcastVc *campusVc;
@property(nonatomic,strong)QuestionNaireVc *questionVc;
@property(nonatomic,strong)PaymentReminderVc *webPayVc;
@property(nonatomic,strong)TodayHwVC *todayHw;
@property(nonatomic,strong)PersonInformationVc *personI;
@property(nonatomic,strong)AcademicInformationVc *adc;
@property(nonatomic,strong)InstantMessagingVc *instant;
@property(nonatomic,strong)NSTimer *myTimer;
@property(nonatomic,strong)MapVc *mapVc;
@property(nonnull,strong)NSMutableArray * imageArray;

@end
@implementation HomePageController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self creatArray];
    [self creatUi];
    //防止内存泄漏
//    [self cteatBarButton];
    // 创建页面元素
    [self creatVC];
}
-(void)creatArray
{
    //_imageArray = [NSMutableArray arrayWithCapacity:0];
    _imageArray = [[NSMutableArray alloc]init];
    for (int i = 1; i<=9; i++) {
        NSString *img = [NSString stringWithFormat:@"s%d.jpg",i - 1];
        UIImage *img1 = [UIImage imageNamed:img];
        [_imageArray addObject:img1];
    }
}
-(void)creatVC
{
    _classVc = [[ClassScheduleController alloc]init];
    _checkVc = [[CheckOnViewController alloc]init];
    _noticeVc = [[NoticeVc alloc]init];
    _gradeVc = [[GradeManagerVC alloc]init];
    _teacherVc = [[TeacherVc alloc]init];
    _campusVc = [[SchoolBroadcastVc alloc]init];
    _questionVc = [[QuestionNaireVc alloc]init];
    _webPayVc = [[PaymentReminderVc alloc]init];
    _todayHw = [[TodayHwVC alloc]init];
    _personI = [[PersonInformationVc alloc]init];
    _adc = [[AcademicInformationVc alloc]init];
    _instant = [[InstantMessagingVc alloc]init];
    _mapVc = [[MapVc alloc]init];
}
-(void)creatUi{
    //关闭自动布局
    //基本参数设置
    self.title = @"campus";
//    b1 = YES;
//    b2 = YES;
//    b3 = YES;
//    b4 = YES;
//    b5 = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //适配屏幕的控件，获取屏幕的大小
    CGRect r = [ UIScreen mainScreen ].bounds;
    NSInteger high = 183;
    if(r.size.width >375)
    {
        _imgSc.frame = CGRectMake(0, 0, r.size.width, 200);
         high = 200;
        [_imgSc setBackgroundColor:[UIColor blueColor]];
    }

    
    if(r.size.width < 375.0){

        _imgSc.frame = CGRectMake(0, 0, r.size.width,150);
        _viewHeighToTop.constant = 150;
        high = 150;
        [_imgSc setBackgroundColor:[UIColor blueColor]];
    }
    //scr图片滚动
    _imgSc.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*_imageArray.count,high);
    for (int i = 0; i <= _imageArray.count - 1; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(r.size.width*i, 0,r.size.width,high)];
        //UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * (i - 1), 0, self.view.frame.size.width, 200)];
        UIImage *img = _imageArray[i];
        imageView.image = img;
        [_imgSc addSubview:imageView];
    }
    //防止边界弹出
    _imgSc.bounces = NO;
    //分页效果:scrollView的大小为一页
    _imgSc.pagingEnabled = YES;
    //隐藏滑块
    _imgSc.showsHorizontalScrollIndicator = NO;
    
    //delegate
    _imgSc.delegate = self;
    
    //tag
    _imgSc.tag = 2000;
    
     _imgSc.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width , 0);
    /**************UIPageControl***************/
    //实例化
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-175),(_imgSc.frame.size.height-30),100, 30)];
    
    pageControl.backgroundColor = [UIColor clearColor];
    
    //设置位置
//    pageControl.center = CGPointMake(0, self.view.frame.size.height / 2);
//    pageControl.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    //设置圆点的个数
    pageControl.numberOfPages = _imageArray.count - 2;
    pageControl.hidden = YES;
    //设置默认选中的点:必须写在圆点个数的下面，否则无效
    pageControl.currentPage = 0;
    //_imgSc.contentOffset = CGPointMake(self.view.frame.size.width * 1, 0);
    pageControl.selected = YES;
    
//    pageControl.backgroundColor = [UIColor blueColor];
    
    //设置选中前圆点的颜色
    pageControl.pageIndicatorTintColor = [UIColor orangeColor];
    //设置选中后圆点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    pageControl.tag = 1000;
    
    //添加事件
    [pageControl addTarget:self action:@selector(pageControlChanged:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pageControl];
    
    // 定时开始自动滚动
    [self performSelector:@selector(updateScrollView) withObject:nil afterDelay:0.0f];
}
-(void)updateScrollView
{
    [_myTimer invalidate];
    _myTimer = nil;
    //time duration
    NSTimeInterval timeInterval = 2;
    //timer
    _myTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self
                                              selector:@selector(handleMaxShowTimer:)
                                             userInfo: nil
                                              repeats:YES];
}

-(void)handleMaxShowTimer:(NSTimer *)timer
{
    //找到UIPageControl
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:1000];
    
    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:2000];
    CGPoint pt = scrollView.contentOffset;
    //由偏移量算出目前是第几页
    int i = pt.x / self.view.frame.size.width;
    
    if(i == _imageArray.count - 1)
    {
        //更改pageControl的默认选中页
        pageControl.currentPage = 0;
        scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 1, 0);
        pageControl.currentPage = 0;
    }else if (i == 0)
    {
        //更改pageControl的默认选中页
        pageControl.currentPage = _imageArray.count - 3;
        scrollView.contentOffset = CGPointMake(self.view.frame.size.width * _imageArray.count - 2, 0);

    }else
    {
        i++;
        //scrollView.contentOffset = CGPointMake(self.view.frame.size.width * i, 0);
        [UIView animateWithDuration:0.5 animations:^{
            scrollView.contentOffset = CGPointMake(self.view.frame.size.width * i, 0);
            //scrollView.contentOffset = CGPointMake(self.view.frame.size.height * i, 0);
            
        }];

        pageControl.currentPage = i-1;
        if (i == _imageArray.count - 1) {
            pageControl.currentPage = 0;
        }
    }
}
#pragma 重写约束
//-(void)updateViewConstraints
//{
//}
#pragma 考勤管理
- (IBAction)checkBt:(UIButton *)sender {
    NSLog(@"考勤");
    [self.navigationController pushViewController:_checkVc animated:YES];
}

#pragma 通知管理
- (IBAction)noticeBt:(UIButton *)sender {
    [self.navigationController pushViewController:_noticeVc animated:YES];
}

#pragma 课程安排
- (IBAction)class:(UIButton *)sender {
    _classVc.title = @"课程安排";
    [self.navigationController pushViewController:_classVc animated:YES];
     NSLog(@"课程管理");
}

#pragma 作业管理
- (IBAction)homework:(UIButton *)sender {
    [self.navigationController pushViewController:_todayHw animated:YES];
    NSLog(@"课程管理");
}

#pragma 成绩管理
- (IBAction)grade:(UIButton *)sender {
    [self.navigationController pushViewController:_gradeVc animated:YES];
     NSLog(@"成绩");
}

#pragma 教师评语
- (IBAction)teacher:(UIButton *)sender {
    [self.navigationController pushViewController:_teacherVc animated:YES];
     NSLog(@"教师");
}

#pragma 校园动态
- (IBAction)school:(UIButton *)sender {
    [self.navigationController pushViewController:_campusVc animated:YES];
     NSLog(@"校园");
}

#pragma 调查问卷
- (IBAction)research:(UIButton *)sender {
    [self.navigationController pushViewController:_questionVc animated:YES];
     NSLog(@"调查");
}

#pragma 网上缴费
- (IBAction)webPay:(UIButton *)sender {
    [self.navigationController pushViewController:_webPayVc animated:YES];
     NSLog(@"网上缴费");
}

#pragma 点击空白页执行的方法
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.tabBarController removeBtView];
//}
#pragma mark - UIPageControl的点击事件
- (void)pageControlChanged:(UIPageControl *)pageControl{
    
    //找到UIScrollView
    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:2000];
    //找到UIPageControl目前的第几个点
    NSInteger i = pageControl.currentPage;
    
    //更改UIScrollView的偏移量
    [UIView animateWithDuration:0.5 animations:^{
        scrollView.contentOffset = CGPointMake(self.view.frame.size.width * i+1, 0);
        //scrollView.contentOffset = CGPointMake(self.view.frame.size.height * i, 0);
        
    }];
}

#pragma mark - UIScrollViewDelegate
//停止加速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //找到UIPageControl
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:1000];
    //找到scrollView的偏移量
    CGPoint point = scrollView.contentOffset;
    //由偏移量算出目前是第几页
    int i = point.x / self.view.frame.size.width;
    //int i = point.y / self.view.frame.size.height;
    if(i == _imageArray.count - 1)
    {
        //更改pageControl的默认选中页
        pageControl.currentPage = 0;
        scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 1, 0);
    }else if (i == 0)
    {
        //更改pageControl的默认选中页
        pageControl.currentPage = _imageArray.count - 3;
        scrollView.contentOffset = CGPointMake(self.view.frame.size.width * _imageArray.count - 3, 0);
    }else
    {
        pageControl.currentPage = i-1;
    }

}
#pragma mark 页面周期
-(void)viewWillAppear:(BOOL)animated
{
    UIView *tabView = (UIView *)[self.tabBarController.view viewWithTag:3000];
    if (tabView.hidden == YES) {
        tabView.hidden = NO;
    }
    
    
}
-(void)viewWillDisappear:(BOOL)animated
{
//该变没的时候就打开。
    
//    UIView *tabView = (UIView *)[self.tabBarController.view viewWithTag:3000];
//    if (tabView.hidden == NO) {
//        tabView.hidden = YES;
//    }
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
