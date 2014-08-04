//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractRequest.h"


@interface AftershipAbstractSingleObjectOperationRequest : AftershipAbstractRequest
@property (nonatomic, strong) NSString * slug;
@property (nonatomic, strong) NSString * trackingNumber;
@property (nonatomic, strong) NSString * identifier;
@property (nonatomic, strong) NSString * action;
@property (nonatomic, strong) NSString * objectPath;


- (NSString *)path;
@end