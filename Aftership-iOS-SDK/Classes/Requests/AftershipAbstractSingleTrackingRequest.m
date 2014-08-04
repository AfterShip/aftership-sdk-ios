//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipAbstractSingleTrackingRequest.h"
#import "AftershipTracking.h"
#import "AftershipGetTrackingsResponse.h"


@implementation AftershipAbstractSingleTrackingRequest {

}

-(NSString *)objectPath {
  return @"trackings";
}


- (NSError *)willExecuteWithManager:(RKObjectManager *)manager {
  NSError *err = [super willExecuteWithManager:manager];
  if(err)
  {
    return err;
  } else
  {
    [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[[AftershipTracking class] responseMapping]
                                                                                method:RKRequestMethodAny
                                                                           pathPattern:nil
                                                                               keyPath:@"data.tracking"
                                                                           statusCodes:RKStatusCodeIndexSetForClass(
                                                                                   RKStatusCodeClassSuccessful)]];
    return nil;
  }


}


@end