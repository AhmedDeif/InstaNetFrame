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

-(Request*) initWithURL:(NSURL*)withURL MethodType:(HTTPMethod)method RequestParameters:(NSDictionary*)params onComplete:(void (^)(void))completionBlock {
    self = [super init];
    
    if(self) {
        self.URL = withURL;
        self.Method = method;
        self.parameters = params;
        self.completionHandler = [completionBlock copy];
    }
    else {
        NSLog(@"Error, Request Object not initialised !!!");
    }
    return self;
    
    
}




@end
