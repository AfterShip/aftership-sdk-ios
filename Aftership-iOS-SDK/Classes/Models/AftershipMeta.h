//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestKit.h"

@class RKObjectMapping;


@interface AftershipMeta : NSObject
@property(nonatomic, strong) NSNumber *code;
@property(nonatomic, strong) NSString *message;
@property(nonatomic, strong) NSString *type;


+ (RKObjectMapping *)mapping;


- (NSString *)description;
@end
