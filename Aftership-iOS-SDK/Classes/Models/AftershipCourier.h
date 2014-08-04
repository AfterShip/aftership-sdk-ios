//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectMapping;


@interface AftershipCourier : NSObject

@property (nonatomic, strong) NSString* slug;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* phone;
@property (nonatomic, strong) NSString* otherName;
@property (nonatomic, strong) NSString* webUrl;
@property (nonatomic, strong) NSArray* requiredFields;


- (NSString *)description;

@end