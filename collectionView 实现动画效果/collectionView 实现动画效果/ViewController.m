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
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)NSMutableArray *array;

@end

@implementation ViewController
- (IBAction)click:(id)sender {
    [self scroll];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.bounces = NO;
    
    [self setupLayout];
    
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
