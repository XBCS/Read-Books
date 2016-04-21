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
    
    CALayer *layer = [CALayer new];
    self.layer = layer;
    
    layer.frame = CGRectMake(100, 100, 222, 222);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    
    
    
    [self.view.layer addSublayer:layer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1.通过touches获得当前点击的点
    CGPoint clickPoint = [[touches anyObject] locationInView:self.view];
    
 
//    [self containsP:clickPoint];
    [self hitTest:clickPoint];
    
    
}


// -containsPoint
- (void)containsP:(CGPoint)point {
    
    // 2.把点的坐标系转换为layer的坐标系
    CGPoint layerPoint = [self.layer convertPoint:point fromLayer:self.view.layer];
    
    // 3.判断点是否在 layer上.
    if ([self.layer containsPoint:layerPoint]) {
        printf("在\n"); // 处理事件
    } else {
        printf("不在\n");
    }
    
}


// -hitTest
- (void)hitTest:(CGPoint)point {
    
    
    CALayer *layer = [self.view.layer hitTest:point];
    
    if (layer == self.layer) {
        printf("YES\n");
    } else {
        
        printf("NO\n");
    }
    
}

@end
