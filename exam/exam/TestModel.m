//
//  TestModel.m
//  exam
//
//  Created by ZhongLiangHao on 2017/6/22.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

/*
 
 {
 "id":"0"
 "name":"试题一",
 "q1":"lala",
 "q2":"haha",
 "q3":"dada",
 "q4":"xiix",
 "real":"dada"
 }
 */

-(void)getData:(NSDictionary*)dic{

    self.testId = [dic[@"id"] intValue];
    self.title = dic[@"name"];
    NSString *isMu = dic[@"isMutible"];
    self.isMutible = [isMu boolValue];
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 1; i<10; i++) {
        
        NSString *key = [NSString stringWithFormat:@"q%d",i];
        
        if (dic[key]) {
            
            [arr addObject:dic[key]];
            self.questions = [arr copy];
        }else{
        
            break;
        
        }
        
        
    }


}


@end
