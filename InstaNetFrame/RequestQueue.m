//
//  RequestQueue.m
//  NetworkingFirstTrail
//
//  Created by Ahmed Abodeif on 5/10/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import "RequestQueue.h"

@interface RequestQueue()

@property (strong) NSMutableArray *data;

@end

@implementation RequestQueue

-(instancetype)init{
    
    if (self = [super init]){
        _data = [[NSMutableArray alloc] init];
    }
    else {
        NSLog(@"Failed to instantiate RequestQueue");
    }
    return self;
    
}

-(void)enqueue:(id)anObject{
    
    [self.data addObject:anObject];
    
}

-(id)dequeue{
    
    id headObject = [self.data objectAtIndex:0];
    if (headObject != nil) {
        
        [self.data removeObjectAtIndex:0];
        
    }
    return headObject;
}

-(int)getRequestIndex:(NSUInteger)RequestID{
    
    for(int i=0; i<[self.data count]; i++){
        Request* myRequest = (Request*)[self.data objectAtIndex:i];
        if(myRequest.id == RequestID){
            return i;
        }
    }
    return -1;
}

-(Request*)requestAtIndex:(int)index{
    return (Request*)[self.data objectAtIndex:index];
}

-(void)removeRequestAtIndex:(int)index{
    [self.data removeObjectAtIndex:index];
}

-(BOOL) isEmpty{
    if([self.data count] > 0)
    {
        return NO;
    }
    return YES;
}

@end
