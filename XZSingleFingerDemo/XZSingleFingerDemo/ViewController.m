//
//  ViewController.m
//  XZSingleFingerDemo
//
//  Created by 徐章 on 16/5/27.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "ViewController.h"
#import "XZSingleFingerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XZSingleFingerView *singleFingerView = [[XZSingleFingerView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    singleFingerView.center = self.view.center;
    singleFingerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:singleFingerView];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
