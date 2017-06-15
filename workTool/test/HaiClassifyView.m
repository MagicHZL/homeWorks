//
//  HaiClassifyView.m
//  test
//
//  Created by ZhongLiangHao on 2017/6/15.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "HaiClassifyView.h"
#import "HaiClassifyCell.h"

@implementation HaiClassifyView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        
        self.arrs = @[@"销售资料",@"技术资料",@"维护手册",@"销售资料",@"销售资料",@"技术资料",@"维护手册",@"销售资料"];
        self.backgroundColor = [UIColor clearColor];
        [self creatUI];
        
    }

    return self;
}


-(void)creatUI{


    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    bgView.backgroundColor = [UIColor colorWithWhite:.5 alpha:.3];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeAction)];
    [bgView addGestureRecognizer:tap];
    [self addSubview:bgView];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(CGRectGetWidth(self.frame)/3.0, 50);
    
    CGFloat height =50 * ((self.arrs.count-1)/3 +1);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - height - 70 - 40,CGRectGetWidth(self.frame), height) collectionViewLayout:layout];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HaiClassifyCell" bundle:nil] forCellWithReuseIdentifier:@"HaiClassifyCell"];
    [self addSubview:self.collectionView];
    
    
    UIView *btnBg = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame), CGRectGetWidth(self.frame), 70 + 40)];
    
    btnBg.backgroundColor = [UIColor whiteColor];
    UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom] ;
    btn.frame = CGRectMake(20, 30, CGRectGetWidth(self.frame)-40, 40);
    
    [btn setTitle:@"全部类型" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    btn.layer.cornerRadius = 3;
    btn.layer.masksToBounds = YES;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [btnBg addSubview:btn];
    [self addSubview:btnBg];
    

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return self.arrs.count;


}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    
    HaiClassifyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HaiClassifyCell" forIndexPath:indexPath];
    
    cell.classify.text = self.arrs[indexPath.item];
    return cell;

}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    NSLog(@"点击分类");


}

-(void)btnAction:(UIButton *)btn{


    NSLog(@"点击全部分类");


}

-(void)removeAction{

    [self removeFromSuperview];

}



@end
