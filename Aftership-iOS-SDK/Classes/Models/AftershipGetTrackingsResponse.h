//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface AftershipGetTrackingsResponse : NSObject
@property (nonatomic, strong) NSNumber* limit;
@property (nonatomic, strong) NSNumber* count;
@property (nonatomic, strong) NSNumber* page;
@property (nonatomic, strong) NSArray* trackings;

+ (RKObjectMapping *)responseMapping;

- (NSString *)description;
@end