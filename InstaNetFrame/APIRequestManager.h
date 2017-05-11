//
//  APIRequestManager.h
//  NetworkingFirstTrail
//
//  Created by Ahmed Abodeif on 5/9/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"
#import "Reachability.h"
#import "RequestQueue.h"

@interface APIRequestManager : NSObject <NSURLSessionTaskDelegate,NSURLSessionDownloadDelegate, NSURLSessionDataDelegate>{
}

@property (nonatomic) RequestQueue *myRequestQueue;
@property (nonatomic) RequestQueue *RequestsInProgressQueue;
@property (nonatomic) NSURLSession *WIFIBackgroundSession;
@property (nonatomic) NSURLSession *CellularBackgroundSession;

+(id) sharedAPIRequestManager;
-(id) init;
-(void)enqueueRequest:(Request *)newRequest;
-(void)dequeueRequest;

@end

