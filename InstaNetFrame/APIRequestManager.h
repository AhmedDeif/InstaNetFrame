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

/**
 *  APIRequestManager implemements the following delegates
 *  <NSURLSessionTaskDelegate,NSURLSessionDownloadDelegate, NSURLSessionDataDelegate>
 *  to enable background downloads.
 */
@interface APIRequestManager : NSObject <NSURLSessionTaskDelegate,NSURLSessionDownloadDelegate, NSURLSessionDataDelegate>{
}

/**
 *  RequestQueue to hold requests passed to APIRequestManager.
 */
@property (nonatomic) RequestQueue *myRequestQueue;

/**
 *  Queue to hold requests that have been passed for execution.
 */
@property (nonatomic) RequestQueue *RequestsInProgressQueue;

/**
 *  Background Session handling download tasks while on WIFI.
 */
@property (nonatomic) NSURLSession *WIFIBackgroundSession;

/**
 *  Background Session handling download tasks while on Cellular data.
 */
@property (nonatomic) NSURLSession *CellularBackgroundSession;

/**
 *  Singleton APIRequestManager. Only one request manager is initialised
 *  and used through out the program.
 */
+ (id) sharedAPIRequestManager;

/**
 *  APIRequestManager initialisation function.
 */
- (id) init;

/**
 *  Add new request to requestQueue for execution later.
 */
- (void)enqueueRequest:(Request *)newRequest;

/**
 *  remove request form requestQueue and pass to execution function.
 */
- (void)dequeueRequest;

/**
 *  Begin execution of request. MutuableURLRequest is created and configured.
 *  If request HTTP method is post, post data length is calculated and added to URL. 
 *  Reachibilty of network is checked, if no internet connection is detected then request is not executed,
 *  case on cellular data then task created using CellularBackgroundSession, case wifi then create 
 *  task using WIFIBackgroundSession.
 */
- (void)execute:(Request *)request;

@end

