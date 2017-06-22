//
//  TestModel.h
//  exam
//
//  Created by ZhongLiangHao on 2017/6/22.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject

@property(nonatomic,assign)int testId;
@property(nonatomic,copy)NSString* title;
@property(nonatomic,strong)NSArray *questions;


-(void)getData:(NSDictionary*)dic;

@end
