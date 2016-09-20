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
  
  AftershipNotification *castedObject = (AftershipNotification *)object;
  return castedObject.hash == self.hash;
  
}


@end
