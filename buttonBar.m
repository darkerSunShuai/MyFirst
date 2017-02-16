//
//  buttonBar.m
//  SmartCampus;
//
//  Created by qiuqiu on 2016/12/23.
//  Copyright © 2016年 qiuqiu. All rights reserved.
//

#import "buttonBar.h"

@implementation buttonBar
-(void)creatBt:(NSString *)mode andwithArray:(NSArray *)array andWith:(CGRect )rect
{
    CGRect r = [ UIScreen mainScreen ].bounds;
    NSLog(@"x:%f/ny:%f/nwidth:%f/nheight:%f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
    for (int i = 0; i < array.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //当名字重复的时候可以通过设置tag值来找。
        //[button setTag:1050+i];
        [button setFrame:CGRectMake(0, i*44, 100, 44)];
        //[button setBackgroundColor:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.6f]];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button addTarget:_home action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        [button setAdjustsImageWhenHighlighted:YES];
        [self addSubview:button];
    }
    if (!_isTheLast) {
        self.frame = CGRectMake(rect.origin.x,rect.origin.y-array.count*44-_tabHi, 100, array.count*44);
    }else{
       self.frame = CGRectMake(r.size.width-100,rect.origin.y-array.count*44-_tabHi, 100, array.count*44);
    }
    UIImageView * image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:mode]];
    image.frame = CGRectMake(0, 0, 100, self.frame.size.height);
    [self addSubview:image];
}
-(void)button:(UIButton *)button{
    NSLog(@"未添加伪代理。。。。。。。。。。");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
