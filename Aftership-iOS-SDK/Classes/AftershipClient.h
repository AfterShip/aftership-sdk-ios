//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AftershipGetAllCouriersRequest;
@class AftershipAbstractRequest;

/**
  An `AftershipClient` object describes an client connecting to Aftership endpoint.
*/
@interface AftershipClient : NSObject


@property (nonatomic, strong) NSString * apiKey;
@property (nonatomic, strong) NSString * baseUrl;

/**
* Creates and returns a new `AftershipClient` object.
 @param apiKey The Aftership developer api key.
 @param baseUrl The url used as base url for connection.
 @return A new `AftershipClient` object.
*/
+ (instancetype)clientWithApiKey:(NSString *)apiKey baseUrl:(NSString *)baseUrl;


/**
* Creates and returns a new `AftershipClient` object.
@param apiKey The Aftership developer api key.
@return A new `AftershipClient` object with default base url.
*/
+ (instancetype)clientWithApiKey:(NSString *)apiKey;


/**
* Execute an `AftershipAbstractRequest`
@param request The request to be executed.
*/
- (void)executeRequest:(AftershipAbstractRequest *)request;



@end

