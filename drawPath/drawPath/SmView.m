//
//  SmView.m
//  drawPath
//
//  Created by 高鹏程 on 17/5/8.
//  Copyright © 2017年 gpc. All rights reserved.
//

#import "SmView.h"

@implementation SmView
{
    UIBezierPath *path;
    NSMutableArray *pointArray;
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.*/
-(instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        path = [UIBezierPath bezierPath];
        pointArray = [NSMutableArray array];
        return self;
    }
    return nil;
    
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [path moveToPoint:self.bPoint];
    [path addLineToPoint:self.ePoint];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,0.2,0.3,0.4,1);
    CGContextSetLineWidth(context, 2);
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathStroke);
    
    
    
}

@end
