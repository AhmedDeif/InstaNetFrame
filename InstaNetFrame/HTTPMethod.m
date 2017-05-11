//
//  HTTPMethod.m
//  NetworkingFirstTrail
//
//  Created by Ahmed Abodeif on 5/9/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//


#import "HTTPMethod.h"

NSString *HTTPMethodString(HTTPMethod method) {
    NSLog(@"dowa el method");
    
    switch (method) {
        case GET:       NSLog(@"GET Request"); return @"GET";
        case POST:      NSLog(@"POST Request"); return @"POST";
        case PUT:       NSLog(@"PUT Request"); return @"PUT";
        case DELETE:    NSLog(@"DELETE Request"); return @"DELETE";
        case HEAD:      NSLog(@"HEAD Request"); return @"HEAD";
        default:        NSLog(@"ERROR !!!"); return nil;
    }
}
