//
//  InstaNetUIImageView.h
//  InstaNetFrame
//
//  Created by Ahmed Abodeif on 5/11/17.
//  Copyright © 2017 Ahmed Abodeif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Request.h"
#import "APIRequestManager.h"

@interface InstaNetUIImageView : UIImageView

- (id)initWithImageRequest :(Request*)request withInstaNetUIImageView:(InstaNetUIImageView*)myImageView ApiManager:(APIRequestManager*)manager;

@end
