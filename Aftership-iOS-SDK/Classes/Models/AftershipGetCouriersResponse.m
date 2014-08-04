//
// Created by Feiko Lai on 2/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipGetCouriersResponse.h"
#import "AftershipTracking.h"
#import "AftershipGetTrackingsResponse.h"
#import "AftershipCourier.h"


@implementation AftershipGetCouriersResponse {

}

+ (RKObjectMapping *)responseMapping {
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:@{
          @"total" : @"total"
  }];
  [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"couriers" toKeyPath:@"couriers"
                                                                        withMapping:[[AftershipCourier class] responseMapping]]];
  return mapping;
}

- (NSString *)description {
  NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
  [description appendFormat:@"self.total=%@", self.total];
  [description appendFormat:@", self.couriers=%@", self.couriers];
  [description appendString:@">"];
  return description;
}


@end