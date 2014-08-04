//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AftershipGetAllCouriersRequest;
@class AftershipAbstractRequest;


@interface AftershipClient : NSObject


@property (nonatomic, strong) NSString * apiKey;
@property (nonatomic, strong) NSString * baseUrl;

- (instancetype)initWithApiKey:(NSString *)apiKey;

- (instancetype)initWithApiKey:(NSString *)apiKey baseUrl:(NSString *)baseUrl;

+ (instancetype)clientWithApiKey:(NSString *)apiKey baseUrl:(NSString *)baseUrl;


- (void)executeRequest:(AftershipAbstractRequest *)request;

+ (instancetype)clientWithApiKey:(NSString *)apiKey;


@end

