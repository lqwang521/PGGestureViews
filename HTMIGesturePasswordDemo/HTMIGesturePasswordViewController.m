//
//  HTMIGesturePasswordViewController.m
//  HTMIGesturePasswordDemo
//
//  Created by wlq on 15/7/15.
//  Copyright (c) 2015年 wlq. All rights reserved.
//

#import "HTMIGesturePasswordViewController.h"
#import "HTMIGesturePasswordView.h"
#import "HTMIKeychainTool.h"

@interface HTMIGesturePasswordViewController ()

@end

@implementation HTMIGesturePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /************************* start **********************************/
    
    
    HTMIGesturePasswordView *HTMIGesturePassword = [[HTMIGesturePasswordView alloc] initWithFrame:self.view.bounds];
    HTMIGesturePassword.gesturePasswordViewController = self;
    if ([self.string isEqualToString:@"验证密码"]) {
        HTMIGesturePassword.gestureModel = ValidatePwdModel;
    } else if ([self.string isEqualToString:@"修改密码"]) {
        HTMIGesturePassword.gestureModel = AlertPwdModel;
    } else if ([self.string isEqualToString:@"重置密码"]) {
        HTMIGesturePassword.gestureModel = SetPwdModel;
    } else {
        HTMIGesturePassword.gestureModel = NoneModel;
    }
    HTMIGesturePassword.block = ^(NSString *pswString) {
        
        if (self.successBlock) {
            self.successBlock(@"");
        }
    };
    HTMIGesturePassword.logoutBlock = self.logoutBlock;
    HTMIGesturePassword.forgetPasswordBlock = self.forgetPasswordBlock;
    [self.view addSubview:HTMIGesturePassword];
    
    /************************* end **********************************/
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 64, 64);
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
}

- (void)back  {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

