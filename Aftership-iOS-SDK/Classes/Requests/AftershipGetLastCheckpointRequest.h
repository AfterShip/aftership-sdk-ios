//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractSingleTrackingRequest.h"

@class AftershipGetLastCheckpointResponse;


@interface AftershipGetLastCheckpointRequest : AftershipAbstractRequest

+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug completionBlock:(void (^)(AftershipGetLastCheckpointRequest *, AftershipGetLastCheckpointResponse *, NSError *))completionBlock;

- (void)setFieldsWithArray:(NSArray *)fields;

@property(nonatomic, strong) NSString *fields;
@property(nonatomic, strong) NSString *lang;
@property(nonatomic, strong) NSString *trackingNumber;
@property(nonatomic, strong) NSString *slug;
@end