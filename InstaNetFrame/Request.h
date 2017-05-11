//
//  Request.h
//  NetworkingFirstTrail
//
//  Created by Ahmed Abodeif on 5/9/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPMethod.h"

@interface Request : NSObject

/**
 *  Enum value specifiying the request's HTTP method.
 */
@property (nonatomic) HTTPMethod Method;

/**
 *  Mutuable URL holding address.
 */
@property (nonatomic) NSURL* _Nonnull URL;

/**
 *  Dictionary of request parameters. Nullable as some requests do not require params.
 */
@property (nonatomic) NSDictionary* _Nullable parameters;

/**
 *  data to be posted to server. Only set when using HTTP POST method.
 */
@property (nonatomic) NSString* _Nullable postData;

/**
 *  Request ID is equivilant to download task identifier.
 */
@property (nonatomic) NSUInteger id;

/**
 *  Pointer to point at Request completition handler. Completition handler is
 *  executed after the download task finishes execution.
 */
@property (nonatomic, copy) void (^ _Nullable completionHandler)(NSData* _Nullable data, NSURLResponse* _Nullable response, NSError* _Nullable error);

/**
 *  Request constructor for requests with POST HTTP method. Completition handler is code
 *  block executed when the downloadTask finishes. It acts as a callback function to the
 *  the request enquequer. POST request data must be set.
 */
- (Request* _Nonnull) initWithURL:(NSURL* _Nonnull)withURL MethodType:(HTTPMethod)method PostRequestData:(NSString* _Nonnull)postData onComplete:(void (^ _Nullable)(NSData* _Nullable data, NSURLResponse* _Nullable response, NSError* _Nullable error))completionBlock;

/**
 *  Request constructor for requests with GET HTTP method. Completition handler is code
 *  block executed when the downloadTask finishes. It acts as a callback function to the
 *  the request enquequer.
 */
- (Request* _Nonnull) initWithURL:(NSURL* _Nonnull)withURL MethodType:(HTTPMethod)method RequestParameters:(NSDictionary* _Nullable)parameters onComplete:(void (^ _Nullable)(NSData* _Nullable data, NSURLResponse* _Nullable response, NSError* _Nullable error))completionBlock;

- (Request* _Nonnull) initWithURL:(NSURL* _Nonnull)withURL;

- (Request* _Nonnull) initWithURL:(NSURL* _Nonnull)withURL MethodType:(HTTPMethod)method;

- (Request* _Nonnull) initWithURL:(NSURL* _Nonnull)withURL MethodType:(HTTPMethod)method RequestParameters:(NSDictionary* _Nullable)parameters;

@end
