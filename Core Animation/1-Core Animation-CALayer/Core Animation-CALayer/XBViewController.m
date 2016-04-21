//
//  XBViewController.m
//  Core Animation-CALayer
//
//  Created by 李泽宇 on 16/4/21.
//  Copyright © 2016年 丶信步沧桑. All rights reserved.
//

#import "XBViewController.h"

@interface XBViewController ()

@property(nonatomic, weak) CALayer *layer;

@end

@implementation XBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setLayer];

    
    
}


- (void)setLayer {

    CALayer *layer = [CALayer layer];
    self.layer = layer;
    layer.frame = CGRectMake(0, 100, 100, 100);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    UIImage *image = [UIImage imageNamed:@"o"];
    
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    // 注释下行代码可对比 contentGravity;  kCAGravityResizeAspect会自动拉伸图片,所以再设置contentsScale没有效果.
//    layer.contentsGravity = kCAGravityResizeAspect;
    
    //contentsGravity 设 为kCAGravityCenter 这个常量并不会拉伸图片,此时再更改contentsScale可发现不同.
    layer.contentsGravity = kCAGravityCenter;
    
    // contentsScale
//    layer.contentsScale = 1.0;
    // 也可通过image.scale修复
    layer.contentsScale = image.scale;
    
    
    
    // maskToBounds:隐藏超出部分
//    layer.masksToBounds = YES;
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view.layer addSublayer:layer];
 
    // 打开可看contentsRect;
//    [self updateContentsRect];
}


/// contentsRect: 按照点来计算想要显示的区域.
- (void)updateContentsRect {
    
    // 这个位置还可以.
    self.layer.contentsRect = CGRectMake(0.3, 0.4, 0.5, 0.2);
}


@end
