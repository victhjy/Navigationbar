//
//  NBBaseNavigationController.m
//  NavigationBar
//
//  Created by jinyang huang on 2020/6/2.
//  Copyright © 2020 hjy. All rights reserved.
//

#import "NBBaseNavigationController.h"
#import "UIViewController+NBAdd.h"

@interface NBBaseNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation NBBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    // Do any additional setup after loading the view.
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer != self.interactivePopGestureRecognizer){
        return YES;
    }
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    
    UIViewController *topViewController = self.topViewController;
    if (topViewController.nb_disableBackGesture) {
       return NO;
    }
    return YES;
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
