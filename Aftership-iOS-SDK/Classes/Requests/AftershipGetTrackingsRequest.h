//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractRequest.h"
#import "AftershipAbstractMultipleObjectsRequest.h"

@class AftershipGetTrackingsResponse;


@interface AftershipGetTrackingsRequest : AftershipAbstractRequest
@property (nonatomic, strong) NSNumber *page;
@property (nonatomic, strong) NSNumber *limit;
@property (nonatomic, strong) NSString *keyword;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSNumber *deliveryTime;
@property (nonatomic, strong) NSString *origin;
@property (nonatomic, strong) NSString *destination;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSDate *createdAtMin;
@property (nonatomic, strong) NSDate *createdAtMax;
@property (nonatomic, strong) NSString *fields;
@property (nonatomic, strong) NSString *lang;


+ (instancetype)requestWithCompletionBlock:(void (^)(AftershipGetTrackingsRequest *, AftershipGetTrackingsResponse *, NSError *))completionBlock;

- (void)setFieldsWithArray:(NSArray *)fields;


@end