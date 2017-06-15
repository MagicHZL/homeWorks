//
//  CircleLableView.m
//  paint
//
//  Created by ZhongLiangHao on 2017/6/15.
//  Copyright © 2017年 yizhi. All rights reserved.
//

#import "CircleLableView.h"


@implementation CircleLableView

-(instancetype)initWithFrame:(CGRect)frame{


    if (self = [super initWithFrame:frame]) {
        
        [self creatUI];
        
    }

    return self;
}


-(void)creatUI{

    self.circleView = [[CircleView alloc] initWithFrame:self.bounds];

    self.circleView.backgroundColor = [UIColor whiteColor];
    
    UILabel *num = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.circleView.frame), CGRectGetWidth(self.circleView.frame)-10)];
    num.text = @"50";
  
    num.font = [UIFont systemFontOfSize:45];
    [num sizeToFit];
    
    num.center = CGPointMake(self.circleView.center.x, self.circleView.center.y - 5) ;
    num.textAlignment = NSTextAlignmentCenter;
    
    UILabel *small = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(num.frame),5, 20, 20)];
    
    small.text = @"%";
    small.font = [UIFont systemFontOfSize:14];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 48, CGRectGetWidth(self.frame), 30)];
    title.text = @"合格率";
    title.font = [UIFont systemFontOfSize:15];
    title.textAlignment = NSTextAlignmentCenter;
    
    [self.circleView addSubview:title];
    
    [num addSubview:small];
    
    [self.circleView addSubview:num];
    [self addSubview:self.circleView];
}

@end
