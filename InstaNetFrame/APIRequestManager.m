//
//  APIRequestManager.m
//  NetworkingFirstTrail
//
//  Created by Ahmed Abodeif on 5/9/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import "APIRequestManager.h"

@implementation APIRequestManager


+(id) sharedAPIRequestManager {
    static APIRequestManager *sharedAPIRequestManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAPIRequestManager = [[self alloc] init];
    });
    return sharedAPIRequestManager;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.myRequestQueue = [[RequestQueue alloc] init];
        self.RequestsInProgressQueue = [[RequestQueue alloc] init];
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"Ahmed.Abodeif.WIFI.BackgroundSession"];
        //  set Maximum concurrent download tasks. It is 6 while on WIFI.
        sessionConfiguration.HTTPMaximumConnectionsPerHost = 6;
        //  Session allows cellular access to continue downloads that began execution while on wifi.
        sessionConfiguration.allowsCellularAccess = YES;
        self.WIFIBackgroundSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
        
        //  set Maximum concurrent download tasks. It is 2 while on cellular data.
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"Ahmed.Abodeif.Cellular.BackgroundSession"];
        sessionConfig.HTTPMaximumConnectionsPerHost = 2;
        sessionConfig.allowsCellularAccess = YES;
        self.CellularBackgroundSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    }
    return self;
}

- (void)enqueueRequest:(Request *)newRequest{
    [self.myRequestQueue enqueue:newRequest];
}

- (void)dequeueRequest{
    
    if(![self.myRequestQueue isEmpty]){
        Request *newRequest = [self.myRequestQueue dequeue];
        [self.RequestsInProgressQueue enqueue:newRequest];
        [self execute:newRequest];
    }
}

- (void)execute:(Request *)request{
    
    NSMutableURLRequest *APIRequest = [[NSMutableURLRequest alloc] init];
    [APIRequest setURL:request.URL];
    [APIRequest setHTTPMethod:HTTPMethodString(request.Method)];
    
    if(request.Method == POST){
        NSData *postData = [request.postData dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        [APIRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [APIRequest setHTTPBody:postData];
    }
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable)
    {
        //  No internet
        NSLog(@"You are not connected to the internet, cannot start request execution...");
    }
    else if (status == ReachableViaWiFi)
    {
        //  Using Wifi
        //  Data session is created using WIFIBackgroundSession, this ensures that a maximum of
        //  6 concurrent tasks are run at the same time.
        NSURLSessionDownloadTask *downloadTask = [self.WIFIBackgroundSession downloadTaskWithURL:APIRequest.URL];
        request.id = downloadTask.taskIdentifier;
        [downloadTask resume];
    }
    else if (status == ReachableViaWWAN)
    {
        //  Using Cellular data
        //  Data session is created using WIFIBackgroundSession, this ensures that a maximum of
        //  2 concurrent tasks are run at the same time.
        NSURLSessionDownloadTask *downloadTask = [self.CellularBackgroundSession downloadTaskWithURL:APIRequest.URL];
        [downloadTask resume];
    }
}

//  Method called when download is complete.
- (void) URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
    NSData* data = [NSData dataWithContentsOfURL:location];
    int requestIndex = [self.RequestsInProgressQueue getRequestIndex:[downloadTask taskIdentifier]];
    
    //  request completition task is called when download is complete.
    [self.RequestsInProgressQueue requestAtIndex:requestIndex].completionHandler(data, nil, nil);
    [self.RequestsInProgressQueue removeRequestAtIndex:requestIndex];
    
}


- (void) URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
    //  Empty Method.
}


- (void) URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *) downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    //  Empty Method.
}

@end
