//
//  RequestQueue.h
//  NetworkingFirstTrail
//
//  Created by Ahmed Abodeif on 5/10/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"

@interface RequestQueue : NSObject

-(void)enqueue:(id)anObject;
-(id)dequeue;
-(int)getRequestIndex:(NSUInteger)Request;
-(Request*)requestAtIndex:(int)index;
-(BOOL)isEmpty;


@end
