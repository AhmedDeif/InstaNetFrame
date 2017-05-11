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

@property (nonatomic) HTTPMethod Method;
@property (nonatomic) NSURL *URL;
@property (nonatomic) NSDictionary *parameters;
@property (nonatomic) NSUInteger id;
@property (nonatomic, copy) void (^completionHandler)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error);

-(Request*) initWithURL:(NSURL*)withURL MethodType:(HTTPMethod)method RequestParameters:(NSDictionary*)parameters onComplete:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionBlock;
-(Request*) initWithURL:(NSURL*)withURL;
-(Request*) initWithURL:(NSURL*)withURL MethodType:(HTTPMethod)method;
-(Request*) initWithURL:(NSURL*)withURL MethodType:(HTTPMethod)method RequestParameters:(NSDictionary*)parameters;



@end
