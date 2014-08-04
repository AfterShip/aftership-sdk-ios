//
// Created by Feiko Lai on 31/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipAbstractRequest.h"
#import "RKObjectRequestOperation.h"
#import "AftershipMeta.h"
#import "RKLog.h"
#import "AftershipCourier.h"
#import "RKResponseDescriptor.h"
#import "RKObjectManager.h"
#import "RKMappingResult.h"
#import "AftershipError.h"
#import "AftershipLogUtil.h"


@implementation AftershipAbstractRequest {

}


//basic flow for further customization
- (void)executeWithManager:(RKObjectManager *)manager {

  NSError *error = [self willExecuteWithManager:manager];
  if (error) {
    if(self.isResultOfArrayType) {
      self.completionBlock(self, [NSArray array], error);
    } else
    {
      self.completionBlock(self, nil, error);
    }
  } else {
    [self doExecuteWithManager:manager];
  }
}

//for config and validation
- (NSError *)willExecuteWithManager:(RKObjectManager *)manager {
  [manager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[[AftershipMeta class] mapping]
                                                                              method:RKRequestMethodAny
                                                                         pathPattern:nil
                                                                             keyPath:@"meta"
                                                                         statusCodes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(
                                                                                 200,
                                                                                 400)]]];
  return nil;

}

- (BOOL)isResultOfArrayType {
  return NO;
}


//should be called in subclass's success completion block
- (void)handleResult:(RKMappingResult *)mappingResult withError:(NSError *)err {

  if(err)
  {
    __block NSError *e = err;
    if(err.userInfo && [err.userInfo objectForKey:RKObjectMapperErrorObjectsKey])
    {
      [((NSArray *)[err.userInfo objectForKey:RKObjectMapperErrorObjectsKey]) enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
          if([[obj class] isEqual:[AftershipMeta class]])
          {
            e = [AftershipError errorWithMeta:obj];
          }
      }];
    }

    if(self.isResultOfArrayType) {
      self.completionBlock(self, [NSArray array], e);
    } else
    {
      self.completionBlock(self, nil, e);
    }
    return;
  }
  __block NSError *error;
  __block BOOL hasMeta = NO;
  __block NSMutableArray *results = [NSMutableArray array];
  [AftershipLogUtil log:mappingResult withTag:@"Mapping Results"];
  [mappingResult.array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      //assuming there are two classes of object, Meta class and target object class
      if ([obj class] == [AftershipMeta class]) {
        hasMeta = YES;
        AftershipMeta *meta = obj;
        int code = meta.code.intValue;
        //meta.code range in {200..299}
        if (code >= 200 && code < 300) {

        } else {
          error = [AftershipError errorWithMeta:meta];
        }
      } else {
        [results addObject:obj];
      }
  }];

  if (!hasMeta) {
    error = [AftershipError localErrorWithMessage:@"No meta found in response."];
  }

  if(self.completionBlock) {
    if (self.isResultOfArrayType) {
      self.completionBlock(self, results, error);
    } else
    {
      self.completionBlock(self, [results firstObject], error);
    }
  }

}


@end