//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipMeta.h"



@implementation AftershipMeta {

}



+ (RKObjectMapping *)mapping
{
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:@{
          @"code" : @"code",
          @"message" : @"message",
          @"type" : @"type"
  }];
  return mapping;
}


- (NSString *)description {
  NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
  [description appendFormat:@"self.code=%@", self.code];
  [description appendFormat:@", self.message=%@", self.message];
  [description appendFormat:@", self.type=%@", self.type];
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
  
  AftershipMeta *castedObject = (AftershipMeta *)object;
  return castedObject.hash == self.hash;
  
}


@end
