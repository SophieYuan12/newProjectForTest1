//
//  ViewController.m
//  核心动画--- 动画的叠加
//
//  Created by 袁飞霞 on 16/6/28.
//  Copyright © 2016年 cn.sophietobeabetterone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) CALayer *myLayer;

@end

@implementation ViewController

//  02-新建图层

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1. 新建图层
    CALayer *layer = [CALayer layer];
    
    // 2. 设置图层属性
    // 1> frame => bounds & position
    layer.bounds = CGRectMake(0, 0, 100, 100);
    // position => 位置，默认是图层的中心点位置
    layer.position = self.view.center;
    
    // 2> 背景颜色
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    // 3> 透明度
    layer.opacity = 1.0;
    
    // 4> 内容（图像）
    UIImage *image = [UIImage imageNamed:@"1"];
    // __bridge(通常被称为桥接)
    layer.contents = (__bridge id)(image.CGImage);
    
    // 允许裁切
    layer.masksToBounds = YES;
    
    
    // 将自定义layer添加到视图（图层是可以嵌套的）
    [self.view.layer addSublayer:layer];
    
    self.myLayer = layer;
}

/**
 在CALayer头文件中所有标注Animatable的属性，都是可以动画的
 */
// 修改图层属性
#define degree2angle(angle)     ((angle) * M_PI / 180)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
    
    // 1. position//设置图层的位置
    self.myLayer.position = location;
    
    // 问题：同时指定transform，前面的会被后面的覆盖
    // 用"大招" KVC来解决，可以做到形变参数的叠加
    // 2. 缩放
    CGFloat scale = (arc4random_uniform(5) + 1) / 10.0 + 0.5;
    //    self.myLayer.transform = CATransform3DMakeScale(scale, scale, 0);
    [self.myLayer setValue:@(scale) forKeyPath:@"transform.scale"];
    
    // 3. 旋转69
    CGFloat rotate = degree2angle(arc4random_uniform(360));
    //    self.myLayer.transform = CATransform3DMakeRotation(rotate, 0, 0, 1);
    [self.myLayer setValue:@(rotate) forKeyPath:@"transform.rotation.y"];
    
    // 4. 透明度
    CGFloat alpha = (arc4random_uniform(5) + 1) / 10.0 + 0.5;
    //    self.myLayer.opacity = alpha;
    [self.myLayer setValue:@(alpha) forKeyPath:@"opacity"];
    
    // 5. 设置圆角半径
    CGFloat r = arc4random_uniform(self.myLayer.bounds.size.width * 0.5);
    self.myLayer.cornerRadius = r;
    
    // 6. 设置边线
    self.myLayer.borderColor = [UIColor redColor].CGColor;
    self.myLayer.borderWidth = 3.0;
}


@end
