//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipUpdateTrackingRequest.h"
#import "AftershipGetTrackingsResponse.h"


@implementation AftershipUpdateTrackingRequest {

}


- (instancetype)initWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug withTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipUpdateTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.trackingNumber = trackingNumber;
    self.slug = slug;
    self.completionBlock = completionBlock;
    self.tracking = tracking;
  }

  return self;
}

+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug withTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipUpdateTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
  return [[self alloc] initWithTrackingNumber:trackingNumber slug:slug  withTracking:tracking
                              completionBlock:completionBlock];
}

- (instancetype)initWithIdentifier:(NSString *)identifier withTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipUpdateTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.identifier = identifier;
    self.completionBlock = completionBlock;
    self.tracking = tracking;
  }

  return self;
}

+ (instancetype)requestWithIdentifier:(NSString *)identifier withTracking:(AftershipTracking *)tracking completionBlock:(void (^)(AftershipUpdateTrackingRequest *, AftershipTracking *, NSError *))completionBlock {
  return [[self alloc] initWithIdentifier:identifier withTracking:tracking
                          completionBlock:completionBlock];
}




- (void)doExecuteWithManager:(RKObjectManager *)manager {
  [manager addRequestDescriptor:[RKRequestDescriptor requestDescriptorWithMapping:[[[AftershipTracking class] responseMapping] inverseMapping]
                                                                      objectClass:[AftershipTracking class]
                                                                      rootKeyPath:@"tracking"
                                                                           method:RKRequestMethodPUT]];

  [manager putObject:self.tracking path:self.path parameters:nil
                                                     success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                         [self handleResult:mappingResult
                                                                  withError:nil];
                                                     }
                                                     failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                         [self handleResult:nil
                                                                  withError:error];
                                                     }];
}


@end