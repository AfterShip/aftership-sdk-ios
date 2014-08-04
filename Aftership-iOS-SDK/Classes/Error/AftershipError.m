//
// Created by Feiko Lai on 2/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipError.h"
#import "AftershipMeta.h"


@implementation AftershipError {

}

+ (instancetype)errorWithCode:(NSInteger)code
{
  return [[self alloc] initWithDomain:AftershipErrorDomain code:code userInfo:nil];
}

+ (instancetype)errorWithMeta:(AftershipMeta *)meta
{
  NSString *message = [NSString stringWithFormat:@"code: %@, type: %@, message:%@", meta.code, meta.type, meta.message];

  NSDictionary *userInfo = @{
          NSLocalizedDescriptionKey: NSLocalizedString(message, nil),
  };
  return [[self alloc] initWithDomain:AftershipErrorDomain code:[meta.code intValue] userInfo:userInfo];
}


+ (instancetype)localErrorWithMessage:(NSString *)message
{
  NSDictionary *userInfo = @{
          NSLocalizedDescriptionKey: NSLocalizedString(message, nil),
  };
  return [[self alloc] initWithDomain:AftershipErrorDomain code:0 userInfo:userInfo];
}


@end