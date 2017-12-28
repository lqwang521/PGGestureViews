//
//  HTMIGesturePasswordItem.h
//  HTMIGesturePasswordDemo
//
//  Created by wlq on 15/7/10.
//  Copyright (c) 2015年 wlq. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    wrongStyle  ,
    selectStyle ,
    normalStyle
} selectStyleModel;

@interface HTMIGesturePasswordItem : UIView

@property(nonatomic , assign)selectStyleModel model;

/**
 外部
 */
@property(nonatomic , strong)CAShapeLayer *outterLayer;

/**
 内部
 */
@property(nonatomic , strong)CAShapeLayer *innerLayer;

/**
 三角
 */
@property(nonatomic , strong)CAShapeLayer *triangleLayer;

@property(nonatomic , assign)BOOL isSelect;

- (void)judegeDirectionActionx1:(CGFloat)x1 y1:(CGFloat)y1 x2:(CGFloat)x2 y2:(CGFloat)y2 isHidden:(BOOL)isHidden;

@end
