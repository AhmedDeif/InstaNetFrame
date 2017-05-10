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
@property (nonatomic) int id;

-(Request*) initWithURL:(NSURL*)withURL;
-(Request*) initWithURL:(NSURL*)withURL MethodType:(HTTPMethod)method;
-(Request*) initWithURL:(NSURL*)withURL MethodType:(HTTPMethod)method RequestParameters:(NSDictionary*)parameters;

@end
