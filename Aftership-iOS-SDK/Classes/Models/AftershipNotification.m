//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipNotification.h"


@implementation AftershipNotification {

}

+ (RKObjectMapping *)responseMapping {
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:@{
          @"android" : @"android",
          @"ios" : @"ios",
          @"emails" : @"emails",
          @"smses" : @"smses"
  }];
  return mapping;
}

- (NSString *)description {
  NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
  [description appendFormat:@"self.android=%@", self.android];
  [description appendFormat:@", self.ios=%@", self.ios];
  [description appendFormat:@", self.emails=%@", self.emails];
  [description appendFormat:@", self.smses=%@", self.smses];
  [description appendString:@">"];
  return description;
}


@end