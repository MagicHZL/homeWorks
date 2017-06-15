//
//  HaiKPIScreenView.m
//  test
//
//  Created by ZhongLiangHao on 2017/6/15.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "HaiKPIScreenView.h"

@implementation HaiKPIScreenView{

    int mainTag ;
    BOOL isOpen[100];
}

-(instancetype)initWithFrame:(CGRect)frame{


    if (self = [super initWithFrame:frame]) {
        
        
        self.arrs = @[@"一级",@"二级",@"三级",@"四级",@"五级"];
        mainTag = 555;
        [self creatUI];
        
    }

    return self;

}


-(void)creatUI{

    //bg
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    bgView.backgroundColor = [UIColor colorWithWhite:.5 alpha:.3];
    
    [self addSubview:bgView];

 
    
    CGFloat height = 50.0 * self.arrs.count;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) -height - 80 , CGRectGetWidth(self.frame), height)];
    
    self.tableView.sectionHeaderHeight = 50;
    self.tableView.delegate = self;
    self.tableView.dataSource =self;

    [self addSubview:self.tableView];
    
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, self.tableView.frame.origin.y - 50, CGRectGetWidth(self.frame), 50)];
    title.backgroundColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"筛选";
    [self addSubview:title];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, CGRectGetMaxY(self.tableView.frame) +30, CGRectGetWidth(self.frame), 50);
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(removeAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    
    UIView *subViews = [[UIView alloc] initWithFrame:CGRectMake(0, self.tableView.frame.origin.y, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - self.tableView.frame.origin.y)];
    
    subViews.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:subViews];
    [self insertSubview:subViews aboveSubview:bgView];

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (isOpen[section]) {
        
        return 5;
    }

    return 0;

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.arrs.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor whiteColor];
        cell.clipsToBounds = YES;
        cell.textLabel.text = @"123";
    }
    
    return cell;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    //
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 50)];
    bgV.backgroundColor = [UIColor blackColor];
    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 49)];
    
    control.tag = section + mainTag;
    [control addTarget:self action:@selector(changeSection:) forControlEvents:UIControlEventTouchUpInside];

    control.backgroundColor = [UIColor whiteColor];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 50,30 )];
    title.text = self.arrs[section];
    [control addSubview:title];
    [bgV addSubview:control];
    
    return bgV;

}



-(void)changeSection:(UIControl*)ctl{

    NSInteger sesion = ctl.tag - mainTag;
    isOpen[sesion] = !isOpen[sesion];
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sesion] withRowAnimation:UITableViewRowAnimationFade];
    //可能会有问题
    if (isOpen[sesion]) {
        
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:sesion] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }

}

-(void)removeAction{


    [self removeFromSuperview];

}


@end
