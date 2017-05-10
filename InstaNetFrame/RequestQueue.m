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

-(BOOL) isEmpty{
    if([self.data count] > 0)
    {
        return NO;
    }
    return YES;
}

@end
