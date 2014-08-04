//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractRequest.h"
#import "AftershipAbstractSingleTrackingRequest.h"
#import "AftershipTracking.h"




@interface AftershipCreateTrackingRequest : AftershipAbstractRequest

@property (nonatomic, strong) AftershipTracking *tracking;


+ (instancetype)requestWithTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipCreateTrackingRequest *, AftershipTracking *, NSError *))completionBlock;

@end