//
//  ViewController.m
//  collectionView 实现动画效果
//
//  Created by 袁飞霞 on 16/6/27.
//  Copyright © 2016年 cn.sophietobeabetterone. All rights reserved.
//

#import "ViewController.h"
#import "cell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)NSMutableArray *array;

@end

@implementation ViewController
- (IBAction)click:(id)sender {
//    [self scroll];
    [self labelContentChanged];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.bounces = NO;
//    self.label.backgroundColor = [UIColor grayColor];
    self.label.text = self.array[0];
    [self.label sizeToFit];
    [self setupLayout];
    
}
-(void)setupLabelAnim
{
    CATransition *anim = [CATransition animation];
//    anim.type = @"pageCurl";
//    anim.subtype = kCATransitionFromBottom;
    anim.duration = 1.0f;
//    //display mode, slow at beginning and end
//    anim.timingFunction = UIViewAnimationCurveEaseInOut;
    //在动画执行完时是否被移除
//    anim.type = @"oglFlip";
   anim.type = @"cube";
//    anim.type = @"pageCurl";
//   anim.type =  @"cameraIrisHollowOpen";
    // 设置动画子类型：过度方向
    anim.subtype = kCATransitionFromTop;
    [self.label.layer addAnimation:anim forKey:nil ];
}

-(void)labelContentChanged

{
    [self setupLabelAnim];
    
    self.label.text = self.array[1];
}

-(void)setupLayout
{
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
//    self.layou
    
}
-(void)viewDidLayoutSubviews
{
 self.layout.itemSize = self.collectionView.frame.size;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    cell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    //获取数据模型
    cell.content = self.array[indexPath.item];
    
    //对cell赋值
    
    return cell;
}


-(void)scroll
{
    NSIndexPath *indexPath  = [NSIndexPath indexPathForItem:1 inSection:0];
    
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
    
    
}

-(NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray arrayWithObjects:@"asgssg",@"sgdhsdsh", nil];
        
    }
    return _array;
}



@end
