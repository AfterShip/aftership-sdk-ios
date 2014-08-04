//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractSingleTrackingRequest.h"


@interface AftershipUpdateTrackingRequest : AftershipAbstractSingleTrackingRequest

@property (nonatomic, strong) AftershipTracking *tracking;


+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug withTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipUpdateTrackingRequest *, AftershipTracking *, NSError *))completionBlock;

+ (instancetype)requestWithIdentifier:(NSString *)identifier withTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipUpdateTrackingRequest *, AftershipTracking *, NSError *))completionBlock;
@end