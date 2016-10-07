//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipClient.h"
#import "AftershipGetAllCouriersRequest.h"
#import "RKObjectManager.h"

@implementation AftershipClient {

}

static NSString *const ASAPIBaseUrl = @"https://api.aftership.com";
static NSString *const ASAPIVersion = @"4";

- (instancetype)initWithApiKey:(NSString *)apiKey {
  self = [super init];
  if (self) {
    self.apiKey = apiKey;
    self.baseUrl = [NSString stringWithFormat:@"%@/v%@/", ASAPIBaseUrl, ASAPIVersion];
  }

  return self;
}

+ (instancetype)clientWithApiKey:(NSString *)apiKey {
  return [[self alloc] initWithApiKey:apiKey];
}

- (instancetype)initWithApiKey:(NSString *)apiKey baseUrl:(NSString *)baseUrl {
  self = [super init];
  if (self) {
    self.apiKey = apiKey;
    self.baseUrl = baseUrl;
  }

  return self;
}

+ (instancetype)clientWithApiKey:(NSString *)apiKey baseUrl:(NSString *)baseUrl {
  return [[self alloc] initWithApiKey:apiKey baseUrl:baseUrl];
}


- (void)executeRequest:(AftershipAbstractRequest *)request
{
  //new manager per request for preventing mixed keyPaths descriptor
  [request executeWithManager:self.newManager];
}

-(RKObjectManager *)newManager
{
  NSURL *nsUrl = [NSURL URLWithString:self.baseUrl];
  RKObjectManager *rkObjectManager = [RKObjectManager managerWithBaseURL:nsUrl];
  [rkObjectManager.HTTPClient setDefaultHeader:@"aftership-api-key" value:self.apiKey];
  return rkObjectManager;
}



@end
