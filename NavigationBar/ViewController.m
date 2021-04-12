//
//  ViewController.m
//  NavigationBar
//
//  Created by jinyang huang on 2020/6/2.
//  Copyright © 2020 hjy. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+NBAdd.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController.navigationBar setBarTintColor:UIColor.redColor];
    [self.navigationController.navigationBar setTintColor:UIColor.whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.whiteColor}];

    self.title = @"NavigationBar";
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 40);
    [button1 setTitle:@"Hide NavBar, Enable Gesture" forState:UIControlStateNormal];
    [button1 setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    button1.backgroundColor = UIColor.systemBlueColor;
    button1.tag = 1001;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(0, 200, CGRectGetWidth(self.view.frame), 40);
    [button2 setTitle:@"Hide NavBar, Disable Gesture" forState:UIControlStateNormal];
    [button2 setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    button2.backgroundColor = UIColor.systemBlueColor;
    button2.tag = 1002;
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(0, 300, CGRectGetWidth(self.view.frame), 40);
    [button3 setTitle:@"Show NavBar, Enable Gesture" forState:UIControlStateNormal];
    [button3 setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    button3.backgroundColor = UIColor.systemBlueColor;
    button3.tag = 1003;
    [button3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(0, 400, CGRectGetWidth(self.view.frame), 40);
    [button4 setTitle:@"Show NavBar, Disable Gesture" forState:UIControlStateNormal];
    [button4 setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    button4.backgroundColor = UIColor.systemBlueColor;
    button4.tag = 1004;
    [button4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    
    if (self.navigationController.viewControllers.count > 1) {
        UIButton *buttonBack = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonBack.frame = CGRectMake(0, 500, CGRectGetWidth(self.view.frame), 40);
        [buttonBack setTitle:@"Back" forState:UIControlStateNormal];
        [buttonBack setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        buttonBack.backgroundColor = UIColor.systemBlueColor;
        buttonBack.tag = 1005;
        [buttonBack addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:buttonBack];
    }
    
    // Do any additional setup after loading the view.
}


- (void)buttonAction:(UIButton *)sender {
    if (sender.tag == 1005) {
        if (self.navigationController.viewControllers.count > 1) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        return;
    }
    ViewController *vc = [ViewController new];
    if (sender.tag == 1001) {
        vc.nb_hiddenNavbar = YES;
        vc.nb_disableBackGesture = NO;
    }
    else if (sender.tag == 1002){
        vc.nb_hiddenNavbar = YES;
        vc.nb_disableBackGesture = YES;
    }
    else if (sender.tag == 1003){
        vc.nb_hiddenNavbar = NO;
        vc.nb_disableBackGesture = NO;
    }
    else if (sender.tag == 1004){
        vc.nb_hiddenNavbar = NO;
        vc.nb_disableBackGesture = YES;
    }
    vc.title = sender.titleLabel.text;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
