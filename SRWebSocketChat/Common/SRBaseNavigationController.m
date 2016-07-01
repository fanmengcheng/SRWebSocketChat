//
//  SRBaseNavigationController.m
//  SRWebSocketChat
//
//  Created by xuran on 16/6/23.
//  Copyright © 2016年 黯丶野火. All rights reserved.
//

#import "SRBaseNavigationController.h"
#import "XRBaseTransitionAnimation.h"
#import "AppDelegate.h"

@interface SRBaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation SRBaseNavigationController

- (AppDelegate *)appdelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)setupNavigation
{
    // set bar
    self.navigationBar.tintColor = ColorWithRGB(255, 255, 255);
    self.navigationBar.barTintColor = ColorWithRGB(120, 120, 120);
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName : TextSystemFontWithSize(18.0), NSForegroundColorAttributeName : ColorWithRGB(255, 255, 255)};
    self.navigationBar.translucent = YES;
    self.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavigation];
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if ([self appdelegate].navigationAnimation) {
        [self appdelegate].navigationAnimation.reverse = operation == UINavigationControllerOperationPop;
    }
    return [self appdelegate].navigationAnimation;
}

@end
