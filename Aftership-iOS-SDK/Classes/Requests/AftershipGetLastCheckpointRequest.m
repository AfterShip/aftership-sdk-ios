//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipGetLastCheckpointRequest.h"
#import "AftershipGetLastCheckpointResponse.h"


@implementation AftershipGetLastCheckpointRequest {

}

- (instancetype)initWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug completionBlock:(void (^)(AftershipGetLastCheckpointRequest *, AftershipGetLastCheckpointResponse *, NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.trackingNumber = trackingNumber;
    self.slug = slug;
    self.completionBlock = completionBlock;
  }

  return self;
}

+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug completionBlock:(void (^)(AftershipGetLastCheckpointRequest *, AftershipGetLastCheckpointResponse *, NSError *))completionBlock {
  return [[self alloc] initWithTrackingNumber:trackingNumber slug:slug
                              completionBlock:completionBlock];
}


- (void)doExecuteWithManager:(RKObjectManager *)manager {

  [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[[AftershipGetLastCheckpointResponse class] responseMapping]
                                                                                                             method:RKRequestMethodAny
                                                                                                        pathPattern:nil
                                                                                                            keyPath:@"data"
                                                                                                        statusCodes:RKStatusCodeIndexSetForClass(
                                                                                                                RKStatusCodeClassSuccessful)]];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.paramDict];
    NSArray *keysForNullValues = [dict allKeysForObject:[NSNull null]];
    [dict removeObjectsForKeys:keysForNullValues];

  [manager getObject:nil
                path:[NSString stringWithFormat:@"%@/%@/%@",@"last_checkpoint",self.slug,self.trackingNumber]
          parameters:dict
             success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                 [self handleResult:mappingResult withError:nil];
             }
             failure:^(RKObjectRequestOperation *operation, NSError *error) {
                 [self handleResult:nil withError:error];
             }];

}




- (NSDictionary *)paramDict {
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:@{
          @"fields" : @"fields",
          @"lang" : @"lang"
  }];
  RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:[mapping inverseMapping]
                                                                                 objectClass:[self class]
                                                                                 rootKeyPath:nil
                                                                                      method:RKRequestMethodPOST];
  return [RKObjectParameterization parametersWithObject:self requestDescriptor:requestDescriptor error:nil];
}

- (void)setFieldsWithArray:(NSArray *)fields {
  if (fields && fields.count > 0) {
    self.fields = [fields componentsJoinedByString:@","];
  }
}


@end