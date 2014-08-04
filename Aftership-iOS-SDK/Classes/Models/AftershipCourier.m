//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipCourier.h"


@implementation AftershipCourier {

}

- (NSString *)description {
  NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
  [description appendFormat:@"self.slug=%@", self.slug];
  [description appendFormat:@", self.name=%@", self.name];
  [description appendFormat:@", self.phone=%@", self.phone];
  [description appendFormat:@", self.otherName=%@", self.otherName];
  [description appendFormat:@", self.webUrl=%@", self.webUrl];
  [description appendFormat:@", self.requiredFields=%@", self.requiredFields];
  [description appendString:@">"];
  return description;
}

+ (RKObjectMapping *)responseMapping
{
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:@{
          @"slug" : @"slug",
          @"name" : @"name",
          @"phone" : @"phone",
          @"other_name" : @"otherName",
          @"web_url" : @"webUrl",
          @"required_fields" : @"requiredFields"
  }];
  return mapping;
}



@end