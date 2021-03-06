//
// Created by Feiko Lai on 4/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Aftership.h"
#import "RXPromise.h"
#import "AftershipTestClientUtils.h"

@interface TrackingRequestsTests : XCTestCase
@property(strong) AftershipClient *client;
@end

@implementation TrackingRequestsTests

- (void)setUp {
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
  self.client = [AftershipTestClientUtils client];
}

- (void)testTrackingLifecycle {

  //create a new tracking 1 with notification
  AftershipTracking *newTracking1 = [AftershipTracking new];
  newTracking1.trackingNumber = [NSString stringWithFormat:@"1111111111"];
  newTracking1.slug = @"dhl";
  newTracking1.emails = @[@"123@123.com"];
  newTracking1.title = @"new tracking 1";

  //create a new tracking 2 with notification
  AftershipTracking *newTracking2 = [AftershipTracking new];
  newTracking2.trackingNumber = [NSString stringWithFormat:@"2222222222"];
  newTracking2.slug = @"fedex";
  newTracking2.emails = @[@"123@123.com"];
  newTracking2.title = @"new tracking 2";

  //create tracking 1 with email
  RXPromise *promise = [RXPromise new];
  AftershipCreateTrackingRequest *createTrackingRequest =
          [AftershipCreateTrackingRequest
                  requestWithTracking:newTracking1
                      completionBlock:^(AftershipCreateTrackingRequest *request,
                              AftershipTracking *tracking,
                              NSError *error) {
                          XCTAssertNil(error, "Create tracking 1 should success");
                          [promise resolveWithResult:nil];
                      }];
  [self.client executeRequest:createTrackingRequest];
  [self waitForPromise:promise];

  //create tracking 2 with email
  promise = [RXPromise new];
  AftershipCreateTrackingRequest *createTrackingRequest2 =
          [AftershipCreateTrackingRequest
                  requestWithTracking:newTracking2
                      completionBlock:^(AftershipCreateTrackingRequest *request,
                              AftershipTracking *tracking,
                              NSError *error) {
                          XCTAssertNil(error, "Create tracking 2 should success");
                          [promise resolveWithResult:nil];
                      }];
  [self.client executeRequest:createTrackingRequest2];
  [self waitForPromise:promise];

  //get trackings
  promise = [RXPromise new];
  AftershipGetTrackingsRequest *aftershipGetTrackingsRequest
          = [AftershipGetTrackingsRequest requestWithCompletionBlock:^(AftershipGetTrackingsRequest *request,
                  AftershipGetTrackingsResponse *response,
                  NSError *error) {
              XCTAssertNil(error, "Get trackings should success");
              XCTAssertTrue(response.count.intValue >= 2, "Should have at least 2 records");
              XCTAssertNil([(AftershipTracking *) response.trackings.firstObject trackingNumber],
                           "Should not have tracking number");
              [promise resolveWithResult:nil];
          }];
  [aftershipGetTrackingsRequest setFieldsWithArray:@[@"title"]];
  [self.client executeRequest:aftershipGetTrackingsRequest];
  [self waitForPromise:promise];
    
    //get trackings 1
    promise = [RXPromise new];
    AftershipGetTrackingRequest *aftershipGetTrackingRequest = [AftershipGetTrackingRequest requestWithTrackingNumber:newTracking1.trackingNumber slug:newTracking1.slug completionBlock:^(AftershipGetTrackingRequest *request, AftershipTracking *tracking, NSError *error) {
        
        XCTAssertNil(error, "Get trackings should success");
        XCTAssertTrue([tracking.title isEqualToString:newTracking1.title], "Title should be same as newTracking1.title");
        XCTAssertTrue([tracking.emails isEqualToArray:newTracking1.emails], "Emails should be same as newTracking1.emails");
        
        [promise resolveWithResult:nil];
    }];
    [self.client executeRequest:aftershipGetTrackingRequest];
    [self waitForPromise:promise];

  //delete tracking 2
  promise = [RXPromise new];
  AftershipDeleteTrackingRequest *aftershipDeleteTrackingRequest =
          [AftershipDeleteTrackingRequest
                  requestWithTrackingNumber:newTracking2.trackingNumber
                                       slug:newTracking2.slug
                            completionBlock:^(AftershipDeleteTrackingRequest *request,
                                    AftershipTracking *tracking,
                                    NSError *error) {
                                XCTAssertNil(error, "Delete tracking 2 should success");
                                [promise resolveWithResult:nil];
                            }];
  [self.client executeRequest:aftershipDeleteTrackingRequest];
  [self waitForPromise:promise];

  //get tracking 2
  promise = [RXPromise new];
  AftershipGetTrackingRequest *aftershipGetTrackingRequest2 =
          [AftershipGetTrackingRequest requestWithTrackingNumber:newTracking2.trackingNumber
                                                            slug:newTracking2.slug
                                                 completionBlock:^(AftershipGetTrackingRequest *request,
                                                         AftershipTracking *tracking,
                                                         NSError *error) {
                                                     XCTAssertNotNil(error, "Should have error when get tracking 2");
                                                     [promise resolveWithResult:nil];
                                                 }];
  [self.client executeRequest:aftershipGetTrackingRequest2];
  [self waitForPromise:promise];

  //update tracking 1
  promise = [RXPromise new];
  newTracking1.tag = @"Delivered";
  AftershipUpdateTrackingRequest *updateTrackingRequest =
          [AftershipUpdateTrackingRequest requestWithTrackingNumber:newTracking1.trackingNumber
                                                               slug:newTracking1.slug
                                                       withTracking:newTracking1
                                                    completionBlock:^(AftershipUpdateTrackingRequest *request,
                                                            AftershipTracking *tracking,
                                                            NSError *error) {
                                                        XCTAssertNil(error,
                                                                        "Should not have error when update tracking 1");
                                                        XCTAssertTrue([tracking.tag isEqualToString:newTracking1.tag],
                                                                      "tag of traking 1 should be updated");
                                                        [promise resolveWithResult:nil];
                                                    }];
  [self.client executeRequest:updateTrackingRequest];
  [self waitForPromise:promise];

  // retrack tracking 1
//  promise = [RXPromise new];
//  AftershipRetrackTrackingRequest *aftershipRetrackTrackingRequest =
//          [AftershipRetrackTrackingRequest requestWithTrackingNumber:newTracking1.trackingNumber
//                                                                slug:newTracking1.slug
//                                                     completionBlock:^(AftershipRetrackTrackingRequest *request,
//                                                             AftershipTracking *tracking,
//                                                             NSError *error) {
//                                                         NSLog(@"retrack");
//                                                         NSLog(@"error %@", error);
//                                                         NSLog(@"tracking %@", tracking);
//                                                         XCTAssertEqual(error.code, 4013,
//                                                                         "Should have error when retrack tracking 1");
//                                                         [promise resolveWithResult:nil];
//                                                     }];
//  [self.client executeRequest:aftershipRetrackTrackingRequest];
//  [self waitForPromise:promise];

    //delete tracking 1
    promise = [RXPromise new];
    AftershipDeleteTrackingRequest *aftershipDeleteTrackingRequest2 =
    [AftershipDeleteTrackingRequest
     requestWithTrackingNumber:newTracking1.trackingNumber
     slug:newTracking1.slug
     completionBlock:^(AftershipDeleteTrackingRequest *request,
                       AftershipTracking *tracking,
                       NSError *error) {
         XCTAssertNil(error, "Delete tracking 1 should success");
         [promise resolveWithResult:nil];
     }];
    [self.client executeRequest:aftershipDeleteTrackingRequest2];
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