//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipCreateTrackingRequest.h"
#import "RKObjectManager.h"
#import "AftershipTracking.h"
#import "AftershipGetTrackingsResponse.h"
#import "AftershipError.h"


@implementation AftershipCreateTrackingRequest {

}

- (instancetype)initWithTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipCreateTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.completionBlock = completionBlock;
    self.tracking = tracking;
  }

  return self;
}

+ (instancetype)requestWithTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipCreateTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
  return [[self alloc] initWithTracking:tracking
                        completionBlock:completionBlock];
}

- (NSError *)willExecuteWithManager:(RKObjectManager *)manager {
  NSError *err = [super willExecuteWithManager:manager];
  if (err) {
    return err;
  } else {
    if (self.tracking && self.tracking.trackingNumber) {
      return nil;
    } else {
      return [AftershipError localErrorWithMessage:@"tracking number is missing"];
    }

  }
}

- (void)doExecuteWithManager:(RKObjectManager *)manager {


  [manager addRequestDescriptor:[RKRequestDescriptor requestDescriptorWithMapping:[[[AftershipTracking class] responseMapping] inverseMapping]
                                                                      objectClass:[AftershipTracking class]
                                                                      rootKeyPath:@"tracking"
                                                                           method:RKRequestMethodPOST]];

  [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[[AftershipTracking class] responseMapping]
                                                                              method:RKRequestMethodAny
                                                                         pathPattern:nil
                                                                             keyPath:@"data.tracking"
                                                                         statusCodes:RKStatusCodeIndexSetForClass(
                                                                                 RKStatusCodeClassSuccessful)]];

  [manager postObject:self.tracking path:@"trackings" parameters:nil
              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                  [self handleResult:mappingResult withError:nil];
              } failure:^(RKObjectRequestOperation *operation, NSError *error) {
       [self handleResult:nil withError:error];
   }];
}




@end