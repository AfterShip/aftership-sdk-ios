//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractSingleNotificationRequest.h"

@class AftershipNotification;


@interface AftershipGetNotificationsRequest : AftershipAbstractSingleNotificationRequest
@property (nonatomic, strong)NSString *fields;

+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber slug:(NSString *)slug completionBlock:(void (^)(AftershipGetNotificationsRequest *, AftershipNotification *, NSError *))completionBlock;

+ (instancetype)requestWithIdentifier:(NSString *)identifier completionBlock:(void (^)(AftershipGetNotificationsRequest *, AftershipNotification *, NSError *))completionBlock;
@end