//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipAbstractSingleObjectOperationRequest.h"
#import "AftershipError.h"


@implementation AftershipAbstractSingleObjectOperationRequest {

}


- (NSError *)willExecuteWithManager:(RKObjectManager *)manager {

  NSError *err = [super willExecuteWithManager:manager];
  if(err)
  {
    return err;
  } else
  {
    if ((self.slug && self.trackingNumber && !self.identifier)
            || (!self.slug && !self.trackingNumber && self.identifier)) {

      return nil;

    } else {
      AftershipError *error = [AftershipError localErrorWithMessage:@"either id or slug with tracking number is missing"];
      return error;
    }

  }

}


-(NSString *)path {
  NSString *path;
  if (self.identifier) {
    path = [NSString stringWithFormat:@"%@/%@",
                                      self.objectPath,
                                      self.identifier
    ];
  } else {
    path = [NSString stringWithFormat:@"%@/%@/%@",
                                      self.objectPath,
                                      self.slug,
                                      self.trackingNumber];
  }
  if(self.action)
  {
    path = [NSString stringWithFormat:@"%@/%@", path, self.action];
  }
  return path;
}



@end