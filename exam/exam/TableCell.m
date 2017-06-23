//
//  TableCell.m
//  exam
//
//  Created by ZhongLiangHao on 2017/6/21.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.btn.layer.cornerRadius = 20;
    self.btn.layer.borderColor = [UIColor blueColor].CGColor;
    self.btn.layer.borderWidth = 1;
    self.btn.userInteractionEnabled = NO;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
