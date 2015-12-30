//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface AftershipNotification : NSObject

@property(nonatomic, strong) NSArray *android;
@property(nonatomic, strong) NSArray *ios;
@property(nonatomic, strong) NSArray *emails;
@property(nonatomic, strong) NSArray *smses;

+ (RKObjectMapping *)responseMapping;
@end