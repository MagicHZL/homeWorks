//
//  CurveView.m
//  curveAnimation
//
//  Created by ZhongLiangHao on 2017/6/6.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "CurveView.h"

@implementation CurveView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //圆弧为 圆的一部分
    UIBezierPath *path2 = [[UIBezierPath alloc] init];
    [path2 addArcWithCenter:CGPointMake(self.bounds.size.width/2.0, self.hY) radius:self.width startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [path2  fill];
    
    
}


@end
