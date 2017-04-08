//
//  NewViewController.m
//  NSTimer&NSRunLoop
//
//  Created by Gin on 16/10/25.
//  Copyright © 2016年 Gin. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UITextView *logTextField;

@end

@implementation NewViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerInvoke) userInfo:nil repeats:YES];
    if (!_forbidRunLoop) {
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)timerInvoke {
    
    static NSInteger times = 0;
    times++;
    NSString *str = @"";
    if (_forbidRunLoop) {
        str = [NSString stringWithFormat:@"Timer Invoke: %ld", times];
    } else {
        str = [NSString stringWithFormat:@"%ld, mode, %@", times, [[NSRunLoop currentRunLoop] currentMode]];
    }
    NSLog(@"%@", str);
    if (_logTextField.text.length < 1) {
        _logTextField.text = [str stringByAppendingString:_logTextField.text];
    } else {
        _logTextField.text = [[str stringByAppendingString:@"\n"] stringByAppendingString:_logTextField.text];
    }
    [_logTextField scrollsToTop];

}

- (IBAction)closeBtnClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"--dismiss--");
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}

@end
