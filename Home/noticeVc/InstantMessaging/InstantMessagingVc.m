//
//  InstantMessagingVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/5.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "InstantMessagingVc.h"
#import "InstanceCell.h"
#import "Person.h"
#import "BMChineseSort.h"

#import "LWImageBrowser.h"
#import "TableViewCell.h"
#import "TableViewHeader.h"
#import "StatusModel.h"
#import "CellLayout.h"
#import "CommentView.h"
#import "CommentModel.h"
#import "LWAlertView.h"

@interface InstantMessagingVc ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray<Person *> *dataArray;
    NSMutableArray<Person *> *sdataArray;
}

@property(nonatomic,strong)UIImageView *bimg;
@property(nonatomic,strong)UITableView *tableView1;
@property(nonatomic,strong)UITableView *tableView2;
@property(nonatomic,strong)UITableView *tableVIew3;

@property(nonatomic,strong)NSArray *stringsToSort;

//排序后的出现过的拼音首字母数组
@property(nonatomic,strong)NSMutableArray *indexArray;
//排序好的结果数组
@property(nonatomic,strong)NSMutableArray *letterResultArr;

//排序后的出现过的拼音首字母数组
@property(nonatomic,strong)NSMutableArray *sindexArray;
//排序好的结果数组
@property(nonatomic,strong)NSMutableArray *sletterResultArr;
//fc
@property (nonatomic,strong) NSArray* fakeDatasource;
@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) NSMutableArray* dataSource;
@property (nonatomic,strong) TableViewHeader* tableViewHeader;
@property (nonatomic,strong) CommentView* commentView;
@property (nonatomic,strong) CommentModel* postComment;
@property (nonatomic,assign,getter = isNeedRefresh) BOOL needRefresh;
@property (nonatomic,assign) BOOL displaysAsynchronously;//是否异步绘制

@end
const CGFloat kRefreshBoundary = 170.0f;
@implementation InstantMessagingVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    _b1.selected = YES;
//    _b2.selected = YES;
    _bacSc.tag = 1004;
    _tableView.tag = 1002;
    [self creatDataSource];
    [self creatUI];
    [self creatTableView];
    _searchVC = [self searchVC];
    _searchVC1 = [self searchVC1];
}
-(void)creatDataSource
{
    _exampleArr = [[NSMutableArray alloc]initWithArray:@[@"张三",@"李四",@"孙帅",@"郭奎",@"腾跃"]];
    //_dataSource1 = @[@"2016.10.01",@"2016.10.02",@"2016.10.03",@"2016.10.04",@"2016.10.05"];
    //_dataSource2 = @[@"一班",@"二班",@"三班",@"四班",@"五班"];
   _stringsToSort=[NSArray arrayWithObjects:
                            @"李白",@"张三",
                            @"重庆",@"重量",
                            @"调节",@"调用",
                            @"小白",@"小明",@"千珏",
                            @"黄家驹", @"鼠标",@"hello",@"多美丽",@"肯德基",@"##",@"456465",
                            nil];
    
    //模拟网络请求接收到的数组对象 Person数组
    dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i<[_stringsToSort count]; i++) {
        Person *p = [[Person alloc] init];
        p.name = [_stringsToSort objectAtIndex:i];
        p.number = i;
        [dataArray addObject:p];
    }

    //根据Person对象的 name 属性 按中文 对 Person数组 排序
    self.indexArray = [BMChineseSort IndexWithArray:dataArray Key:@"name"];
    self.letterResultArr = [BMChineseSort sortObjectArray:dataArray Key:@"name"];
}
-(void)creatTableView
{
    _tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, _bacSc.frame.size.height-40) style:UITableViewStylePlain];
    _tableView1.delegate = self;
    _tableView1.tag  = 1000;
    _tableView1.dataSource = self;
    _tableView1.backgroundColor = rgb;
    [_bacSc addSubview:_tableView1];
    
    _tableView2 = [[UITableView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 40, [UIScreen mainScreen].bounds.size.width, _bacSc.frame.size.height-40-64) style:UITableViewStylePlain];
    _tableView2.tag = 1001;
    _tableView2.delegate = self;
    _tableView2.delaysContentTouches = NO;
    _tableView2.dataSource = self;
    _tableView2.backgroundColor = rgb;
    [_bacSc addSubview:_tableView2];
    
    
}
-(void)creatUI
{
    self.title = @"即时通讯";
    self.automaticallyAdjustsScrollViewInsets = NO;
    /*
     scroll
     */
    _bacSc.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*3, [UIScreen mainScreen].bounds.size.height-self.navigationController.navigationBar.frame.size.height-40);
    _bacSc.delegate = self;
    _bacSc.bounces = NO;
    _bacSc.pagingEnabled = YES;
    _bacSc.showsHorizontalScrollIndicator = YES;
    _bacSc.showsVerticalScrollIndicator = YES;
    _bacSc.delegate = self;
    _bacSc.contentOffset = CGPointMake(0, 0);
    
    /*
     imgView-->view
     */
    _bimg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"p1.jpg"]];
    [_bimg setFrame:CGRectMake(0,0, _bView.frame.size.width, _bView.frame.size.height)];
    //[_bView addSubview:_bimg];
    /*
     在背景上添加图片
     */
    [self addPicInScrollView];
}
-(void)addPicInScrollView
{
    
    for (int i = 0; i<=2; i++) {
        UIImage *im = [UIImage imageNamed:[NSString stringWithFormat:@"p%d.jpg",i+1]];
        UIImageView *img = [[UIImageView alloc]initWithImage:im];
        img.userInteractionEnabled = YES;
        [img setFrame:CGRectMake(ScreenW*i, 0, ScreenW, 40)];
        for (int a = 0; a <= 2; a++) {
           UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
            [button setFrame:CGRectMake(ScreenW/3*a, 0, ScreenW/3, 40)];
            button.tag = 25+a;
            //button.backgroundColor = [UIColor blueColor];
            [button addTarget:self action:@selector(buttonClickInSCV:) forControlEvents:UIControlEventTouchUpInside];
            [img addSubview:button];
        }
        [_bacSc addSubview:img];
        //[_bacSc insertSubview:img atIndex:999];
        [_bacSc bringSubviewToFront:img];
    }
}
-(void)buttonClickInSCV:(UIButton *)button
{
    NSLog(@"dasdasdasdas");
    switch (button.tag) {
        case 25:
        {
            NSLog(@"b1");
            _b1.selected = YES;
            _b2.selected = NO;
            _b3.selected = NO;
            [UIView animateWithDuration:0.5 animations:^{
                _bacSc.contentOffset = CGPointMake(0, 0);
            }];

        }
            break;
        case 26:
        {
            NSLog(@"b2");
            _b1.selected = NO;
            _b2.selected = YES;
            _b3.selected = NO;
            [UIView animateWithDuration:0.5 animations:^{
                _bacSc.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
            }];
            
        }
            break;
        case 27:
        {
            NSLog(@"b3");
            _b1.selected = NO;
            _b2.selected = NO;
            _b3.selected = YES;
            [UIView animateWithDuration:0.5 animations:^{
                _bacSc.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width*2, 0);
            }];
            [self refreshBegin];
            [_bacSc addSubview:_tableView];
            [_bacSc addSubview:_commentView];
            [_bacSc insertSubview:_tableView atIndex:0];
        }
            break;

            
        default:
            break;
    }
}
#pragma mark tableView的代理方法
//第二个section的titleHeader
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView.tag == 1001) {
        if (_searchVC1.active) {
            return [self.sindexArray objectAtIndex:section];
        }
        return [self.indexArray objectAtIndex:section];
    }
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1000) {
        if (self.searchVC.active) {
            return  self.searchArr.count;
        }else
        {
            return _exampleArr.count;
        }
    }else if(tableView.tag == 1001)
    {
        if (_searchVC1.active) {
            return [[self.sletterResultArr objectAtIndex:section] count];
        }
            return [[self.letterResultArr objectAtIndex:section] count];
    }else
    {
        NSLog(@"返回朋友圈个数%ld",self.dataSource.count);
        return self.dataSource.count;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1000) {
        return 70;
    }
    if (tableView.tag ==1001) {
        return 50;
    }
    if (tableView.tag == 2000) {
        CellLayout* layout = self.dataSource[indexPath.row];
        NSLog(@"返回朋友圈高度%f",layout.cellHeight);
        return layout.cellHeight;
    }
    return 70;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 1000) {
        return 1;
    }else if(tableView.tag == 1001)
    {
        if (_searchVC1.active) {
             return [self.sindexArray count];
        }
           return [self.indexArray count];
    }else
    {
        NSLog(@"返回组数是1");
        return 1;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag ==1000) {
        InstanceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"instanCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"InstanceCell" owner:nil options:nil]lastObject];
        }
        if (self.searchVC.active) {
            cell.nameL.text = self.searchArr[indexPath.row];
        }else
        {
            cell.nameL.text = _exampleArr[indexPath.row];
        }

     return cell;
    }
    if (tableView.tag ==1001) {
        if (_searchVC1.active) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
            if (cell == nil){
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
            }
            //获得对应的Person对象<替换为你自己的model对象>
            Person *p = [[self.sletterResultArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            cell.textLabel.text = p.name;[NSString stringWithFormat:@"%@-->%ld",p.name,p.number];
            return cell;
        }else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
            if (cell == nil){
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
            }
            //获得对应的Person对象<替换为你自己的model对象>
            Person *p = [[self.letterResultArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            cell.textLabel.text = p.name;[NSString stringWithFormat:@"%@-->%ld",p.name,p.number];
            return cell;
        }
        
        
    }
    
    if (tableView.tag == 2000) {
        static NSString* cellIdentifier = @"cellIdentifier";
        NSLog(@"返回了cell");
        TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        [self confirgueCell:cell atIndexPath:indexPath];
        NSLog(@"返回了cell");
        return cell;
        NSLog(@"返回了cell");
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark scroll的代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1004) {
        CGPoint point = scrollView.contentOffset;
        //由偏移量算出目前是第几页
        int i = point.x / self.view.frame.size.width;
        switch (i) {
                case 0:
            {
                _b1.selected = YES;
                _b2.selected = NO;
                _b3.selected = NO;
                _bView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, 40);
                //[_bimg setImage:[UIImage imageNamed:@"p1.jpg"]];
            }
                break;
                case 1:
            {
                _b1.selected = NO;
                _b2.selected = YES;
                _b3.selected = NO;
                _bView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, 40);
                //[_bimg setImage:[UIImage imageNamed:@"p2.jpg"]];
            }
                break;
                case 2:
            {
                _b1.selected = NO;
                _b2.selected = NO;
                _b3.selected = YES;
                _bView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, 40);
                //[_bimg setImage:[UIImage imageNamed:@"p3.jpg"]];
             
                [self refreshBegin];
                [_bacSc addSubview:_tableView];
                [_bacSc addSubview:_commentView];
                [_bacSc insertSubview:_tableView atIndex:0];
            }
                break;
            default:
                break;
        }

    }
   }
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag != 1004) {
        [self.commentView endEditing:YES];
        CGFloat offset = scrollView.contentOffset.y;
        [self.tableViewHeader loadingViewAnimateWithScrollViewContentOffset:offset];
    }
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag != 1004) {
    CGFloat offset = scrollView.contentOffset.y;
    if (offset <= -kRefreshBoundary) {
        [self refreshBegin];
    }
    }
}

#pragma mark 搜索框的代理方法
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    if (searchController.view.tag == 1501) {
        NSString *searchString = [self.searchVC.searchBar text];
        NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
        if (self.searchArr!= nil) {
            [self.searchArr removeAllObjects];
        }
        //过滤数据
        self.searchArr= [NSMutableArray arrayWithArray:[_exampleArr filteredArrayUsingPredicate:preicate]];
        //刷新表格
        [self.tableView1 reloadData];
    }else
    {
        NSString *searchString = [self.searchVC1.searchBar text];
        NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
        if (self.searchArr!= nil) {
            [self.searchArr removeAllObjects];
        }
        //过滤数据
        self.searchArr= [NSMutableArray arrayWithArray:[_stringsToSort filteredArrayUsingPredicate:preicate]];
        //刷新表格
        //模拟网络请求接收到的数组对象 Person数组
        sdataArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i = 0; i<[self.searchArr count]; i++) {
            Person *p = [[Person alloc] init];
            p.name = [self.searchArr objectAtIndex:i];
            p.number = i;
            [sdataArray addObject:p];
        }
        //根据Person对象的 name 属性 按中文 对 Person数组 排序
        self.sindexArray = [BMChineseSort IndexWithArray:sdataArray Key:@"name"];
        self.sletterResultArr = [BMChineseSort sortObjectArray:sdataArray Key:@"name"];
        [self.tableView2 reloadData];
    }
 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UISearchController *)searchVC
{
    if (!_searchVC) {
        
        _searchVC = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchVC.searchResultsUpdater = self;
        
        _searchVC.dimsBackgroundDuringPresentation = NO;
        
        _searchVC.searchBar.placeholder = @"搜索";
        
        _searchVC.view.tag = 1501;
        
        [_searchVC.searchBar setValue:@"取消" forKey:@"_cancelButtonText"];
        
        [_searchVC.searchBar setTintColor:[UIColor blackColor]];
        
        _searchVC.hidesNavigationBarDuringPresentation = NO;
        
        _searchVC.searchBar.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, 44.0);
        
        self.tableView1.tableHeaderView = self.searchVC.searchBar;
        //s[self.view addSubview:self.searchVC.searchBar];
    }
    return _searchVC;
}
- (UISearchController *)searchVC1
{
    if (!_searchVC1) {
        
        _searchVC1 = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchVC1.searchResultsUpdater = self;
        
        _searchVC1.dimsBackgroundDuringPresentation = NO;
        
        _searchVC1.searchBar.placeholder = @"搜索";
        
        _searchVC1.view.tag = 1500;
        
        [_searchVC1.searchBar setValue:@"取消" forKey:@"_cancelButtonText"];
        
        [_searchVC1.searchBar setTintColor:[UIColor blackColor]];
        
        _searchVC1.hidesNavigationBarDuringPresentation = NO;
        
        _searchVC1.searchBar.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, 44.0);
        
        self.tableView2.tableHeaderView = self.searchVC1.searchBar;
        //s[self.view addSubview:self.searchVC.searchBar];
    }
    return _searchVC1;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];

    _searchVC.active = NO;
    _searchVC1.active = NO;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidAppearNotifications:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardDidHidenNotifications:)
//                                                 name:UIKeyboardWillHide];
}
//fc
     - (CommentView *)commentView {
         if (_commentView) {
             return _commentView;
         }
         __weak typeof(self) wself = self;
         _commentView = [[CommentView alloc]
                         initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 54.0f)
                         sendBlock:^(NSString *content) {
                             __strong  typeof(wself) swself = wself;
                             swself.postComment.content = content;
                             [swself postCommentWithCommentModel:swself.postComment];
                         }];
         return _commentView;
     }

- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(ScreenW*2,0,ScreenW, ScreenH-NavBarHigh-TabbarHeight)
                                              style:UITableViewStylePlain];
    _tableView.tag = 2000;
    _tableView.backgroundColor = rgb;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableHeaderView = self.tableViewHeader;
    return _tableView;
}

- (TableViewHeader *)tableViewHeader {
    if (_tableViewHeader) {
        return _tableViewHeader;
    }
    _tableViewHeader =
    [[TableViewHeader alloc] initWithFrame:CGRectMake(0.0f,
                                                      0.0f,
                                                      SCREEN_WIDTH,
                                                      300.0f)];
    return _tableViewHeader;
}
     //8
     - (void)confirgueCell:(TableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
         cell.displaysAsynchronously = self.displaysAsynchronously;
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
         cell.indexPath = indexPath;
         CellLayout* cellLayout = self.dataSource[indexPath.row];
         cell.cellLayout = cellLayout;
         [self callbackWithCell:cell];
     }
     //9
     - (void)callbackWithCell:(TableViewCell *)cell {
         
         __weak typeof(self) weakSelf = self;
         cell.clickedLikeButtonCallback = ^(TableViewCell* cell,BOOL isLike) {
             __strong typeof(weakSelf) sself = weakSelf;
             [sself tableViewCell:cell didClickedLikeButtonWithIsLike:isLike];
         };
         
         cell.clickedCommentButtonCallback = ^(TableViewCell* cell) {
             __strong typeof(weakSelf) sself = weakSelf;
             [sself commentWithCell:cell];
         };
         
         cell.clickedReCommentCallback = ^(TableViewCell* cell,CommentModel* model) {
             __strong typeof(weakSelf) sself = weakSelf;
             [sself reCommentWithCell:cell commentModel:model];
         };
         
         cell.clickedOpenCellCallback = ^(TableViewCell* cell) {
             __strong typeof(weakSelf) sself = weakSelf;
             [sself openTableViewCell:cell];
         };
         
         cell.clickedCloseCellCallback = ^(TableViewCell* cell) {
             __strong typeof(weakSelf) sself = weakSelf;
             [sself closeTableViewCell:cell];
         };
         
         cell.clickedAvatarCallback = ^(TableViewCell* cell) {
             __strong typeof(weakSelf) sself = weakSelf;
             [sself showAvatarWithCell:cell];
         };
         
         cell.clickedImageCallback = ^(TableViewCell* cell,NSInteger imageIndex) {
             __strong typeof(weakSelf) sself = weakSelf;
             [sself tableViewCell:cell showImageBrowserWithImageIndex:imageIndex];
         };
     }
     //10
#pragma mark - Actions
     //开始评论
     - (void)commentWithCell:(TableViewCell *)cell  {
         self.postComment.from = @"Waynezxcv的粉丝";
         self.postComment.to = @"";
         self.postComment.index = cell.indexPath.row;
         self.commentView.placeHolder = @"评论";
         if (![self.commentView.textView isFirstResponder]) {
             [self.commentView.textView becomeFirstResponder];
         }
     }
     //11
     //开始回复评论
     - (void)reCommentWithCell:(TableViewCell *)cell commentModel:(CommentModel *)commentModel {
         self.postComment.from = @"waynezxcv的粉丝";
         self.postComment.to = commentModel.to;
         self.postComment.index = commentModel.index;
         self.commentView.placeHolder = [NSString stringWithFormat:@"回复%@:",commentModel.to];
         if (![self.commentView.textView isFirstResponder]) {
             [self.commentView.textView becomeFirstResponder];
         }
     }
     //12
     //点击查看大图
     - (void)tableViewCell:(TableViewCell *)cell showImageBrowserWithImageIndex:(NSInteger)imageIndex {
         NSMutableArray* tmps = [[NSMutableArray alloc] init];
         for (NSInteger i = 0; i < cell.cellLayout.imagePostions.count; i ++) {
             LWImageBrowserModel* model = [[LWImageBrowserModel alloc]
                                           initWithplaceholder:nil
                                           thumbnailURL:[NSURL URLWithString:[cell.cellLayout.statusModel.imgs objectAtIndex:i]]
                                           HDURL:[NSURL URLWithString:[cell.cellLayout.statusModel.imgs objectAtIndex:i]]
                                           containerView:cell.contentView
                                           positionInContainer:CGRectFromString(cell.cellLayout.imagePostions[i])
                                           index:i];
             [tmps addObject:model];
         }
         LWImageBrowser* browser = [[LWImageBrowser alloc] initWithImageBrowserModels:tmps
                                                                         currentIndex:imageIndex];
         
         [browser show];
     }
     //13
     //查看头像
     - (void)showAvatarWithCell:(TableViewCell *)cell {
         [LWAlertView shoWithMessage:[NSString stringWithFormat:@"点击了头像:%@",cell.cellLayout.statusModel.name]];
     }
     
     //14
    /* 由于是异步绘制，而且为了减少View的层级，整个显示内容都是在同一个UIView上面，所以会在刷新的时候闪一下，这里可以先把原先Cell的内容截图覆盖在Cell上，
     延迟0.25s后待刷新完成后，再将这个截图从Cell上移除 */
     - (void)coverScreenshotAndDelayRemoveWithCell:(UITableViewCell *)cell cellHeight:(CGFloat)cellHeight {
         
         UIImage* screenshot = [GallopUtils screenshotFromView:cell];
         
         UIImageView* imgView = [[UIImageView alloc] initWithFrame:[self.tableView convertRect:cell.frame toView:self.tableView]];
         
         imgView.frame = CGRectMake(imgView.frame.origin.x,
                                    imgView.frame.origin.y,
                                    imgView.frame.size.width,
                                    cellHeight);
         
         imgView.contentMode = UIViewContentModeTop;
         imgView.backgroundColor = [UIColor whiteColor];
         imgView.image = screenshot;
         [self.tableView addSubview:imgView];
         
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [imgView removeFromSuperview];
         });
         
     }
     
     //15
     //点赞
     - (void)tableViewCell:(TableViewCell *)cell didClickedLikeButtonWithIsLike:(BOOL)isLike {
         
         
         CellLayout* layout = [self.dataSource objectAtIndex:cell.indexPath.row];
         NSMutableArray* newLikeList = [[NSMutableArray alloc] initWithArray:layout.statusModel.likeList];
         if (isLike) {
             [newLikeList addObject:@"waynezxcv的粉丝"];
         } else {
             [newLikeList removeObject:@"waynezxcv的粉丝"];
         }
         
         StatusModel* statusModel = layout.statusModel;
         statusModel.likeList = newLikeList;
         statusModel.isLike = isLike;
         layout = [self layoutWithStatusModel:statusModel index:cell.indexPath.row];
         
         [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:layout.cellHeight];
         
         [self.dataSource replaceObjectAtIndex:cell.indexPath.row withObject:layout];
         [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:cell.indexPath.row inSection:0]]
                               withRowAnimation:UITableViewRowAnimationNone];
     }
     
     //16
     //展开Cell
     - (void)openTableViewCell:(TableViewCell *)cell {
         CellLayout* layout =  [self.dataSource objectAtIndex:cell.indexPath.row];
         StatusModel* model = layout.statusModel;
         CellLayout* newLayout = [[CellLayout alloc] initContentOpendLayoutWithStatusModel:model
                                                                                     index:cell.indexPath.row
                                                                             dateFormatter:self.dateFormatter];
         
         [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:newLayout.cellHeight];
         
         
         [self.dataSource replaceObjectAtIndex:cell.indexPath.row withObject:newLayout];
         [self.tableView reloadRowsAtIndexPaths:@[cell.indexPath]
                               withRowAnimation:UITableViewRowAnimationNone];
     }
     //17
     //折叠Cell
     - (void)closeTableViewCell:(TableViewCell *)cell {
         CellLayout* layout =  [self.dataSource objectAtIndex:cell.indexPath.row];
         StatusModel* model = layout.statusModel;
         CellLayout* newLayout = [[CellLayout alloc] initWithStatusModel:model
                                                                   index:cell.indexPath.row
                                                           dateFormatter:self.dateFormatter];
         
         [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:newLayout.cellHeight];
         
         
         [self.dataSource replaceObjectAtIndex:cell.indexPath.row withObject:newLayout];
         [self.tableView reloadRowsAtIndexPaths:@[cell.indexPath]
                               withRowAnimation:UITableViewRowAnimationNone];
     }
     //18
     //发表评论
     - (void)postCommentWithCommentModel:(CommentModel *)model {
         
         CellLayout* layout = [self.dataSource objectAtIndex:model.index];
         NSMutableArray* newCommentLists = [[NSMutableArray alloc] initWithArray:layout.statusModel.commentList];
         NSDictionary* newComment = @{@"from":model.from,
                                      @"to":model.to,
                                      @"content":model.content};
         [newCommentLists addObject:newComment];
         StatusModel* statusModel = layout.statusModel;
         statusModel.commentList = newCommentLists;
         CellLayout* newLayout = [self layoutWithStatusModel:statusModel index:model.index];
         
         
         UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:model.index inSection:0]];
         [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:newLayout.cellHeight];
         
         [self.dataSource replaceObjectAtIndex:model.index withObject:newLayout];
         [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:model.index inSection:0]]
                               withRowAnimation:UITableViewRowAnimationNone];
     }
#pragma mark - Keyboard
     
     - (void)tapView:(id)sender {
         [self.commentView endEditing:YES];
     }
     //21
     - (void)keyboardDidAppearNotifications:(NSNotification *)notifications {
         NSDictionary *userInfo = [notifications userInfo];
         CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
         CGFloat keyboardHeight = keyboardSize.height;
         self.commentView.frame = CGRectMake(0.0f, SCREEN_HEIGHT - 44.0f - keyboardHeight, SCREEN_WIDTH, 44.0f);
     }
     //22
     - (void)keyboardDidHidenNotifications:(NSNotification *)notifications {
         self.commentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 44.0f);
     }
     //全部完事这个data21
#pragma mark - Data
     
     //模拟下拉刷新
     - (void)refreshBegin {
         [UIView animateWithDuration:0.2f animations:^{
             self.tableView.contentInset = UIEdgeInsetsMake(kRefreshBoundary, 0.0f, 0.0f, 0.0f);
         } completion:^(BOOL finished) {
             [self.tableViewHeader refreshingAnimateBegin];
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)),
                            dispatch_get_main_queue(), ^{
                                [self fakeDownload];
                            });
         }];
     }
     
     //模拟下载数据
     - (void)fakeDownload {
         dispatch_async(dispatch_get_global_queue(0, 0), ^{
             
                 [self.dataSource removeAllObjects];
                 for (NSInteger i = 0 ; i < 10; i ++) {//让数据更多
                     for (NSInteger i = 0; i < self.fakeDatasource.count; i ++) {
                         LWLayout* layout = [self layoutWithStatusModel:
                                             [[StatusModel alloc] initWithDict:self.fakeDatasource[i]]
                                                                  index:i];
                         [self.dataSource addObject:layout];
                         NSLog(@"下载数据");
                     }
                 }
            
             NSLog(@"还是没下载数据");
             dispatch_sync(dispatch_get_main_queue(), ^{
                 [self refreshComplete];
             });
         });
     }
     
     //模拟刷新完成
     - (void)refreshComplete {
         [self.tableViewHeader refreshingAnimateStop];
         [_tableView reloadData];
         [UIView animateWithDuration:0.35f animations:^{
             self.tableView.contentInset = UIEdgeInsetsMake(64.0f, 0.0f, 0.0f, 0.0f);
         } completion:^(BOOL finished) {
             self.needRefresh = NO;
         }];
     }
     
     
     - (CellLayout *)layoutWithStatusModel:(StatusModel *)statusModel index:(NSInteger)index {
         CellLayout* layout = [[CellLayout alloc] initWithStatusModel:statusModel
                                                                index:index
                                                        dateFormatter:self.dateFormatter];
         return layout;
     }
     //2
     - (void)segmentControlIndexChanged:(UISegmentedControl *)segmentedControl {
         NSInteger idx = segmentedControl.selectedSegmentIndex;
         switch (idx) {
                 case 0:
                 self.displaysAsynchronously = YES;
                 break;
                 case 1:
                 self.displaysAsynchronously = NO;
                 break;
         }
     }
     - (NSMutableArray *)dataSource {
         if (_dataSource) {
             return _dataSource;
         }
         _dataSource = [[NSMutableArray alloc] init];
         return _dataSource;
     }
     
     - (NSDateFormatter *)dateFormatter {
         static NSDateFormatter* dateFormatter;
         static dispatch_once_t onceToken;
         dispatch_once(&onceToken, ^{
             dateFormatter = [[NSDateFormatter alloc] init];
             [dateFormatter setDateFormat:@"MM月dd日 hh:mm"];
         });
         return dateFormatter;
     }
     
     - (CommentModel *)postComment {
         if (_postComment) {
             return _postComment;
         }
         _postComment = [[CommentModel alloc] init];
         return _postComment;
     }
     
     - (NSArray *)fakeDatasource {
         if (_fakeDatasource) {
             return _fakeDatasource;
         }
         _fakeDatasource =
         @[@{@"type":@"image",
             @"name":@"型格志style",
             @"avatar":@"http://tp4.sinaimg.cn/5747171147/50/5741401933/0",
             @"content":@"春天卫衣的正确打开方式https://github.com/waynezxcv/Gallop",
             @"date":@"1459668442",
             @"imgs":@[@"http://ww2.sinaimg.cn/mw690/006gWxKPgw1f2jeloxwhnj30fu0g0ta5.jpg",
                       @"http://ww3.sinaimg.cn/mw690/006gWxKPgw1f2jelpn9bdj30b40gkgmh.jpg",
                       @"http://ww1.sinaimg.cn/mw690/006gWxKPgw1f2jelriw1bj30fz0g175g.jpg",
                       @"http://ww3.sinaimg.cn/mw690/006gWxKPgw1f2jelt1kh5j30b10gmt9o.jpg",
                       @"http://ww4.sinaimg.cn/mw690/006gWxKPgw1f2jeluxjcrj30fw0fz0tx.jpg",
                       @"http://ww3.sinaimg.cn/mw690/006gWxKPgw1f2jelzxngwj30b20godgn.jpg",
                       @"http://ww2.sinaimg.cn/mw690/006gWxKPgw1f2jelwmsoej30fx0fywfq.jpg",
                       @"http://ww4.sinaimg.cn/mw690/006gWxKPgw1f2jem32ccrj30xm0sdwjt.jpg",
                       @"http://ww4.sinaimg.cn/mw690/006gWxKPgw1f2jelyhutwj30fz0fxwfr.jpg",],
             @"statusID":@"8",
             @"commentList":@[@{@"from":@"SIZE潮流生活",
                                @"to":@"waynezxcv",
                                @"content":@"nice~使用Gallop。支持异步绘制，让滚动如丝般顺滑。"}],
             @"isLike":@(NO),
             @"likeList":@[@"waynezxcv"]},
           
           @{@"type":@"image",
             @"name":@"SIZE潮流生活",
             @"avatar":@"http://tp2.sinaimg.cn/1829483361/50/5753078359/1",
             @"content":@"近日[心][心][心][心][心][心][face]，adidas Originals😂为经典鞋款Stan Smith打造Primeknit版本，并带来全新的“OG”系列。简约的鞋身采用白色透气Primeknit针织材质制作，再将Stan Smith代表性的绿、红、深蓝三个元年色调融入到鞋舌和后跟点缀，最后搭载上米白色大底来保留其复古风味。据悉该鞋款将在今月登陆全球各大adidas Originals指定店舖。https://github.com/waynezxcv/Gallop <-",
             @"date":@"1459668442",
             @"imgs":@[@"http://ww2.sinaimg.cn/mw690/6d0bb361gw1f2jim2hgxij20lo0egwgc.jpg",
                       @"http://ww3.sinaimg.cn/mw690/6d0bb361gw1f2jim2hsg6j20lo0egwg2.jpg",
                       @"http://ww1.sinaimg.cn/mw690/6d0bb361gw1f2jim2d7nfj20lo0eg40q.jpg",
                       @"http://ww1.sinaimg.cn/mw690/6d0bb361gw1f2jim2hka3j20lo0egdhw.jpg",
                       @"http://ww2.sinaimg.cn/mw690/6d0bb361gw1f2jim2hq61j20lo0eg769.jpg"],
             @"statusID":@"1",
             @"commentList":@[@{@"from":@"SIZE潮流生活",
                                @"to":@"",
                                @"content":@"使用Gallop来快速构建图文混排界面。享受如丝般顺滑的滚动体验。"},
                              @{@"from":@"waynezxcv",
                                @"to":@"SIZE潮流生活",
                                @"content":@"哈哈哈哈"},
                              @{@"from":@"SIZE潮流生活",
                                @"to":@"waynezxcv",
                                @"content":@"nice~使用Gallop。支持异步绘制，让滚动如丝般顺滑。"}],
             @"isLike":@(NO),
             @"likeList":@[@"waynezxcv",@"伊布拉希莫维奇",@"权志龙",@"郜林",@"扎克伯格"]},
           
           @{@"type":@"website",
             @"name":@"Ronaldo",
             @"avatar":@"https://avatars0.githubusercontent.com/u/8408918?v=3&s=460",
             @"content":@"Easy to use yet capable of so much, iOS 9 was engineered to work hand in hand with the advanced technologies built into iPhone.",
             @"date":@"1459668442",
             @"imgs":@[@"http://ww2.sinaimg.cn/mw690/6d0bb361gw1f2jim2hgxij20lo0egwgc.jpg"],
             @"detail":@"LWAlchemy,A fast and lightweight ORM framework for Cocoa and Cocoa Touch.",
             @"statusID":@"1",
             @"commentList":@[@{@"from":@"伊布拉西莫维奇",
                                @"to":@"",
                                @"content":@"使用Gallop来快速构建图文混排界面。享受如丝般顺滑的滚动体验。"}],
             @"isLike":@(NO),
             @"likeList":@[@"waynezxcv",@"Gallop"]},
           
           
           @{@"type":@"image",
             @"name":@"妖妖小精",
             @"avatar":@"http://tp2.sinaimg.cn/2185608961/50/5714822219/0",
             @"content":@"出国留学的儿子为思念自己的家人们寄来一个用自己照片做成的人形立牌",
             @"date":@"1459668442",
             @"imgs":@[@"http://ww3.sinaimg.cn/mw690/8245bf01jw1f2jhh2ohanj20jg0yk418.jpg",
                       @"http://ww4.sinaimg.cn/mw690/8245bf01jw1f2jhh34q9rj20jg0px77y.jpg",
                       @"http://ww1.sinaimg.cn/mw690/8245bf01jw1f2jhh3grfwj20jg0pxn13.jpg",
                       @"http://ww4.sinaimg.cn/mw690/8245bf01jw1f2jhh3ttm6j20jg0el76g.jpg",
                       @"http://ww3.sinaimg.cn/mw690/8245bf01jw1f2jhh43riaj20jg0pxado.jpg",
                       @"http://ww2.sinaimg.cn/mw690/8245bf01jw1f2jhh4mutgj20jg0ly0xt.jpg",
                       @"http://ww3.sinaimg.cn/mw690/8245bf01jw1f2jhh4vc7pj20jg0px41m.jpg",],
             @"statusID":@"2",
             @"commentList":@[@{@"from":@"炉石传说",
                                @"to":@"",
                                @"content":@"#炉石传说#"},
                              @{@"from":@"waynezxcv",
                                @"to":@"SIZE潮流生活",
                                @"content":@"哈哈哈哈"},
                              @{@"from":@"SIZE潮流生活",
                                @"to":@"waynezxcv",
                                @"content":@"nice~使用Gallop。支持异步绘制，让滚动如丝般顺滑。"}],
             @"isLike":@(NO),
             @"likeList":@[@"waynezxcv"]},
           
           @{@"type":@"image",
             @"name":@"Instagram热门",
             @"avatar":@"http://tp4.sinaimg.cn/5074408479/50/5706839595/0",
             @"content":@"Austin Butler & Vanessa Hudgens  想试试看扑到一个一米八几的人怀里是有多舒服[心]",
             @"date":@"1459668442",
             @"imgs":@[@"http://ww1.sinaimg.cn/mw690/005xpHs3gw1f2jg132p3nj309u0goq62.jpg",
                       @"http://ww3.sinaimg.cn/mw690/005xpHs3gw1f2jg14per3j30b40ctmzp.jpg",
                       @"http://ww3.sinaimg.cn/mw690/005xpHs3gw1f2jg14vtjjj30b40b4q5m.jpg",
                       @"http://ww1.sinaimg.cn/mw690/005xpHs3gw1f2jg15amskj30b40f1408.jpg",
                       @"http://ww3.sinaimg.cn/mw690/005xpHs3gw1f2jg16f8vnj30b40g4q4q.jpg",
                       @"http://ww4.sinaimg.cn/mw690/005xpHs3gw1f2jg178dxdj30am0gowgv.jpg",
                       @"http://ww2.sinaimg.cn/mw690/005xpHs3gw1f2jg17c5urj30b40ghjto.jpg"],
             @"statusID":@"3",
             @"commentList":@[@{@"from":@"waynezxcv",
                                @"to":@"SIZE潮流生活",
                                @"content":@"哈哈哈哈"},
                              @{@"from":@"SIZE潮流生活",
                                @"to":@"waynezxcv",
                                @"content":@"nice~使用Gallop。支持异步绘制，让滚动如丝般顺滑。"}],
             @"isLike":@(NO),
             @"likeList":@[@"Tim Cook"]},
           
           
           @{@"type":@"image",
             @"name":@"头条新闻",
             @"avatar":@"http://tp1.sinaimg.cn/1618051664/50/5735009977/0",
             @"content":@"#万象# 【熊孩子！4名小学生铁轨上设障碍物逼停火车】4名小学生打赌，1人认为火车会将石头碾成粉末，其余3人不信，认为只会碾碎，于是他们将道碴摆放在铁轨上。火车司机发现前方不远处的铁轨上，摆放了影响行车安全的障碍物，于是紧急采取制动，列车中途停车13分钟。O4名学生铁轨上设障碍物逼停火车#waynezxcv# nice",
             @"date":@"1459668442",
             @"imgs":@[@"http://ww2.sinaimg.cn/mw690/60718250jw1f2jg46smtmj20go0go77r.jpg"],
             @"statusID":@"4",
             @"commentList":@[@{@"from":@"waynezxcv",
                                @"to":@"SIZE潮流生活",
                                @"content":@"哈哈哈哈"},
                              @{@"from":@"SIZE潮流生活",
                                @"to":@"waynezxcv",
                                @"content":@"nice~使用Gallop。支持异步绘制，让滚动如丝般顺滑。"}],
             @"isLike":@(NO),
             @"likeList":@[@"Tim Cook"]},
           
           
           @{@"type":@"image",
             @"name":@"Kindle中国",
             @"avatar":@"http://tp1.sinaimg.cn/3262223112/50/5684307907/1",
             @"content":@"#只限今日#《简单的逻辑学》作者D.Q.麦克伦尼在书中提出了28种非逻辑思维形式，抛却了逻辑学一贯的刻板理论，转而以轻松的笔触带领我们畅游这个精彩无比的逻辑世界；《蝴蝶梦》我错了，我曾以为付出自己就是爱你。全球公认20世纪伟大的爱情经典，大陆独家合法授权。",
             @"date":@"",
             @"imgs":@[@"http://ww2.sinaimg.cn/mw690/c2719308gw1f2hav54htyj20dj0l00uk.jpg",
                       @"http://ww4.sinaimg.cn/mw690/c2719308gw1f2hav47jn7j20dj0j341h.jpg"],
             @"statusID":@"6",
             @"commentList":@[@{@"from":@"Kindle中国",
                                @"to":@"",
                                @"content":@"统一回复,使用Gallop来快速构建图文混排界面。享受如丝般顺滑的滚动体验。"}],
             @"isLike":@(NO),
             @"likeList":@[@"waynezxcv"]},
           
           
           
           @{@"type":@"image",
             @"name":@"G-SHOCK",
             @"avatar":@"http://tp3.sinaimg.cn/1595142730/50/5691224157/1",
             @"content":@"就算平时没有时间，周末也要带着G-SHOCK到户外走走，感受大自然的满满正能量！",
             @"date":@"1459668442",
             @"imgs":@[@"http://ww2.sinaimg.cn/mw690/5f13f24ajw1f2hc1r6j47j20dc0dc0t4.jpg"],
             @"statusID":@"7",
             @"commentList":@[@{@"from":@"SIZE潮流生活",
                                @"to":@"",
                                @"content":@"使用Gallop来快速构建图文混排界面。享受如丝般顺滑的滚动体验。"},
                              @{@"from":@"waynezxcv",
                                @"to":@"SIZE潮流生活",
                                @"content":@"哈哈哈哈"},
                              @{@"from":@"SIZE潮流生活",
                                @"to":@"waynezxcv",
                                @"content":@"nice~使用Gallop。支持异步绘制，让滚动如丝般顺滑。"}],
             @"isLike":@(NO),
             @"likeList":@[@"waynezxcv"]},
           
           
           
           
           
           @{@"type":@"image",
             @"name":@"数字尾巴",
             @"avatar":@"http://tp1.sinaimg.cn/1726544024/50/5630520790/1",
             @"content":@"外媒 AndroidAuthority 日前曝光诺基亚首款回归作品 NOKIA A1 的渲染图，手机的外形很 N 记，边框控制的不错。这是一款纯正的 Android 机型，传闻手机将采用 5.5 英寸 1080P 屏幕，搭载骁龙 652，Android 6.0 系统，并使用了诺基亚自家的 Z 启动器，不过具体发表的时间还是未知。尾巴们你会期待吗？",
             @"date":@"1459668442",
             @"imgs":@[@"http://ww3.sinaimg.cn/mw690/66e8f898gw1f2jck6jnckj20go0fwdhb.jpg"],
             @"statusID":@"9",
             @"commentList":@[@{@"from":@"SIZE潮流生活",
                                @"to":@"",
                                @"content":@"使用Gallop来快速构建图文混排界面。享受如丝般顺滑的滚动体验。"},
                              @{@"from":@"waynezxcv",
                                @"to":@"SIZE潮流生活",
                                @"content":@"哈哈哈哈"},
                              @{@"from":@"SIZE潮流生活",
                                @"to":@"waynezxcv",
                                @"content":@"nice~使用Gallop。支持异步绘制，让滚动如丝般顺滑。"}],
             @"isLike":@(NO),
             @"likeList":@[@"waynezxcv"]},
           
           
           @{@"type":@"image",
             @"name":@"欧美街拍XOXO",
             @"avatar":@"http://tp4.sinaimg.cn/1708004923/50/1283204657/0",
             @"content":@"3.31～4.2 肯豆",
             @"date":@"1459668442",
             @"imgs":@[@"http://ww2.sinaimg.cn/mw690/65ce163bjw1f2jdkd2hgjj20cj0gota8.jpg",
                       @"http://ww1.sinaimg.cn/mw690/65ce163bjw1f2jdkjdm96j20bt0gota9.jpg",
                       @"http://ww2.sinaimg.cn/mw690/65ce163bjw1f2jdkvwepij20go0clgnd.jpg",
                       @"http://ww4.sinaimg.cn/mw690/65ce163bjw1f2jdl2ao77j20ci0gojsw.jpg",],
             @"statusID":@"10",
             @"commentList":@[@{@"from":@"waynezxcv",
                                @"to":@"SIZE潮流生活",
                                @"content":@"哈哈哈哈"}],
             @"isLike":@(NO),
             @"likeList":@[@"waynezxcv"]},
           ];
         return _fakeDatasource;
     }

     //all22

     //19

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
