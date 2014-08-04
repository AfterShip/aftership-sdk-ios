//
// Created by Feiko Lai on 2/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AftershipMeta;

#ifndef AFERSHIP_ERROR_DOMAIN
#define AFERSHIP_ERROR_DOMAIN
static NSString *const AftershipErrorDomain = @"com.aftership.error";
#endif


@interface AftershipError : NSError
+ (instancetype)errorWithCode:(NSInteger)code;

+ (instancetype)errorWithMeta:(AftershipMeta *)meta;

+ (instancetype)localErrorWithMessage:(NSString *)message;
@end