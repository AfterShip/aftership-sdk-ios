//
// Created by Feiko Lai on 2/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AftershipGetCouriersResponse : NSObject
@property (nonatomic, strong) NSNumber* total;
@property (nonatomic, strong) NSArray* couriers;

- (NSString *)description;
@end