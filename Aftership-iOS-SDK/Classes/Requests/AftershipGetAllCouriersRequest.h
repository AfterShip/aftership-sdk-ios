//
// Created by Feiko Lai on 31/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractRequest.h"
#import "AftershipAbstractMultipleObjectsRequest.h"

@class AftershipGetCouriersResponse;


@interface AftershipGetAllCouriersRequest : AftershipAbstractRequest

+ (instancetype)requestWithCompletionBlock:(void (^)(AftershipAbstractRequest *, AftershipGetCouriersResponse *, NSError *))completionBlock;

@end