//
//  HTTPMethod.m
//  NetworkingFirstTrail
//
//  Created by Ahmed Abodeif on 5/9/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//


#import "HTTPMethod.h"

NSString *HTTPMethodString(HTTPMethod method) {
    switch (method) {
        case GET:      return @"GET";
        case POST:     return @"POST";
        case PUT:      return @"PUT";
        case DELETE:   return @"DELETE";
        case HEAD:     return @"HEAD";
        default:       return nil;
    }
}
