//
//  InstaNetFrameTests.m
//  InstaNetFrameTests
//
//  Created by Ahmed Abodeif on 5/10/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <InstaNetFrame/HTTPMethod.h>
#import <InstaNetFrame/Request.h>
#import <InstaNetFrame/RequestQueue.h>
#import <InstaNetFrame/APIRequestManager.h>

@interface InstaNetFrameTests : XCTestCase

@end

@implementation InstaNetFrameTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testRequestWithoutCompletionHandler{
    NSString *str = [NSString stringWithFormat:@"http://localhost:3000/posts/5"];
    NSURL *requestURL = [NSURL URLWithString: str];
    HTTPMethod method = GET;
    Request *testRequest = [[Request alloc] initWithURL:requestURL MethodType:method RequestParameters:nil];
    
    XCTAssertEqual(testRequest.URL, requestURL, @"Failed to initialise Request with provided URL.");
    XCTAssertEqual(testRequest.Method, method, @"Failed to initialise Request with provided HTTP method.");
    XCTAssertNil(testRequest.completionHandler, @"Failed, completition handler not nil but no completition handler was attached.");
}

- (void)testRequestWithCompletionHandler{
    NSString *str = [NSString stringWithFormat:@"http://localhost:3000/posts/5"];
    NSURL *requestURL = [NSURL URLWithString: str];
    HTTPMethod method = GET;
    Request *testRequest = [[Request alloc] initWithURL:requestURL MethodType:method RequestParameters:nil onComplete:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",jsonResponse);
        NSLog(@"PArty Abdelsalam !!!!!!");
    }];
    
    XCTAssertEqual(testRequest.URL, requestURL, @"Failed to initialise Request with provided URL.");
    XCTAssertEqual(testRequest.Method, method, @"Failed to initialise Request with provided HTTP method.");
    XCTAssertNotNil(testRequest.completionHandler, @"Failed to attach completition handler to request");
}

- (void)testRequestEnqueue{
    
}

- (void)testRequestDequeue{
    
}

- (void)testAPIRequestManagerSessionCreation{
    
}

- (void)testPostRequests {
 
    
}

@end
