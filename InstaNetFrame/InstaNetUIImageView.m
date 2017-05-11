//
//  InstaNetUIImageView.m
//  InstaNetFrame
//
//  Created by Ahmed Abodeif on 5/11/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import "InstaNetUIImageView.h"

@implementation InstaNetUIImageView


- (id)initWithImageRequest :(Request*)request withInstaNetUIImageView:(InstaNetUIImageView*)myImageView ApiManager:(APIRequestManager*)manager {
    self = [super init];
    if (self) {
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [indicator setCenter:myImageView.center];
        [myImageView addSubview:indicator];
        [indicator setHidesWhenStopped:YES];
        [indicator startAnimating];
        request.completionHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

                    //  Image must be set on main queue.
                    dispatch_async(dispatch_get_main_queue(),^{
                        [myImageView setImage:[UIImage imageWithData:data]];
                        [indicator stopAnimating];
                    });
        };
        [manager enqueueRequest:request];
        [manager dequeueRequest];
    }
    return self;
}

@end
