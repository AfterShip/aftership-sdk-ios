//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipCheckpoint.h"


@implementation AftershipCheckpoint {

}

+ (RKObjectMapping *)responseMapping {
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:@{
          @"created_at" : @"createTime",
          @"slug" : @"slug",
          @"checkpoint_time" : @"checkpointTime",
          @"location" : @"location",
          @"city" : @"city",
          @"country_iso3" : @"countryCode",
          @"country_name" : @"countryName",
          @"message" : @"message",
          @"state" : @"state",
          @"zip" : @"zip",
          @"tag" : @"tag"
  }];
  return mapping;
}

- (NSString *)description {
  NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
  [description appendFormat:@"self.createTime=%@", self.createTime];
  [description appendFormat:@", self.slug=%@", self.slug];
  [description appendFormat:@", self.checkpointTime=%@", self.checkpointTime];
  [description appendFormat:@", self.location=%@", self.location];
  [description appendFormat:@", self.city=%@", self.city];
  [description appendFormat:@", self.state=%@", self.state];
  [description appendFormat:@", self.countryCode=%@", self.countryCode];
  [description appendFormat:@", self.countryName=%@", self.countryName];
  [description appendFormat:@", self.message=%@", self.message];
  [description appendFormat:@", self.tag=%@", self.tag];
  [description appendFormat:@", self.zip=%@", self.zip];
  [description appendString:@">"];
  return description;
}

@end