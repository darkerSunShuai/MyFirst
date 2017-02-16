//
//  facultyCell.h
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/10.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface facultyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *introduceT;
-(void)cellAutoLayoutHeight:(NSString *)str;
@end
