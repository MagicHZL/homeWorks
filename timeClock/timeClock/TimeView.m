//
//  TimeView.m
//  timeClock
//
//  Created by 高鹏程 on 17/4/11.
//  Copyright © 2017年 gpc. All rights reserved.
//

#import "TimeView.h"
#define A 40
#define B 40
#define C 40
#define D 50

@implementation TimeView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        _m = 0;
    }
    
    return self;

}

- (void)drawRect:(CGRect)rect {
    
//    content
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    double x = 0.0;
    double y = 0.0;
    double z = 0.0;
    double k = 0.0;
    
    for (int i= 0; i<12; i++) {
        
        
        x = A + 30 * sin(M_PI/6.0*i);
        y = B +30 - 30* cos(M_PI/6.0*i);
        z = C +20 * sin(M_PI/6.0*i);
        k = D + 20 - 20* cos(M_PI/6.0*i);
        
        if (i<self.m) {
            
            CGContextSetRGBStrokeColor(context, 70.0 / 255.0, 241.0 / 255.0, 241.0 / 255.0, 1.0);
            
        }else{
        
            CGContextSetRGBStrokeColor(context, 0 / 255.0, 0 / 255.0, 0 / 255.0, 1.0);
        }
        
        CGContextMoveToPoint(context, x, y);  //起点坐标
        CGContextAddLineToPoint(context, z, k);   //终点坐标
        CGContextStrokePath(context);
    }
    
   
    
}

@end
