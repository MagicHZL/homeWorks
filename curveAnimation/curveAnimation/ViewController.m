//
//  ViewController.m
//  curveAnimation
//
//  Created by ZhongLiangHao on 2017/6/6.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "ViewController.h"
#import "CurveView.h"
@interface ViewController ()

{

    UIView *moveView;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //
    CurveView *curveView = [[CurveView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    curveView.width = 500;
    curveView.hY = -400;
    
    self.view = curveView;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    moveView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    moveView.layer.cornerRadius = 20;
    moveView.layer.masksToBounds = YES;
    double y2 = [self calculateWith:300];
    moveView.center = CGPointMake(300, y2);
    
    moveView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:moveView];
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    
    [self.view addGestureRecognizer:pan];
    
    
}

-(void)panAction:(UIPanGestureRecognizer*)pan{


   CGPoint point = [pan translationInView:self.view];
    
    double pX = point.x;
    
    CGPoint center = moveView.center;
    
    moveView.center = CGPointMake(center.x+pX, [self calculateWith:center.x+pX]);
    
    NSLog(@"%lf",center.x+pX);
    if ((center.x+pX) >(self.view.frame.size.width/2.0-50)&&(center.x+pX)<(self.view.frame.size.width/2.0+50)) {
        
        
        moveView.transform = CGAffineTransformMakeScale(1.5, 1.5);
        
    }else{
        
        moveView.transform = CGAffineTransformIdentity;
    
    }
    
    [pan setTranslation:CGPointZero inView:self.view];
    


}

//通过X 计算Y

-(double)calculateWith:(double)x{

    
    return sqrt(pow(500, 2) - pow(x - self.view.bounds.size.width/2, 2))-400;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
