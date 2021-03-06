//
//  HTMIGesturePasswordView.h
//  HTMIGesturePasswordDemo
//
//  Created by wlq on 15/7/9.
//  Copyright (c) 2015年 wlq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMIGesturePasswordViewController.h"
typedef enum {
    AlertPwdModel,    //修改密码 (需要先输入老密码)
    SetPwdModel,      //重置密码（无论存不存老密码都一并删除，在重新设置密码）
    ValidatePwdModel, //验证密码 (输入一遍，进行验证)
    DeletePwdModel,   //删除密码
    NoneModel
}GestureModel;

typedef void (^PasswordBlock) (NSString *pswString);
typedef void (^LogoutBlock) (NSString *string);
typedef void (^ForgetPasswordBlock) (NSString *string);

@interface HTMIGesturePasswordView : UIView
@property (nonatomic,weak) HTMIGesturePasswordViewController *gesturePasswordViewController;

@property(nonatomic , assign)GestureModel gestureModel;

/**
 密码结果
 */
@property(nonatomic , copy)PasswordBlock block;

/**
 退出登录触发
 */
@property(nonatomic , copy)LogoutBlock logoutBlock;

/**
 忘记密码触
 */
@property(nonatomic , copy)ForgetPasswordBlock forgetPasswordBlock;

@end
