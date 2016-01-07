//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipGetNotificationsRequest.h"
#import "AftershipNotification.h"


@implementation AftershipGetNotificationsRequest {

}

- (instancetype)initWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug completionBlock:(void (^)(AftershipGetNotificationsRequest *, AftershipNotification *, NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.trackingNumber = trackingNumber;
    self.slug = slug;
    self.completionBlock = completionBlock;
  }

  return self;
}

+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug completionBlock:(void (^)(AftershipGetNotificationsRequest *, AftershipNotification *, NSError *))completionBlock {
  return [[self alloc] initWithTrackingNumber:trackingNumber slug:slug
                              completionBlock:completionBlock];
}

- (instancetype)initWithIdentifier:(NSString *)identifier completionBlock:(void (^)(AftershipGetNotificationsRequest *, AftershipNotification *, NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.identifier = identifier;
    self.completionBlock = completionBlock;
  }

  return self;
}

+ (instancetype)requestWithIdentifier:(NSString *)identifier completionBlock:(void (^)(AftershipGetNotificationsRequest *, AftershipNotification *, NSError *))completionBlock {
  return [[self alloc] initWithIdentifier:identifier
                          completionBlock:completionBlock];
}
- (void)doExecuteWithManager:(RKObjectManager *)manager {

    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.paramDict];
    NSArray *keysForNullValues = [dict allKeysForObject:[NSNull null]];
    [dict removeObjectsForKeys:keysForNullValues];
    
  [manager getObject:nil path:self.path parameters:dict
                                           success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                               [self handleResult:mappingResult
                                                        withError:nil];
                                           }
                                           failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                               [self handleResult:nil
                                                        withError:error];
                                           }];
}

- (void)setFieldsWithArray:(NSArray *)fields {
  if (fields && fields.count > 0) {
    self.fields = [fields componentsJoinedByString:@","];
  }
}

- (NSDictionary *)paramDict {
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:@{
          @"fields" : @"fields",
  }];
  RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:[mapping inverseMapping]
                                                                                 objectClass:[self class]
                                                                                 rootKeyPath:nil
                                                                                      method:RKRequestMethodPOST];
  return [RKObjectParameterization parametersWithObject:self requestDescriptor:requestDescriptor error:nil];
}


@end