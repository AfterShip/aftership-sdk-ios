//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractRequest.h"
#import "AftershipAbstractSingleTrackingRequest.h"

@class AftershipTracking;


@interface AftershipDeleteTrackingRequest : AftershipAbstractSingleTrackingRequest


+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug completionBlock:(void (^)(AftershipDeleteTrackingRequest *, AftershipTracking *, NSError *))completionBlock;

+ (instancetype)requestWithIdentifier:(NSString *)identifier completionBlock:(void (^)(AftershipDeleteTrackingRequest *, AftershipTracking *, NSError *))completionBlock;
@end