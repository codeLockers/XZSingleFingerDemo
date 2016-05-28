//
//  XZSingleFingerView.m
//  XZSingleFingerDemo
//
//  Created by 徐章 on 16/5/27.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZSingleFingerView.h"

@interface XZSingleFingerView(){

    CGPoint _initalPoint;
    CGFloat _initialArg;
    CGFloat _initialScale;
    
    CGFloat _scale;
    CGFloat _arg;
    
}

@property (nonatomic, strong) UIView *operationView;

@end

@implementation XZSingleFingerView

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.operationView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
        self.operationView.backgroundColor = [UIColor greenColor];
        self.operationView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
        
        [self addSubview:self.operationView];
        
         [_operationView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture_Method:)]];

        [self setScale:1];
    }
    return self;
}

- (void)panGesture_Method:(UIPanGestureRecognizer *)panGesture{

    CGPoint point = [panGesture translationInView:self.superview];

    static CGFloat tmpR = 0;
    static CGFloat tmpA = 0;
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        
        _initalPoint = [self.superview convertPoint:self.operationView.center fromView:self];
        
        CGPoint p = CGPointMake(_initalPoint.x - self.center.x, _initalPoint.y - self.center.y);
  
        tmpR = sqrt(p.x*p.x + p.y*p.y);
        tmpA = atan2(p.y, p.x);

        _initialArg = _arg;
        _initialScale = _scale;
    }
    
    point = CGPointMake(_initalPoint.x + point.x - self.center.x, _initalPoint.y+ point.y-self.center.y);
    
    CGFloat R = sqrt(point.x*point.x + point.y*point.y);
    CGFloat arg = atan2(point.y, point.x);
    
    _arg = _initialArg+arg - tmpA;
    
    
    [self setScale:MAX(_initialScale * R / tmpR, 0.7)];
    
}


- (void)setScale:(CGFloat)scale{

    _scale = scale;
    
    self.transform = CGAffineTransformIdentity;
    self.bounds = CGRectMake(0, 0, 100*_scale, 100*_scale);
    
    self.transform = CGAffineTransformMakeRotation(_arg);
}

@end
