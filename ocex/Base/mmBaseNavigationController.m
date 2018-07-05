//
//  mmBaseNavigationController.m
//  ocex
//
//  Created by zhuxu on 2018/7/2.
//  Copyright © 2018年 zhuxu. All rights reserved.
//

#import "mmBaseNavigationController.h"

@interface mmBaseNavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation mmBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UINavigationControllerDelegate
    self.delegate = self;
    
    //UIGestureRecognizerDelegate
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        
        // push前要关闭手势响应
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark - navigation controller delegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (navigationController.viewControllers.count == 1) {
        
        self.interactivePopGestureRecognizer.enabled = NO;
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    else {
        
        self.interactivePopGestureRecognizer.enabled = YES;
        self.interactivePopGestureRecognizer.delegate = self;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
