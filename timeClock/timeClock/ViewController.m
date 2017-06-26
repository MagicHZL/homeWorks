//
//  ViewController.m
//  timeClock
//
//  Created by 高鹏程 on 17/4/11.
//  Copyright © 2017年 gpc. All rights reserved.
//

#import "ViewController.h"
#import "TimeView.h"

@interface ViewController ()
{
    TimeView *timeView ;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    timeView = [[TimeView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    timeView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:timeView];
    
    
}

- (IBAction)touchAction:(UIButton *)sender {
    

    if (sender.tag==100) {
        
        timeView.m = 4;
        
    }else if (sender.tag==200){
    
        timeView.m = 7;
    
    }else{
    
        timeView.m = 10;
    }
    

    [timeView setNeedsDisplay];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
