//
//  HaiClassifyCell.m
//  test
//
//  Created by ZhongLiangHao on 2017/6/15.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "HaiClassifyCell.h"

@implementation HaiClassifyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.classify.layer.borderWidth = 1;
    self.classify.layer.borderColor = [UIColor blackColor].CGColor;
    self.classify.layer.cornerRadius = 4;
    self.classify.layer.masksToBounds = YES;
}

@end
