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

/**
 *  defines HTTP 1.1 methods.
 *  Note: Only GET and POST are implemented by the framework.
 */
typedef NS_ENUM(NSUInteger, HTTPMethod){
    GET, POST, PUT, DELETE, HEAD
};

/**
 *  returns a string corresponding to the HTTPMethod passed.
 */
extern NSString *HTTPMethodString(HTTPMethod method);

#endif
