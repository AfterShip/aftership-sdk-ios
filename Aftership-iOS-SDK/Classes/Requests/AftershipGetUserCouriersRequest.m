//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipGetUserCouriersRequest.h"
#import "AftershipGetCouriersResponse.h"
#import "AftershipGetTrackingsResponse.h"


@implementation AftershipGetUserCouriersRequest {

}

- (instancetype)initWithCompletionBlock:(void (^)(AftershipGetUserCouriersRequest *, AftershipGetCouriersResponse *, NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.completionBlock = completionBlock;
  }

  return self;
}

+ (instancetype)requestWithCompletionBlock:(void (^)(AftershipGetUserCouriersRequest *, AftershipGetCouriersResponse *, NSError *))completionBlock {
  return [[self alloc] initWithCompletionBlock:completionBlock];
}


- (void)doExecuteWithManager:(RKObjectManager *)manager {

  [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[[AftershipGetCouriersResponse class] responseMapping]
                                                                              method:RKRequestMethodAny
                                                                         pathPattern:nil
                                                                             keyPath:@"data"
                                                                         statusCodes:RKStatusCodeIndexSetForClass(
                                                                                 RKStatusCodeClassSuccessful)]];
  [manager getObjectsAtPath:@"couriers" parameters:nil
                    success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                        [self handleResult:mappingResult withError:nil];

                    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
       [self handleResult:nil withError:error];

   }];

}



@end