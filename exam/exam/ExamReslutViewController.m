//
//  ExamReslutViewController.m
//  exam
//
//  Created by ZhongLiangHao on 2017/6/23.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "ExamReslutViewController.h"
#import "AnsersCell.h"

@interface ExamReslutViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *questionHeight;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ExamReslutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _layout.minimumLineSpacing = 0;
    _layout.minimumInteritemSpacing = 0;
    _layout.itemSize = CGSizeMake(WIDTH/5.0, WIDTH/5.0);
    int col = 10 /5;
    _questionHeight.constant = WIDTH/5.0 *col;
    [self.collectionView registerClass:[AnsersCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.bounces = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return 10;
    
}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    AnsersCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.num.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    
    return cell;
    
}

-(void)dealloc{

    NSLog(@"dealloc");


}

@end
