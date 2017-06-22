//
//  AnsersCell.m
//  exam
//
//  Created by ZhongLiangHao on 2017/6/22.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "AnsersCell.h"

@implementation AnsersCell


-(instancetype)initWithFrame:(CGRect)frame{



    if (self = [super initWithFrame:frame]) {
        
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.num = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame)*0.6,  CGRectGetWidth(frame)*0.6)];
        self.num.center = self.contentView.center;
        self.num.textAlignment = NSTextAlignmentCenter;
        self.num.textColor = [UIColor blueColor];
        self.num.backgroundColor = [UIColor whiteColor];
        self.num.layer.cornerRadius = CGRectGetWidth(frame)*0.6/2;
        self.num.layer.borderWidth = 1;
        self.num.layer.borderColor = [UIColor blueColor].CGColor;
        self.num.layer.masksToBounds = YES;
        [self.contentView addSubview:self.num];
        
        
    }

    return self;



}

@end
