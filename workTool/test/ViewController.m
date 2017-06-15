//
//  ViewController.m
//  test
//
//  Created by ZhongLiangHao on 2017/5/16.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "ViewController.h"
#import "HaiClassifyView.h"
#import "HaiKPIScreenView.h"
#import "CircleLableView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];

    
    
  
}

- (IBAction)addView:(id)sender {
    
    CircleLableView *classView = [[CircleLableView alloc] initWithFrame:CGRectMake(30, 60, 200, 200)];
    
    [self.view addSubview:classView];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
