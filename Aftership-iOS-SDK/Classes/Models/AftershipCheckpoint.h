//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AftershipCheckpoint : NSObject

@property (nonatomic, strong) NSDate* createTime;
@property (nonatomic, strong) NSString* slug;
@property (nonatomic, strong) NSString* checkpointTime;
@property (nonatomic, strong) NSString* location;
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSString* state;
@property (nonatomic, strong) NSString* countryCode;
@property (nonatomic, strong) NSString* countryName;
@property (nonatomic, strong) NSString* message;
@property (nonatomic, strong) NSString* tag;
@property (nonatomic, strong) NSString* zip;

- (NSString *)description;

@end