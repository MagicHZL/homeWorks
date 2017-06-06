//
//  ViewController.m
//  folding
//
//  Created by ZhongLiangHao on 2017/6/5.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{

    UIImageView *imgView;
    UIImageView *leftImgView;
    UIImageView *rightImgView;
    UIImageView *lastImgView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

 
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:pan];
  
    leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(-25, 100, 50, 100)];
    leftImgView.backgroundColor = [UIColor yellowColor];
    leftImgView.layer.contentsRect = CGRectMake(0, 0, 1/4.0, 1);
    leftImgView.image = [UIImage imageNamed:@"bg.jpeg"];
    [self.view addSubview:leftImgView];
    
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(75, 100, 50, 100)];
    imgView.backgroundColor = [UIColor redColor];
    imgView.layer.contentsRect = CGRectMake(1/4.0,0, 1/4.0, 1);
    imgView.image = [UIImage imageNamed:@"bg.jpeg"];
    [self.view addSubview:imgView];
    
    
    rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(75, 100, 50, 100)];
    rightImgView.backgroundColor = [UIColor blueColor];
    rightImgView.layer.contentsRect = CGRectMake(2/4.0,0, 1/4.0, 1);
    rightImgView.image = [UIImage imageNamed:@"bg.jpeg"];
    [self.view addSubview:rightImgView];

    
    lastImgView = [[UIImageView alloc] initWithFrame:CGRectMake(175, 100, 50, 100)];
    lastImgView.backgroundColor = [UIColor grayColor];
    lastImgView.layer.contentsRect = CGRectMake(3/4.0,0, 1/4.0, 1);
    lastImgView.image = [UIImage imageNamed:@"bg.jpeg"];
    [self.view addSubview:lastImgView];

    leftImgView.layer.anchorPoint = CGPointMake(0, 0.5);
    imgView.layer.anchorPoint = CGPointMake(1, 0.5);
    rightImgView.layer.anchorPoint = CGPointMake(0, 0.5);
    lastImgView.layer.anchorPoint = CGPointMake(1, 0.5);
    
   
    
}

double a = 100;
double b = 100;
double c = 100;

-(void)panAction:(UIPanGestureRecognizer*)pan{

    CGFloat pX = [pan translationInView:self.view].x;
    
    CATransform3D ltrans = leftImgView.layer.transform;
    
    ltrans.m34 = 1/500.0;
    
    ltrans = CATransform3DRotate(ltrans, M_PI *(pX/500), 0, 1, 0);
    
    leftImgView.layer.transform =ltrans;
    
    CATransform3D trans = imgView.layer.transform;
    
    trans.m34 = 1/500.0;
    CATransform3D rotateTransform = CATransform3DRotate(trans, -M_PI *(pX/500), 0, 1, 0);

    imgView.layer.transform =rotateTransform;
    
    CATransform3D rtrans = rightImgView.layer.transform;
    rtrans.m34 = 1/500.0;
    CATransform3D rrotateTransform = CATransform3DRotate(rtrans, M_PI *(pX/500), 0, 1, 0);
    rightImgView.layer.transform =rrotateTransform;
    
    
    CATransform3D lstrans = lastImgView.layer.transform;
    lstrans.m34 = 1/500.0;
    CATransform3D lsrotateTransform = CATransform3DRotate(lstrans, - M_PI *(pX/500), 0, 1, 0);

    lastImgView.layer.transform =lsrotateTransform;
    
    
    imgView.layer.transform = [self makeWith:rotateTransform and:a - leftImgView.frame.size.width - imgView.frame.size.width];
    
    rightImgView.layer.transform = [self makeWith:rrotateTransform and:a - leftImgView.frame.size.width - imgView.frame.size.width] ;
    
    lastImgView.layer.transform = [self makeWith:lsrotateTransform and:c - rightImgView.frame.size.width - lastImgView.frame.size.width + a - leftImgView.frame.size.width - imgView.frame.size.width];
    
    
    a = leftImgView.frame.size.width + imgView.frame.size.width;

    c = rightImgView.frame.size.width + lastImgView.frame.size.width;
    
    [pan setTranslation:CGPointZero inView:self.view];

    
}


-(CATransform3D)makeWith:(CATransform3D)trans and:(double)width{

    
    CATransform3D moveTransform = CATransform3DMakeAffineTransform(CGAffineTransformMakeTranslation(-width, 0));

    return CATransform3DConcat(trans, moveTransform);
}

/*

-(void)demo{


 
    CATransform3D ltrans = leftImgView.layer.transform;
 
    ltrans.m34 = 1/500.0;
    
    ltrans = CATransform3DRotate(ltrans, M_PI *(pX/500), 0, 1, 0);
    
    leftImgView.layer.transform =ltrans;
    
    CATransform3D trans = imgView.layer.transform;
    
    trans.m34 = 1/500.0;
    CATransform3D rotateTransform = CATransform3DRotate(trans, -M_PI *(pX/500), 0, 1, 0);
    // 移动(这里的y坐标是平面移动的的距离,我们要把他转换成3D移动的距离.这是关键,没有它,图片就没办法很好地对接。)
    
    CATransform3D moveTransform = CATransform3DMakeAffineTransform(CGAffineTransformMakeTranslation( -(a-2*leftImgView.frame.size.width), 0));
    // 合并
    CATransform3D concatTransform = CATransform3DConcat(rotateTransform, moveTransform);
    imgView.layer.transform =concatTransform;
    
    CATransform3D rtrans = rightImgView.layer.transform;
    rtrans.m34 = 1/500.0;
    CATransform3D rrotateTransform = CATransform3DRotate(rtrans, M_PI *(pX/500), 0, 1, 0);
    // 移动(这里的y坐标是平面移动的的距离,我们要把他转换成3D移动的距离.这是关键,没有它,图片就没办法很好地对接。)
    CATransform3D rmoveTransform = CATransform3DMakeAffineTransform(CGAffineTransformMakeTranslation(-(b-2*imgView.frame.size.width), 0));
    // 合并
    CATransform3D rconcatTransform = CATransform3DConcat(rrotateTransform, rmoveTransform);
    rightImgView.layer.transform =rconcatTransform;
    
    
    CATransform3D lstrans = lastImgView.layer.transform;
    lstrans.m34 = 1/500.0;
    CATransform3D lsrotateTransform = CATransform3DRotate(lstrans, - M_PI *(pX/500), 0, 1, 0);
    // 移动(这里的y坐标是平面移动的的距离,我们要把他转换成3D移动的距离.这是关键,没有它,图片就没办法很好地对接。)
    CATransform3D lsmoveTransform = CATransform3DMakeAffineTransform(CGAffineTransformMakeTranslation(-(c-2*rightImgView.frame.size.width + b-2*imgView.frame.size.width), 0));
    // 合并
    CATransform3D lsconcatTransform = CATransform3DConcat(lsrotateTransform, lsmoveTransform);
    lastImgView.layer.transform =lsconcatTransform;
    
    
    a = 2*leftImgView.frame.size.width;
    b = 2*imgView.frame.size.width;
    c = 2*rightImgView.frame.size.width;

}
*/

- (IBAction)butAction:(UIButton *)sender {
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CATransform3D ltrans = leftImgView.layer.transform;
        
        ltrans.m34 = 1/500.0;
        
        ltrans = CATransform3DRotate(ltrans, -M_PI/4, 0, 1, 0);
        
        leftImgView.layer.transform =ltrans;
        
        CATransform3D trans = imgView.layer.transform;
        
        trans.m34 = 1/500.0;
        CATransform3D rotateTransform = CATransform3DRotate(trans, M_PI/4, 0, 1, 0);

        imgView.layer.transform =rotateTransform;
        
        CATransform3D rtrans = rightImgView.layer.transform;
        rtrans.m34 = 1/500.0;
        CATransform3D rrotateTransform = CATransform3DRotate(rtrans, -M_PI/4, 0, 1, 0);
   
        rightImgView.layer.transform =rrotateTransform;
        
        CATransform3D lstrans = lastImgView.layer.transform;
        lstrans.m34 = 1/500.0;
        CATransform3D lsrotateTransform = CATransform3DRotate(lstrans, M_PI/4, 0, 1, 0);
    
        lastImgView.layer.transform =lsrotateTransform;
        
        
        imgView.layer.transform = [self makeWith:rotateTransform and:a - leftImgView.frame.size.width - imgView.frame.size.width];
        
        rightImgView.layer.transform = [self makeWith:rrotateTransform and:a - leftImgView.frame.size.width - imgView.frame.size.width] ;
        
        lastImgView.layer.transform = [self makeWith:lsrotateTransform and:c - rightImgView.frame.size.width - lastImgView.frame.size.width + a - leftImgView.frame.size.width - imgView.frame.size.width];
    
        
    } completion:^(BOOL finished) {
        a = leftImgView.frame.size.width + imgView.frame.size.width;
        
        c = rightImgView.frame.size.width + lastImgView.frame.size.width;
        
    }] ;
    

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
