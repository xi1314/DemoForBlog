//
//  ViewController.m
//  NSTimer&NSRunLoop
//
//  Created by Gin on 16/10/25.
//  Copyright © 2016年 Gin. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL forbidRunLoop;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (IBAction)jumpBtnClick:(id)sender {
    
    NewViewController *newVc = [[NewViewController alloc] init];
    newVc.forbidRunLoop = _forbidRunLoop;
    [self presentViewController:newVc animated:YES completion:nil];
}

- (IBAction)segmentChanged:(id)sender {
    
    _forbidRunLoop = !_forbidRunLoop;
}

@end
