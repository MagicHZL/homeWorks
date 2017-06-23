//
//  TimeObj.m
//  exam
//
//  Created by ZhongLiangHao on 2017/6/23.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "TimeObj.h"


@implementation TimeObj


-(void)timeActionForObj{


    if ([self.weak respondsToSelector:@selector(timeActionForWeak)]) {
        
        
        [self.weak timeActionForWeak];
        
    }


}


@end
