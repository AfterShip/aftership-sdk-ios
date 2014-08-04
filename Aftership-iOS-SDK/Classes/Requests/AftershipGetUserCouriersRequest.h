//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractRequest.h"

@class AftershipGetCouriersResponse;


@interface AftershipGetUserCouriersRequest : AftershipAbstractRequest

+ (instancetype)requestWithCompletionBlock:(void (^)(AftershipGetUserCouriersRequest *, AftershipGetCouriersResponse *, NSError *))completionBlock;
@end