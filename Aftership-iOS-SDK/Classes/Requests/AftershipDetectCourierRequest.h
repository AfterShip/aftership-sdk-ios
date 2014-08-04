//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractRequest.h"
#import "AftershipTracking.h"
#import "AftershipGetCouriersResponse.h"



@interface AftershipDetectCourierRequest : AftershipAbstractRequest

@property(nonatomic, strong) AftershipTracking *tracking;

- (instancetype)initWithTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipDetectCourierRequest *, AftershipGetCouriersResponse *, NSError *))completionBlock;

+ (instancetype)requestWithTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipDetectCourierRequest *, AftershipGetCouriersResponse *, NSError *))completionBlock;


@end