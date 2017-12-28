//
//  HTMIGesturePasswordViewController.h
//  HTMIGesturePasswordDemo
//
//  Created by wlq on 15/7/15.
//  Copyright (c) 2015年 wlq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTMIGesturePasswordViewController : UIViewController

typedef void (^LogoutBlock) (NSString *string);
typedef void (^ForgetPasswordBlock) (NSString *string);
typedef void (^SuccessBlock) (NSString *string);

@property(nonatomic , copy)NSString *string;

/**
 需要启动APP
 */
@property(nonatomic , assign)BOOL needEnterApp;

@property(nonatomic , copy)SuccessBlock successBlock;

/**
 退出登录触发
 */
@property(nonatomic , copy)LogoutBlock logoutBlock;

/**
 忘记密码触
 */
@property(nonatomic , copy)ForgetPasswordBlock forgetPasswordBlock;

@end

