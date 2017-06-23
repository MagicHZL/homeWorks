//
//  TimeObj.h
//  exam
//
//  Created by ZhongLiangHao on 2017/6/23.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TimeObjWeak <NSObject>


-(void)timeActionForWeak;

@end

@interface TimeObj : NSObject

@property(nonatomic,weak)id<TimeObjWeak> weak;


-(void)timeActionForObj;

@end
