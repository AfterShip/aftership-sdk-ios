//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipRemoveNotificationRequest.h"
#import "AftershipNotification.h"


@implementation AftershipRemoveNotificationRequest {

}

- (instancetype)initWithTrackingNumber:(NSString *)trackingNumber
                                  slug:(NSString *)slug
                      withNotification:(AftershipNotification *)notification
                       completionBlock:(void (^)(AftershipRemoveNotificationRequest *,
                               AftershipNotification *,
                               NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.trackingNumber = trackingNumber;
    self.slug = slug;
    self.completionBlock = completionBlock;
    self.notification = notification;
  }

  return self;
}

+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber
                                     slug:(NSString *)slug
                         withNotification:(AftershipNotification *)notification
                          completionBlock:(void (^)(AftershipRemoveNotificationRequest *,
                                  AftershipNotification *,
                                  NSError *))completionBlock {
  return [[self alloc] initWithTrackingNumber:trackingNumber slug:slug withNotification:notification
                              completionBlock:completionBlock];
}

- (instancetype)initWithIdentifier:(NSString *)identifier
                  withNotification:(AftershipNotification *)notification
                   completionBlock:(void (^)(AftershipRemoveNotificationRequest *,
                           AftershipNotification *,
                           NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.identifier = identifier;
    self.completionBlock = completionBlock;
    self.notification = notification;
  }

  return self;
}

+ (instancetype)requestWithIdentifier:(NSString *)identifier
                     withNotification:(AftershipNotification *)notification
                      completionBlock:(void (^)(AftershipRemoveNotificationRequest *,
                              AftershipNotification *,
                              NSError *))completionBlock {
  return [[self alloc] initWithIdentifier:identifier withNotification:notification
                          completionBlock:completionBlock];
}

- (void)doExecuteWithManager:(RKObjectManager *)manager {

  [manager addRequestDescriptor:[RKRequestDescriptor requestDescriptorWithMapping:[[[AftershipNotification class] responseMapping] inverseMapping]
                                                                      objectClass:[AftershipNotification class]
                                                                      rootKeyPath:@"notification"
                                                                           method:RKRequestMethodPOST]];
  [manager postObject:self.notification path:self.path parameters:nil
              success:^(RKObjectRequestOperation *operation,
                      RKMappingResult *mappingResult) {
                  [self handleResult:mappingResult
                           withError:nil];
              }
              failure:^(RKObjectRequestOperation *operation,
                      NSError *error) {
                  [self handleResult:nil
                           withError:error];
              }];
}

- (NSString *)action {
  return @"remove";
}

@end