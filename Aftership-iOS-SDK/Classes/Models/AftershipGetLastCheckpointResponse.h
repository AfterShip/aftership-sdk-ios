//
// Created by Feiko Lai on 2/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AftershipCheckpoint;


@interface AftershipGetLastCheckpointResponse : NSObject
@property (nonatomic, strong) NSString* trackingNumber;
@property (nonatomic, strong) NSString* slug;
@property (nonatomic, strong) NSString* tag;
@property (nonatomic, strong) AftershipCheckpoint* checkpoint;

- (NSString *)description;
+ (RKObjectMapping *)responseMapping;
@end