//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipGetTrackingsRequest.h"
#import "AftershipGetTrackingsResponse.h"


@implementation AftershipGetTrackingsRequest {

}

- (instancetype)initWithCompletionBlock:(void (^)(AftershipGetTrackingsRequest *, AftershipGetTrackingsResponse *, NSError *))completionBlock {
  self = [super init];
  if (self) {
    self.completionBlock = completionBlock;
  }

  return self;
}

+ (instancetype)requestWithCompletionBlock:(void (^)(AftershipGetTrackingsRequest *, AftershipGetTrackingsResponse *, NSError *))completionBlock {
  return [[self alloc] initWithCompletionBlock:completionBlock];
}


- (void)doExecuteWithManager:(RKObjectManager *)manager {
  [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[[AftershipGetTrackingsResponse class] responseMapping]
                                                                              method:RKRequestMethodAny
                                                                         pathPattern:nil
                                                                             keyPath:@"data"
                                                                         statusCodes:RKStatusCodeIndexSetForClass(
                                                                                 RKStatusCodeClassSuccessful)]];

    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.paramDict];
    NSArray *keysForNullValues = [dict allKeysForObject:[NSNull null]];
    [dict removeObjectsForKeys:keysForNullValues];
    
  [manager getObjectsAtPath:@"trackings" parameters:dict
                    success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                        
                        [self handleResult:mappingResult withError:nil];

                    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
       [self handleResult:nil withError:error];

   }];
}



- (NSDictionary *)paramDict {
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:@{
          @"page" : @"page",
          @"limit" : @"limit",
          @"keyword" : @"keyword",
          @"slug" : @"slug",
          @"delivery_time" : @"deliveryTime",
          @"origin" : @"origin",
          @"destination" : @"destination",
          @"tag" : @"tag",
          @"created_at_min" : @"createdAtMin",
          @"created_at_max" : @"createdAtMax",
          @"fields" : @"fields",
          @"lang" : @"lang"
  }];
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:[mapping inverseMapping] objectClass:[self class] rootKeyPath:nil method:RKRequestMethodPOST];
    return [RKObjectParameterization parametersWithObject:self requestDescriptor:requestDescriptor error:nil];
}

- (void)setFieldsWithArray:(NSArray *)fields
{
  if(fields && fields.count > 0)
  {
    self.fields = [fields componentsJoinedByString:@","];
  }

}

@end