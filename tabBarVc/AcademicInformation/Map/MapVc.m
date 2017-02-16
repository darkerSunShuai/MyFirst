//
//  MapVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/11.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "MapVc.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "KCAnnotation.h"

@interface MapVc ()<MKMapViewDelegate,CLLocationManagerDelegate>{
    CLLocationManager *_locationManager;
    CLLocationManager *_locationManager2;
}
@property(nonatomic,strong)MKMapView *mapView;
@end

@implementation MapVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 1、判断设备是否开启定位服务
    if (![CLLocationManager locationServicesEnabled]) {
        // 弹框提示
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示"
                                                                                 message:@"您的设备暂未开启定位服务!"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                            style:UIAlertActionStyleDefault
                                                          handler:nil]];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
    // 2、初始化定位服务
    _locationManager2 = [[CLLocationManager alloc] init];
    // 3、请求定位授权
    
    // a、请求在使用期间授权（弹框提示用户是否允许在使用期间定位）,需添加NSLocationWhenInUseUsageDescription到info.plist；
    // b、请求在后台定位授权（弹框提示用户是否允许不在使用App时仍然定位）,需添加NSLocationAlwaysUsageDescription添加key到info.plist；
    [_locationManager2 requestAlwaysAuthorization];
    
    // 4、设置定位精度
    _locationManager2.desiredAccuracy = kCLLocationAccuracyBest;
    
    // 5、设置定位频率，每隔多少米定位一次
    _locationManager2.distanceFilter = 10.0;
    
    // 6、设置代理
    _locationManager2.delegate = self;
    
    // 7、开始定位
    // 注意：开始定位比较耗电，不需要定位的时候最好调用[stopUpdatingLocation]结束定位。
    [_locationManager2 startUpdatingLocation];
    
    
    [self initGUI];
}
#pragma mark - CLLocationManagerDelegate methods
// 定位失败
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"%@", error.localizedDescription);
}

// 位置更新
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    // 获取最新定位
    CLLocation *locatition = locations.lastObject;
    // 打印位置信息
    NSLog(@"。。。。。。。。。latitude：%.2f, longitude：%.2f", locatition.coordinate.latitude, locatition.coordinate.longitude);
    
    // 停止定位
    [_locationManager2 stopUpdatingLocation];
}
#pragma mark 添加地图控件
-(void)initGUI{
    CGRect rect=[UIScreen mainScreen].bounds;
    _mapView=[[MKMapView alloc]initWithFrame:rect];
    [self.view addSubview:_mapView];
    //设置代理
    _mapView.delegate=self;
    
    //请求定位服务
    _locationManager=[[CLLocationManager alloc]init];
    if(![CLLocationManager locationServicesEnabled]||[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusAuthorizedWhenInUse){
        [_locationManager requestWhenInUseAuthorization];
    }
    
    //用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
    _mapView.userTrackingMode=MKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;
    _mapView.zoomEnabled = 1;
    _mapView.scrollEnabled = 1;
    _mapView.rotateEnabled = 1;
    //设置地图类型
    _mapView.mapType=MKMapTypeStandard;
    
    //添加大头针
    [self addAnnotation];
    [self.view addSubview:_mapView];
}
#pragma mark 添加大头针
-(void)addAnnotation{
    CLLocationCoordinate2D location1=CLLocationCoordinate2DMake(41.160921, 122.054746);
    KCAnnotation *annotation1=[[KCAnnotation alloc]init];
    annotation1.title=@"辽宁奉和";
    annotation1.subtitle=@"辽宁奉和。。。。。";
    annotation1.coordinate=location1;
    [_mapView addAnnotation:annotation1];
    
    CLLocationCoordinate2D location2=CLLocationCoordinate2DMake(41.160921, 122.054746);
    KCAnnotation *annotation2=[[KCAnnotation alloc]init];
    annotation2.title=@"孙帅";
    annotation2.subtitle=@"孙帅，，，，";
    annotation2.coordinate=location2;
    [_mapView addAnnotation:annotation2];
}
#pragma mark - 地图控件代理方法
#pragma mark 更新用户位置，只要用户改变则调用此方法（包括第一次定位到用户位置）
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    NSLog(@"%@。。。。。。。。。。啦啦啦啦啦啦",userLocation);
    //设置地图显示范围(如果不进行区域设置会自动显示区域范围并指定当前用户位置为地图中心点)
       MKCoordinateSpan span=MKCoordinateSpanMake(0.01, 0.01);
        MKCoordinateRegion region=MKCoordinateRegionMake(userLocation.location.coordinate, span);
        [_mapView setRegion:region animated:true];
}

//- (void)dealloc
//{
//#if DEBUG
//    // Xcode8 / iOS10 MKMapView错误解决方法
//    static NSMutableArray* unusedObjects;
//    if (!unusedObjects)
//        unusedObjects = [NSMutableArray new];
//    [unusedObjects addObject:_mapView];
//    
//#endif
//    
//}
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
