//
//
//  CourierRequestsTests
//
//  Created by Feiko Lai on 3/8/14.
//  Copyright (c) 2014 Aftership. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Aftership.h"
#import "RXPromise.h"



@interface CourierRequestsTests : XCTestCase
@property(strong) AftershipClient *client;
@end

@implementation CourierRequestsTests

- (void)setUp {

  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
  self.client = [AftershipClient clientWithApiKey:@"88cec19d-b36f-4ec1-8fb1-e8ee811f9343"];
  self.client.baseUrl = @"http://localhost:3001/v4/";
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
}

- (void)testGetAllCouriers {

  RXPromise *promise = [RXPromise new];
  AftershipGetAllCouriersRequest *request = [AftershipGetAllCouriersRequest requestWithCompletionBlock:^(AftershipAbstractRequest *request,
          AftershipGetCouriersResponse *response,
          NSError *error) {
      XCTAssertNil(error, "There should not be error object");
      XCTAssertTrue(response.couriers.count > 100, "There should be lots of couriers");
      [promise resolveWithResult:nil];
  }];
  [self.client executeRequest:request];
  [self waitForPromise:promise];

}

- (void)testGetUserCouriers {
  RXPromise *promise = [RXPromise new];
  AftershipGetUserCouriersRequest *request = [AftershipGetUserCouriersRequest requestWithCompletionBlock:^(AftershipGetUserCouriersRequest *request,
          AftershipGetCouriersResponse *response,
          NSError *error) {
      XCTAssertNil(error, "There should not be error object");
      XCTAssertNotNil(response, "Should have response");
      XCTAssertTrue(response.couriers.count > 0, "There should be courier(s)");
      [promise resolveWithResult:nil];

  }];
  [self.client executeRequest:request];
  [self waitForPromise:promise];
}

- (void)testDetectCouriers {
  RXPromise *promise = [RXPromise new];
  AftershipTracking *tracking = [AftershipTracking new];
  tracking.trackingNumber = @"1212121212";
  AftershipDetectCourierRequest *request = [AftershipDetectCourierRequest
          requestWithTracking:tracking
              completionBlock:^(AftershipDetectCourierRequest *request,
                      AftershipGetCouriersResponse *response,
                      NSError *error) {
                  XCTAssertNil(error, "There should not be error object");
                  XCTAssertNotNil(response, "Should have response");
                  XCTAssertTrue(response.couriers.count > 0, "There should be courier(s) detected with tracking number:1212121212");
                  XCTAssertTrue([[(AftershipCourier *)response.couriers.firstObject slug] isEqualToString:@"dhl"], "'dhl' should be detected with tracking number:1212121212");
                  [promise resolveWithResult:nil];
              }];
  [self.client executeRequest:request];
  [self waitForPromise:promise];
}

- (void)testDetectCouriersWithSlugs {
  RXPromise *promise = [RXPromise new];
  AftershipTracking *tracking = [AftershipTracking new];
  tracking.trackingNumber = @"1212121212";
  AftershipDetectCourierRequest *request = [AftershipDetectCourierRequest
          requestWithTracking:tracking
              completionBlock:^(AftershipDetectCourierRequest *request,
                      AftershipGetCouriersResponse *response,
                      NSError *error) {
                  XCTAssertNil(error, "There should not be error object");
                  XCTAssertNotNil(response, "Should have response");
                  XCTAssertTrue(response.couriers.count > 0, "There should be courier(s) detected with tracking number:1212121212");
                  XCTAssertTrue([[(AftershipCourier *)response.couriers.firstObject slug] isEqualToString:@"dhl"], "'dhl' should be detected with tracking number:1212121212");
                  [promise resolveWithResult:nil];
              }];
  request.tracking.slug = @"fedex,dhl";
  [self.client executeRequest:request];
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
