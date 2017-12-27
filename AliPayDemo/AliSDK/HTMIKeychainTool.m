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
#define HTMI_KEYCHAIN_ACCOUNT  @"htmitech"

@implementation HTMIKeychainTool

#pragma mark --------------------------

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

#pragma mark - Private

+ (void)forgotPsw
{
    [self removeObjectForKey:KEYCHAIN_KEY];
}

+ (void)setPSW:(NSString *)str
{
    [self setObject:str forKey:KEYCHAIN_KEY];
}

+ (void)setObject:(id)object forKey:(id)key
{
    [self setObject:object forKey:key account:HTMI_KEYCHAIN_ACCOUNT];
}

+ (void)setObject:(id)object forKey:(id)key account:(NSString *)account
{
    [SAMKeychain setPassword:object forService:key account:account];
}

+ (NSString *)objectForKey:(id)key
{
    return [self objectForKey:key account:HTMI_KEYCHAIN_ACCOUNT];
}

+ (NSString *)objectForKey:(id)key account:(NSString *)account
{
    NSString *stringValue = [SAMKeychain passwordForService:key account:account];
    return stringValue;
}

+ (void)removeObjectForKey:(id)key
{
    [SAMKeychain deletePasswordForService:key account:HTMI_KEYCHAIN_ACCOUNT];
}

@end
