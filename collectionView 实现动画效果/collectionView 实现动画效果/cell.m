//
//  cell.m
//  collectionView 实现动画效果
//
//  Created by 袁飞霞 on 16/6/27.
//  Copyright © 2016年 cn.sophietobeabetterone. All rights reserved.
//

#import "cell.h"
@interface cell()
@property (nonatomic, weak) UILabel *label;
@end
@implementation cell
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self setupUI];
         [self setupAnimation];
    }
    return self;
}
-(void)setupUI
{
    UILabel *label = [[UILabel alloc]init];
    [self addSubview:label];
    self.label = label;
    self.label.backgroundColor = [UIColor orangeColor];
    
    
}
-(void)setupAnimation
{
   CATransition *anim = [CATransition animation];
     anim.type = @"pageCurl";
    anim.subtype = kCATransitionFromBottom;
    [self.layer addAnimation:anim forKey:nil ];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.label.frame = self.bounds;
    
}
-(void)setContent:(NSString *)content
{
    _content = content;
    self.label.text = content;
    
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setupUI];
         [self setupAnimation];

    }
    return self;
}
@end
