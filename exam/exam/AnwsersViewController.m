//
//  AnwsersViewController.m
//  exam
//
//  Created by ZhongLiangHao on 2017/6/22.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "AnwsersViewController.h"
#import "AnsersCell.h"
#import "TestModel.h"

@interface AnwsersViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collection;

@end

@implementation AnwsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.title = @"答题卡";
    
    self.view.backgroundColor = [UIColor colorWithWhite:.9 alpha:1];
    if (self.topView) {
        
        
        [self.view addSubview:self.topView];
    }
    
    [self creatUI];
    
}

-(void)creatUI{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(WIDTH/5.0, WIDTH/5.0);

    //判断试题数量
    self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64 + 40 +20,WIDTH , WIDTH/5.0 *(self.questions.count/5 +1)) collectionViewLayout:layout];
    
    [self.collection registerClass:[AnsersCell class] forCellWithReuseIdentifier:@"cell"];
    self.collection.bounces = NO;
    
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collection];

    UIButton *done = [UIButton buttonWithType:UIButtonTypeCustom];
    done.frame = CGRectMake(0, HEIGHT - 50, WIDTH, 50);
    [done setTitle:@"交卷并查看结果" forState:UIControlStateNormal];
    [done setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    done.backgroundColor = [UIColor blueColor];
    [self.view addSubview:done];
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return self.questions.count;

}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{


    AnsersCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.num.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    
    TestModel *model = self.questions[indexPath.row];
    cell.testId = [NSString stringWithFormat:@"%d",model.testId];
    
    if (self.dic[cell.testId]) {
        
        cell.num.backgroundColor = [UIColor blueColor];
        cell.num.textColor = [UIColor whiteColor];
        
    }else{
    
        cell.num.backgroundColor = [UIColor whiteColor];
        cell.num.textColor = [UIColor blueColor];
    
    }
    
    return cell;

}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (self.goQestion) {
        
        _goQestion(indexPath);
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];

}

@end
