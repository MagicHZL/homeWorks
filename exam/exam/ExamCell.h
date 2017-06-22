//
//  ExamCell.h
//  exam
//
//  Created by ZhongLiangHao on 2017/6/21.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCell.h"
#import "TestModel.h"

@class ExamCell;

@protocol TableCellDelgate <NSObject>

-(void)getAnswerCell:(ExamCell*)exam index:(NSInteger)index;


@end

@interface ExamCell : UICollectionViewCell <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)id<TableCellDelgate> delgate;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)TestModel *model;
@property(nonatomic,copy)NSString *answer;
@end
