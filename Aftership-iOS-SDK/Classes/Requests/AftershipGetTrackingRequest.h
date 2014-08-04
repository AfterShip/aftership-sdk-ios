//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractRequest.h"
#import "AftershipAbstractSingleTrackingRequest.h"


@interface AftershipGetTrackingRequest : AftershipAbstractSingleTrackingRequest

+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug completionBlock:(void (^)(AftershipGetTrackingRequest *, AftershipTracking *, NSError *))completionBlock;

+ (instancetype)requestWithIdentifier:(NSString *)identifier completionBlock:(void (^)(AftershipGetTrackingRequest *, AftershipTracking *, NSError *))completionBlock;


- (void)setFieldsWithArray:(NSArray *)fields;

@property (nonatomic, strong) NSString *fields;
@property (nonatomic, strong) NSString *lang;
@end