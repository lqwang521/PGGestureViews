//
//  HTMIKeychainTool.m
//  AliPayDemo
//
//  Created by wlq on 15/7/15.
//  Copyright (c) 2015年 wlq. All rights reserved.
//

#import "HTMIKeychainTool.h"

#import <SAMKeychain/SAMKeychain.h>

#define KEYCHAIN_KEY  @"password_slider"
#define HTMI_KEYCHAIN_SERVICE  @"com.htmitech.emportal"

@implementation HTMIKeychainTool

#pragma mark - UUID

+ (NSString *)getUUID {
    return [self objectForKey:@"uuid"];
}

+ (void)setUUID:(NSString *)uuid {
    [self setObject:uuid forKey:@"uuid"];
}

#pragma mark - 手势密码

+ (BOOL)isSave
{
    NSString *str = [self objectForKey:KEYCHAIN_KEY];
    if (str && str.length>0 && [str isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isFirstInput:(NSString *)str
{
    NSString *oldStr = [self objectForKey:KEYCHAIN_KEY];
    if (oldStr && oldStr.length>0 && [oldStr isKindOfClass:[NSString class]])
    {
        return NO;
    }
    
    [self setObject:str forKey:KEYCHAIN_KEY];
    
    return YES;
}

+ (BOOL)isSecondInputRight:(NSString *)str
{
    NSString *oldStr = [self objectForKey:KEYCHAIN_KEY];
  
    if ([oldStr isKindOfClass:[NSNull class]]) {
        return NO;
    }
    else if (!oldStr || oldStr.length<1 || ![oldStr isKindOfClass:[NSString class]]) {
        return NO;
    }
    else if (oldStr.length==str.length  &&  [oldStr isEqualToString:str]) {
        return YES;
    }
    
    return NO;
}

+ (void)forgotPsw
{
    [self removeObjectForKey:KEYCHAIN_KEY];
}

+ (void)setPSW:(NSString *)str
{
    [self setObject:str forKey:KEYCHAIN_KEY];
}

#pragma mark - Private

+ (void)setObject:(id)object forKey:(id)key
{
    [self setObject:object forKey:key service:HTMI_KEYCHAIN_SERVICE];
}

+ (void)setObject:(id)object forKey:(id)key service:(NSString *)service
{
    [SAMKeychain setPassword:object forService:service account:key];
}

+ (NSString *)objectForKey:(id)key
{
    NSString * valueString = [self objectForKey:key service:HTMI_KEYCHAIN_SERVICE];
    return valueString;
}

+ (NSString *)objectForKey:(id)key service:(NSString *)service
{
    NSString *stringValue = [SAMKeychain passwordForService:service account:key];
    return stringValue;
}

+ (void)removeObjectForKey:(id)key
{
    [SAMKeychain deletePasswordForService:HTMI_KEYCHAIN_SERVICE account:key];
}

@end
