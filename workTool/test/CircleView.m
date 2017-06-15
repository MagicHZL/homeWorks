//
//  CircleView.m
//  paint
//
//  Created by ZhongLiangHao on 2017/6/12.
//  Copyright © 2017年 yizhi. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //低园
    CGContextSetLineWidth(ctx, 5);
    CGContextAddArc(ctx, self.bounds.size.width/2.0,self.bounds.size.width/2.0 , (self.bounds.size.width/2.0)-6, 0,2*M_PI, 0);
    
    CGContextSetRGBStrokeColor(ctx, 0, 100, 0, 1);
    CGContextSetStrokeColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    //比例
    CGContextSetLineWidth(ctx, 9);
    CGContextAddArc(ctx, self.bounds.size.width/2.0,self.bounds.size.width/2.0 , (self.bounds.size.width/2.0)-6, -M_PI/2,-3*M_PI/2, 1);
    CGContextSetStrokeColorWithColor(ctx,[UIColor redColor].CGColor);
    CGContextDrawPath(ctx, kCGPathStroke);

    
}


@end
