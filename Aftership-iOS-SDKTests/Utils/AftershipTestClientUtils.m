//
// Created by Feiko Lai on 4/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipTestClientUtils.h"
#import "AftershipClient.h"


@implementation AftershipTestClientUtils

+(AftershipClient *)client
{
  return [AftershipClient clientWithApiKey:@"YOUR-API-KEY"];
}

@end