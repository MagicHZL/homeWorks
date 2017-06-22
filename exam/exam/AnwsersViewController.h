//
//  AnwsersViewController.h
//  exam
//
//  Created by ZhongLiangHao on 2017/6/22.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

typedef void(^GoQestion)(NSIndexPath *index);

@interface AnwsersViewController : UIViewController

@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)NSArray *questions;
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,copy)GoQestion goQestion;

@end
