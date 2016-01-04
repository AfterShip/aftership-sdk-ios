//
// Created by Feiko Lai on 31/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipGetAllCouriersRequest.h"
#import <RestKit/Network/RKObjectRequestOperation.h>
#import "AftershipMeta.h"
#import <RestKit/Support/RKLog.h>
#import <RestKit/Network/RKObjectRequestOperation.h>
#import "AftershipCourier.h"
#import <RestKit/Network/RKObjectManager.h>
#import "AftershipGetTrackingsResponse.h"
#import "AftershipGetCouriersResponse.h"


@implementation AftershipGetAllCouriersRequest {

}
- (instancetype)initWithCompletionBlock:(void (^)(AftershipAbstractRequest *, AftershipGetCouriersResponse *, NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.completionBlock = completionBlock;
  }

  return self;
}

+ (instancetype)requestWithCompletionBlock:(void (^)(AftershipAbstractRequest *, AftershipGetCouriersResponse *, NSError *))completionBlock {
  return [[self alloc] initWithCompletionBlock:completionBlock];
}


- (void)doExecuteWithManager:(RKObjectManager *)manager {

  [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[[AftershipGetCouriersResponse class] responseMapping]
                                                                              method:RKRequestMethodAny
                                                                         pathPattern:nil
                                                                             keyPath:@"data"
                                                                         statusCodes:RKStatusCodeIndexSetForClass(
                                                                                 RKStatusCodeClassSuccessful)]];
  [manager getObjectsAtPath:@"couriers/all" parameters:nil
                    success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                        [self handleResult:mappingResult withError:nil];

                    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
       [self handleResult:nil withError:error];

   }];

}




@end
