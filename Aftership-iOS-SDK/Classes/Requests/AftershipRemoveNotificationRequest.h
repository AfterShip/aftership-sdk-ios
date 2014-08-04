//
// Created by Feiko Lai on 1/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AftershipAbstractSingleNotificationRequest.h"

@class AftershipNotification;


@interface AftershipRemoveNotificationRequest : AftershipAbstractSingleNotificationRequest

@property (nonatomic, strong) AftershipNotification *notification;

+ (instancetype)requestWithTrackingNumber:(NSString *)trackingNumber
                                     slug:(NSString *)slug
                         withNotification:(AftershipNotification *)notification
                          completionBlock:(void (^)(AftershipRemoveNotificationRequest *,
                                  AftershipNotification *,
                                  NSError *))completionBlock;

+ (instancetype)requestWithIdentifier:(NSString *)identifier
                     withNotification:(AftershipNotification *)notification
                      completionBlock:(void (^)(AftershipRemoveNotificationRequest *,
                              AftershipNotification *,
                              NSError *))completionBlock;
@end