//
// Created by Feiko Lai on 2/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipGetLastCheckpointResponse.h"
#import "AftershipCheckpoint.h"


@implementation AftershipGetLastCheckpointResponse {

}

+ (RKMapping *)responseMapping {
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:@{
          @"tracking_number" : @"trackingNumber",
          @"slug":@"slug",
          @"tag":@"tag"
  }];
  [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"checkpoint" toKeyPath:@"checkpoint"
                                                                        withMapping:[[AftershipCheckpoint class] responseMapping]]];
  return mapping;
}

- (NSString *)description {
  NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
  [description appendFormat:@"self.trackingNumber=%@", self.trackingNumber];
  [description appendFormat:@", self.slug=%@", self.slug];
  [description appendFormat:@", self.tag=%@", self.tag];
  [description appendFormat:@", self.checkpoint=%@", self.checkpoint];
  [description appendString:@">"];
  return description;
}

@end