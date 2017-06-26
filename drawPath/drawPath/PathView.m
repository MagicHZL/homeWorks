//
//  PathView.m
//  drawPath
//
//  Created by 高鹏程 on 17/5/8.
//  Copyright © 2017年 gpc. All rights reserved.
//

#import "PathView.h"

@implementation PathView
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
   
    
    [path removeAllPoints];
    
    for (int i=0; i<pointArray.count; i++) {
        
        if (i==0) {
            
            [path moveToPoint:[pointArray[i] CGPointValue]];
            
        }else{
        
            [path addLineToPoint:[pointArray[i] CGPointValue]];
        
        }
    
        
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context,0.2,0.3,0.4,1);
    CGContextSetLineWidth(context, 2);
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathStroke);
    
    
    
}

-(void)setPoint:(CGPoint)point{

    _point = point;
    NSMutableArray *arr = [NSMutableArray array];
    for (NSValue *value in pointArray) {
        CGPoint p = [value CGPointValue];
        p.x -=5;
        if (p.x>0) {
            [arr addObject:[NSValue valueWithCGPoint:p]];
        }
    }
    
    [pointArray removeAllObjects];
    [pointArray addObjectsFromArray:arr];
    
    [pointArray addObject:[NSValue valueWithCGPoint:point]];
    NSLog(@"%ld",pointArray.count);
    [self setNeedsDisplay];

}

@end
