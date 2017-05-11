//
//  Request.m
//  NetworkingFirstTrail
//
//  Created by Ahmed Abodeif on 5/9/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import "Request.h"
#import "HTTPMethod.h"

@implementation Request

@synthesize Method;
@synthesize URL;
@synthesize parameters;
@synthesize id;



-(Request*) initWithURL:(NSURL*)withURL {
    self = [super init];
    if (self) {
        self.Method = GET;
        self.URL = withURL;
        self.parameters = nil;
    }
    return self;
}

-(Request*) initWithURL:(NSURL*)withURL MethodType:(HTTPMethod)method{
    self = [super init];
    if(self) {
        self.URL = withURL;
        self.Method = method;
        self.parameters = nil;
    }
    else {
        NSLog(@"Error, Request Object not initialised !!!");
    }
    return self;
}

-(Request*) initWithURL:(NSURL*)withURL MethodType:(HTTPMethod)method RequestParameters:(NSDictionary*)params{
    self = [super init];
    if(self) {
        self.URL = withURL;
        self.Method = method;
        self.parameters = params;
    }
    else {
        NSLog(@"Error, Request Object not initialised !!!");
    }
    return self;
}

-(Request*) initWithURL:(NSURL*)withURL MethodType:(HTTPMethod)method RequestParameters:(NSDictionary*)params onComplete:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionBlock{
    self = [super init];
    
    if(self) {
        self.URL = withURL;
        self.Method = GET;
        self.parameters = params;
        self.postData = nil;
        self.completionHandler = [completionBlock copy];
    }
    else {
        NSLog(@"Error, Request Object not initialised !!!");
    }
    return self;
}

-(Request*) initWithURL:(NSURL*)withURL MethodType:(HTTPMethod)method PostRequestData:(NSString*)postData onComplete:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionBlock{
    if(self) {
        self.URL = withURL;
        self.Method = POST;
        self.parameters = nil;
        self.postData = postData;
        self.completionHandler = [completionBlock copy];
    }
    else {
        NSLog(@"Error, Request Object not initialised !!!");
    }
    return self;

}




@end
