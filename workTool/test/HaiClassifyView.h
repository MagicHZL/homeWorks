//
//  HaiClassifyView.h
//  test
//
//  Created by ZhongLiangHao on 2017/6/15.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaiClassifyView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSArray *arrs;

@property(nonatomic,strong)UICollectionView *collectionView;


@end
