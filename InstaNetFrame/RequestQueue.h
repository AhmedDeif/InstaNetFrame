//
//  RequestQueue.h
//  NetworkingFirstTrail
//
//  Created by Ahmed Abodeif on 5/10/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"

/**
 *  Class to extend NSMutuable array to simulate a queue.
 */
@interface RequestQueue : NSObject

/**
 *  Enqueue new request to queue.
 */
-(void)enqueue:(id)anObject;

/**
 *  Dequeque request from queue.
 */
-(id)dequeue;

/**
 *  Serach queue to find object with same ID as passed ID and returns index
 *  of object in array  or -1 if noy found.
 */
-(int)getRequestIndex:(NSUInteger)Request;

/**
 *  Returns Request pointer of a request in request queue with the provided index.
 */
-(Request*)requestAtIndex:(int)index;

/**
 *  Returns True if queue is empty and False otherwise.
 */
-(BOOL)isEmpty;

/**
 *  Remove Request at provided index from queue.
 */
-(void)removeRequestAtIndex:(int)index;

@end
