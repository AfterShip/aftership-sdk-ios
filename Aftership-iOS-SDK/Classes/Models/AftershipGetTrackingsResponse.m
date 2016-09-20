//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//


#import "AftershipGetTrackingsResponse.h"
#import "AftershipTracking.h"
#import "AftershipCourier.h"


@implementation AftershipGetTrackingsResponse {

}

+ (RKObjectMapping *)responseMapping {
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:@{
          @"limit" : @"limit",
          @"page" : @"page",
          @"count" : @"count",
  }];
  [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"trackings" toKeyPath:@"trackings"
                                                                        withMapping:[[AftershipTracking class] responseMapping]]];
  return mapping;
}

- (NSString *)description {
  NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
  [description appendFormat:@"self.limit=%@", self.limit];
  [description appendFormat:@", self.count=%@", self.count];
  [description appendFormat:@", self.page=%@", self.page];
  [description appendFormat:@", self.trackings=%@", self.trackings];
  [description appendString:@">"];
  return description;
}

-(NSUInteger)hash{
  return self.description.hash;
}

-(BOOL)isEqual:(id)object{
  
  if (self == object) {
    return YES;
  }
  
  if (![object isKindOfClass:[self class]]) {
    return NO;
  }
  
  AftershipGetTrackingsResponse *castedObject = (AftershipGetTrackingsResponse *)object;
  return castedObject.hash == self.hash;
  
}


@end
