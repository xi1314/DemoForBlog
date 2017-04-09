//
//  MoreViewController.m
//  Pods
//
//  Created by Gin on 17/4/9.
//
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (instancetype)init
{
    self = [super init];
    UINavigationController *naviCtrl;
    if (self) {
        naviCtrl = [[UINavigationController alloc] initWithRootViewController:self];
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
        self.navigationItem.title = @"More";
    }
    return naviCtrl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
