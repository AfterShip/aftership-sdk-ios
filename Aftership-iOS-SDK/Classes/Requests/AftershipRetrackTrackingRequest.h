//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractSingleTrackingRequest.h"


@interface AftershipRetrackTrackingRequest : AftershipAbstractSingleTrackingRequest
+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug completionBlock:(void (^)(AftershipRetrackTrackingRequest *, AftershipTracking *, NSError *))completionBlock;

+ (instancetype)requestWithIdentifier:(NSString *)identifier completionBlock:(void (^)(AftershipRetrackTrackingRequest *, AftershipTracking *, NSError *))completionBlock;
@end