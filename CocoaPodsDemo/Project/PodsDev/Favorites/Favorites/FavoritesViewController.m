//
//  FavoritesViewController.m
//  Pods
//
//  Created by Gin on 17/4/9.
//
//

#import "FavoritesViewController.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (instancetype)init
{
    self = [super init];
    UINavigationController *naviCtrl;
    if (self) {
        naviCtrl = [[UINavigationController alloc] initWithRootViewController:self];
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
        self.navigationItem.title = @"Favorites";
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
