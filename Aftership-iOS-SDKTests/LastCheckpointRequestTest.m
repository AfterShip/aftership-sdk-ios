//
// Created by Feiko Lai on 4/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//
#import <XCTest/XCTest.h>
#import "Aftership.h"
#import "RXPromise.h"

@interface LastCheckpointRequestTests : XCTestCase
@property(strong) AftershipClient *client;
@end


@implementation LastCheckpointRequestTests

- (void)setUp {
  [super setUp];
  self.client = [AftershipClient clientWithApiKey:@"88cec19d-b36f-4ec1-8fb1-e8ee811f9343"];
  //use mocking http response, only verify connection and object mapping
  self.client.baseUrl = @"http://www.mocky.io/v2/53df3f7a3a67abe70e4b5a17";
}

- (void)testGetLastCheckpoint {

  RXPromise *promise = [RXPromise new];
  AftershipGetLastCheckpointRequest *request =
          [AftershipGetLastCheckpointRequest
                  requestWithTrackingNumber:@"12345678"
                                       slug:@"mySlug"
                            completionBlock:^(AftershipGetLastCheckpointRequest *request,
                                    AftershipGetLastCheckpointResponse *response,
                                    NSError *error) {
                                XCTAssertNil(error, "Get last checkpoint should success");
                                XCTAssertTrue(
                                        [response.checkpoint.city isEqualToString:@"POMPANO BEACH"],
                                        "'city' should be retrieved"
                                );
                                NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                                                                                               fromDate:response.checkpoint.createTime];

                                XCTAssertTrue(
                                        components.day == 25 && components.month == 6 && components.year ==2014,
                                        "'created_at' should be retrieved"
                                );
                                [promise resolveWithResult:nil];
                            }];
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