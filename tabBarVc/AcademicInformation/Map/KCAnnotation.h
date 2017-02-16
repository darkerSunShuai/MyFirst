//
//  KCAnnotation.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/11.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface KCAnnotation : NSObject<MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@end
