//
//  ViewController.m
//  drawPath
//
//  Created by 高鹏程 on 17/5/8.
//  Copyright © 2017年 gpc. All rights reserved.
//

#import "ViewController.h"
#import "PathView.h"
#import "SmView.h"
@interface ViewController ()
{

    PathView *smalView;
    NSMutableArray *smViews;
    CGPoint bp;
    CGPoint ep;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    //第一种实现
    [self secondAction];
    //第二种实现
//    [self firstAction];
}


//first
-(void)firstAction{
    smalView = [[PathView alloc] initWithFrame:self.view.bounds];
    smalView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:smalView];

}
-(void)firtTime{
    
    int y = arc4random_uniform(50);
    smalView.point = CGPointMake([UIScreen mainScreen].bounds.size.width, y);
    
}

//second

-(void)creatSmviewWithBpoint:(CGPoint)b Epoint:(CGPoint)e{

    SmView *smView = [[SmView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width,0,5, 50)];
    smView.backgroundColor = [UIColor whiteColor];
    smView.bPoint = b;
    smView.ePoint = e;
    [self.view addSubview:smView];
    [smViews addObject:smView];
    
    for (SmView *v in smViews.reverseObjectEnumerator) {
        
        if (v.frame.origin.x<0) {
            
            [v removeFromSuperview];
            [smViews removeObject:v];
            
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            
            v.transform = CGAffineTransformTranslate(v.transform, -5, 0);
        }];
    }
    
    NSLog(@"%ld   %ld",smViews.count,self.view.subviews.count);
}

-(void)secondAction{

    bp = CGPointZero;
    ep = CGPointZero;
    smViews = [NSMutableArray array];

}

-(void)secondTime{
    
    int y = arc4random_uniform(50);
    bp = CGPointMake(0, ep.y);
    ep = CGPointMake(5, y);
    [self creatSmviewWithBpoint:bp Epoint:ep];
    
    
}

-(void)timeAction{
//第一种
    [self secondTime];
    //第二种
//    [self firtTime];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
