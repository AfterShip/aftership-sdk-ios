//
// Created by Feiko Lai on 2/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipLogUtil.h"


@implementation AftershipLogUtil {

}
static BOOL enabled = NO;

+(void)log:(NSString *)message
{
  if(enabled) {
    NSLog(@"AftershipSDK: %@", message);
  }
}

+(void)log:(NSString *)message withTag:(NSString *)tag
{
  if(enabled) {
    NSLog(@"AftershipSDK: |%@| %@", tag, message);
  }
}

+(void)setEnabled:(BOOL)value
{
  enabled = value;
}
@end