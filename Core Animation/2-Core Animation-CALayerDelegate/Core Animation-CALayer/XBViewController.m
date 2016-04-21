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
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    
    // 设置代理
    layer.delegate = self;
    
    layer.contentsScale = [UIScreen mainScreen].scale;

    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view.layer addSublayer:layer];
 
    [layer display];
    
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    // 设置线宽
    CGContextSetLineWidth(ctx, 5.0f);
    // 设置颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor);
    // 设置椭圆范围
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
    
}



@end
