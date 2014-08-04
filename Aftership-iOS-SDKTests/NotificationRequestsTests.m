//
//
//  NotificationRequestsTests
//
//  Created by Feiko Lai on 3/8/14.
//  Copyright (c) 2014 Aftership. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Aftership.h"
#import "RXPromise.h"
#import "AftershipTestClientUtils.h"

@interface NotificationRequestsTests : XCTestCase
@property(strong) AftershipClient *client;
@end

@implementation NotificationRequestsTests

- (void)setUp {
  [super setUp];
  self.client = [AftershipTestClientUtils client];

}

- (void)testNotificationRequests {

  //create a new tracking with notification
  AftershipTracking *newTracking = [AftershipTracking new];
  newTracking.trackingNumber = [NSString stringWithFormat:@"%d", abs(arc4random())];
  newTracking.slug = @"dhl";
  newTracking.emails = @[@"123@123.com"];

  //create tracking with email
  RXPromise *promise = [RXPromise new];
  AftershipCreateTrackingRequest *createTrackingRequest =
          [AftershipCreateTrackingRequest
                  requestWithTracking:newTracking
                      completionBlock:^(AftershipCreateTrackingRequest *request,
                              AftershipTracking *tracking,
                              NSError *error) {
                          [promise resolveWithResult:nil];
                      }];
  [self.client executeRequest:createTrackingRequest];
  [self waitForPromise:promise];

  //get tracking back and verify
  promise = [RXPromise new];
  AftershipGetNotificationsRequest *getNotificationsRequest
          = [AftershipGetNotificationsRequest
                  requestWithTrackingNumber:newTracking.trackingNumber
                                       slug:newTracking.slug
                            completionBlock:^(AftershipGetNotificationsRequest *request,
                                    AftershipNotification *notification,
                                    NSError *error) {
                                XCTAssertNil(error, "Get notification should success");
                                XCTAssertTrue(
                                        [(NSString *) notification.emails.firstObject isEqualToString:newTracking.emails.firstObject],
                                        "Get notification should return newly set emails"
                                );
                                [promise resolveWithResult:nil];

                            }];
  [self.client executeRequest:getNotificationsRequest];
  [self waitForPromise:promise];

  //remove email
  promise = [RXPromise new];
  AftershipNotification *notification = [AftershipNotification new];
  notification.emails = newTracking.emails;
  AftershipRemoveNotificationRequest *aftershipRemoveNotificationRequest =
          [AftershipRemoveNotificationRequest
                  requestWithTrackingNumber:newTracking.trackingNumber
                                       slug:newTracking.slug
                           withNotification:notification
                            completionBlock:^(AftershipRemoveNotificationRequest *request,
                                    AftershipNotification *notification,
                                    NSError *error) {
                                XCTAssertNil(error, "Remove notification should success");
                                [promise resolveWithResult:nil];
                            }];


  [self.client executeRequest:aftershipRemoveNotificationRequest];
  [self waitForPromise:promise];

  //get tracking back and verify removed email
  promise = [RXPromise new];
  getNotificationsRequest
          = [AftershipGetNotificationsRequest
          requestWithTrackingNumber:newTracking.trackingNumber
                               slug:newTracking.slug
                    completionBlock:^(AftershipGetNotificationsRequest *request,
                            AftershipNotification *notification,
                            NSError *error) {
                        XCTAssertNil(error, "Get notification should success");
                        XCTAssertTrue(
                                notification.emails.count == 0,
                                "Get notification should return empty emails"
                        );
                        [promise resolveWithResult:nil];

                    }];
  [self.client executeRequest:getNotificationsRequest];
  [self waitForPromise:promise];

  //add email
  promise = [RXPromise new];

  AftershipAddNotificationRequest *addNotificationRequest =
          [AftershipAddNotificationRequest
                  requestWithTrackingNumber:newTracking.trackingNumber
                                       slug:newTracking.slug
                           withNotification:notification
                            completionBlock:^(AftershipAddNotificationRequest *request,
                                    AftershipNotification *notification,
                                    NSError *error) {
                                XCTAssertNil(error, "Add notification should success");
                                [promise resolveWithResult:nil];
                            }];

  [self.client executeRequest:addNotificationRequest];
  [self waitForPromise:promise];






  //get tracking back and verify added email
  promise = [RXPromise new];
  getNotificationsRequest
          = [AftershipGetNotificationsRequest
          requestWithTrackingNumber:newTracking.trackingNumber
                               slug:newTracking.slug
                    completionBlock:^(AftershipGetNotificationsRequest *request,
                            AftershipNotification *notification,
                            NSError *error) {
                        XCTAssertNil(error, "Get notification should success");
                        XCTAssertTrue(
                                [(NSString *) notification.emails.firstObject isEqualToString:newTracking.emails.firstObject],
                                "Get notification should return added emails"
                        );
                        [promise resolveWithResult:nil];

                    }];
  [self.client executeRequest:getNotificationsRequest];
  [self waitForPromise:promise];


  //delete tracking
  promise = [RXPromise new];
  AftershipDeleteTrackingRequest *aftershipDeleteTrackingRequest
  =[AftershipDeleteTrackingRequest requestWithTrackingNumber:newTracking.trackingNumber slug:newTracking.slug
                                              completionBlock:^(AftershipDeleteTrackingRequest *request,
                                                      AftershipTracking *tracking,
                                                      NSError *error) {
                                                  [promise resolveWithResult:nil];
                                              }];
  [self.client executeRequest:aftershipDeleteTrackingRequest];
  [self waitForPromise:promise];


}

- (void)waitForPromise:(RXPromise *)promise {

  [promise.then(^id(id result) {
      return nil;
  }, ^id(NSError *error) {
      return nil;
  }) runLoopWait];

}


@end

