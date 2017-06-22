//
//  ExamCell.m
//  exam
//
//  Created by ZhongLiangHao on 2017/6/21.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "ExamCell.h"
#import "TableCell.h"

@implementation ExamCell
{

    UILabel *title;
}
-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        self.table.delegate = self;
        self.table.dataSource = self;
        self.table.rowHeight = 70;
        [self.table registerNib:[UINib nibWithNibName:@"TableCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        self.backgroundColor = [UIColor whiteColor];
        self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.table.tableFooterView = [UIView new];
        self.backgroundColor = [UIColor whiteColor];
        self.table.backgroundColor = [UIColor colorWithWhite:.9 alpha:1];
        self.table.bounces = NO;
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
        title.textColor = [UIColor blackColor];
        title.textAlignment = NSTextAlignmentCenter;
        self.table.tableHeaderView = title;
        [self addSubview:self.table];
        
    }

    
    return self;

}


-(void)setModel:(TestModel *)model{

    _model = model;

    title.text = model.title;
    [self.table reloadData];
    


}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.model.questions.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.quetion.text = self.model.questions[indexPath.row];
    NSArray *ABC = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H"];
    [cell.btn setTitle:ABC[indexPath.row] forState:UIControlStateNormal];
    
    if ([cell.quetion.text isEqualToString:self.answer]) {
        

        cell.btn.backgroundColor = [UIColor blueColor];
        [cell.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
    }else{
    
         cell.btn.backgroundColor = [UIColor whiteColor];
         [cell.btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    cell.backgroundColor = [UIColor colorWithWhite:.9 alpha:1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    
    if ([self.delgate respondsToSelector:@selector(getAnswerCell:index:)]) {
        
        [self.delgate getAnswerCell:self index:indexPath.row];
    }


}


@end
