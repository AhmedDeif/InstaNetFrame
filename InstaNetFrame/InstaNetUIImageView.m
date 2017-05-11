//
//  InstaNetUIImageView.m
//  InstaNetFrame
//
//  Created by Ahmed Abodeif on 5/11/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import "InstaNetUIImageView.h"

@implementation InstaNetUIImageView



- (id) initWithFrame:(CGRect)frame{
    NSLog(@"hlew");
    self = [super initWithFrame: frame];
    return self;
}
- (id) init {
    self = [super init];
    NSLog(@"now overriding");
    return self;
}

- (id)initWithImageRequest :(Request*)request withInstaNetUIImageView:(InstaNetUIImageView*)myImageView ApiManager:(APIRequestManager*)manager {
    self = [super init];
    if (self) {
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [indicator setCenter:myImageView.center];
        [myImageView addSubview:indicator];
        [indicator startAnimating];
        
        //  I will set the completition handler manually here.
        request.completionHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    dispatch_async(dispatch_get_main_queue(),^{
                        [myImageView setImage:[UIImage imageWithData:data]];
                        NSLog(@"Should have set an image !!! ...");
                    });
        };
        [manager enqueueRequest:request];
        [manager dequeueRequest];
    }
    return self;
    
}

@end
