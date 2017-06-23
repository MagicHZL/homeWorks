//
//  ViewController.m
//  exam
//
//  Created by ZhongLiangHao on 2017/6/21.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "ViewController.h"
#import "ExamViewController.h"
#import "ExamReslutViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"首页";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goExam:(id)sender {
    
    ExamViewController *exam = [[ExamViewController alloc] init];
    
    [self.navigationController pushViewController:exam animated:YES];
 
//  ExamReslutViewController *exam = [[ExamReslutViewController alloc] init];
//    
//  [self.navigationController pushViewController:exam animated:YES];

    
}


@end
