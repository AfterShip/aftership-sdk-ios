//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//


#import "RKHTTPUtilities.h"
#import "RKResponseDescriptor.h"
#import "AftershipAbstractSingleNotificationRequest.h"
#import "AftershipNotification.h"
#import "AftershipGetLastCheckpointResponse.h"


@implementation AftershipAbstractSingleNotificationRequest {

}
-(NSString *)objectPath
{
  return @"notifications";
}

- (NSError *)willExecuteWithManager:(RKObjectManager *)manager {
  NSError *err = [super willExecuteWithManager:manager];
  if(err)
  {
    return err;
  } else
  {
    [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[[AftershipNotification class] responseMapping]
                                                                                method:RKRequestMethodAny
                                                                           pathPattern:nil
                                                                               keyPath:@"data.notification"
                                                                           statusCodes:RKStatusCodeIndexSetForClass(
                                                                                   RKStatusCodeClassSuccessful)]];
    return nil;
  }

}

@end