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

/**
 *  Called to allow InstaNetUIImageView to downlaod image and update image 
 *  of InstaNetUIImageView on completition.
 *  A loading indicator is animated while the image is downloading.
 */
- (id)initWithImageRequest :(Request*)request withInstaNetUIImageView:(InstaNetUIImageView*)myImageView ApiManager:(APIRequestManager*)manager;

@end
