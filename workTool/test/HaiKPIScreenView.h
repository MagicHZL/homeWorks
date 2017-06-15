//
//  HaiKPIScreenView.h
//  test
//
//  Created by ZhongLiangHao on 2017/6/15.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Screen)(NSString* a);

@interface HaiKPIScreenView : UIView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *arrs;

@property(nonatomic,strong)UITableView *tableView;



@end
