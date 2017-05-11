//
//  HTTPMethod.h
//  NetworkingFirstTrail
//
//  Created by Ahmed Abodeif on 5/9/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#ifndef HTTPMethod_h
#define HTTPMethod_h


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HTTPMethod){
    GET, POST, PUT, DELETE, HEAD
};

extern NSString *HTTPMethodString(HTTPMethod method);

#endif /* HTTPMethod_h */
