//
// Created by Feiko Lai on 31/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestKit.h"

@class RKResponseDescriptor;
@class RKObjectManager;
@class RKObjectRequestOperation;
@class RKMappingResult;


@interface AftershipAbstractRequest : NSObject

@property(nonatomic, copy) void (^completionBlock)(id request, id object, NSError *error);

- (void)executeWithManager:(RKObjectManager *)manager;

- (NSError *)willExecuteWithManager:(RKObjectManager *)manager;

- (void)handleResult:(RKMappingResult *)mappingResult withError:(NSError *)err;

//virtual
- (void)doExecuteWithManager:(RKObjectManager *)manager;

//virtual
- (BOOL)isResultOfArrayType;


@end
