//
//  ExamViewController.m
//  exam
//
//  Created by ZhongLiangHao on 2017/6/21.
//  Copyright © 2017年 ZhongLiangHao. All rights reserved.
//

#import "ExamViewController.h"
#import "ExamCell.h"
#import "AnwsersViewController.h"
#import "TestModel.h"
#import "TimeObj.h"

@interface ExamViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,TableCellDelgate,TimeObjWeak>
{

    NSInteger overall;
    UILabel *time;
    UIButton *btn ;
    NSMutableArray *tests;
    UICollectionView *collection;
    NSMutableDictionary *qestionAnswers;
    UIView *topView;
    NSTimer *timer;

}
@property (nonatomic,strong) TimeObj *timerTarget;

@end

@implementation ExamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.title = @"考试中";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    [btn addTarget:self action:@selector(answersView) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    _timerTarget = [[TimeObj alloc] init];
    _timerTarget.weak = self;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:_timerTarget selector:@selector(timeActionForObj) userInfo:nil repeats:YES];
    
    overall = 60 * 5;
    self.view.backgroundColor = [UIColor whiteColor];
    
    tests = [NSMutableArray array];
    qestionAnswers = [NSMutableDictionary dictionary];
    [self getJson];
    
    [btn setTitle:[NSString stringWithFormat:@"1/%ld",tests.count] forState:UIControlStateNormal];
    
    [self creatUI];

}


-(void)creatUI{

    //头部
    
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, WIDTH , 40)];
    
    topView.backgroundColor = [UIColor whiteColor];
    
    time = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    time.textAlignment = NSTextAlignmentCenter;
    time.text = [NSString stringWithFormat:@"%.2ld:%.2ld",overall/60,overall%60];
    
    UIButton *rBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rBtn.frame = CGRectMake(WIDTH-100, 0, 100, 40);
    [rBtn setTitle:@"考试须知" forState:UIControlStateNormal];
    [rBtn setImage:[UIImage imageNamed:@"notice_ic"] forState:UIControlStateNormal];
    [rBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [topView addSubview:rBtn];
    [topView addSubview:time];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(WIDTH, HEIGHT-CGRectGetMaxY(topView.frame));
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(topView.frame), WIDTH, HEIGHT-CGRectGetMaxY(topView.frame)) collectionViewLayout:layout];
    
    collection.delegate =  self;
    collection.dataSource = self;
    collection.pagingEnabled = YES;
    [collection registerClass:[ExamCell class] forCellWithReuseIdentifier:@"exam"];
    
    [self.view addSubview:collection];


}

-(void)getJson{

    NSString *file = [[NSBundle mainBundle] pathForResource:@"exam.json" ofType:nil];
    
    NSArray *arr =  [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:file] options:NSJSONReadingMutableLeaves error:nil];
    
    for (NSDictionary *dic in arr) {
        
        TestModel *model = [[TestModel alloc] init];
        [model getData:dic];
        [tests addObject:model];
        
        
    }

}

-(void)timeActionForWeak
{

//    NSLog(@"123");
    overall--;
    
    
    time.text = [NSString stringWithFormat:@"%.2ld:%.2ld",overall/60,overall%60];
    
    
    if (overall == 0) {
        
        [timer invalidate];
        timer = nil;
        
        
    }


}

-(void)answersView{


    AnwsersViewController *anwsers = [[AnwsersViewController alloc] init];
    anwsers.topView = topView;
    anwsers.questions = [tests copy];
    anwsers.dic = [qestionAnswers copy];
    
    __weak typeof(collection) weakCollection = collection;
    __weak typeof(btn) weakBtn = btn;
    [anwsers setGoQestion:^(NSIndexPath *index){
    
        [weakCollection scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        [weakBtn setTitle:[NSString stringWithFormat:@"%ld/%ld",(index.row +1),tests.count] forState:UIControlStateNormal];
        
    }];
    
    [self.navigationController pushViewController:anwsers animated:YES];


}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    [self.view addSubview:topView];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return tests.count;


}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ExamCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"exam" forIndexPath:indexPath];
    
    cell.delgate = self;
    TestModel *model = tests[indexPath.row];
    cell.model = model;
    cell.answer = qestionAnswers[[NSString stringWithFormat:@"%d",model.testId]];
    return cell;

}


-(void)changeTime:(NSTimer*)ti{

    overall--;
  
    
    time.text = [NSString stringWithFormat:@"%.2ld:%.2ld",overall/60,overall%60];

    
    if (overall == 0) {
        
        [ti invalidate];
        ti = nil;
        
        
    }

//    NSLog(@"a===%d",a);s
    
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    int num = targetContentOffset->x/WIDTH +1;
    [btn setTitle:[NSString stringWithFormat:@"%d/%ld",num,tests.count] forState:UIControlStateNormal];

}



-(void)getAnswerCell:(ExamCell *)exam index:(NSInteger)index{

    NSIndexPath *ipath = [collection indexPathForCell:exam];
    
    TestModel *model =  tests[ipath.row];
    
    NSString *testId = [NSString stringWithFormat:@"%d",model.testId] ;
    NSString *answer = model.questions[index];
    
    [qestionAnswers setValue:answer forKey:testId];
    
    [collection reloadItemsAtIndexPaths:@[ipath]];
    
    NSLog(@"%@",qestionAnswers);


}



-(void)dealloc{

    NSLog(@"dealloc");
    
    [timer invalidate];
    timer = nil;

}

@end
