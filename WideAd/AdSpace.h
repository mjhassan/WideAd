//
//  AdSpace.h
//  WideAdTest
//
//  Created by Jahid on 8/16/17.
//  Copyright © 2017 Jahid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdSpaceDelegate.h"

@interface AdSpace : UIView <UIWebViewDelegate>

@property (weak, nonatomic) id<AdSpaceDelegate> delegate;

- (void)runAd;
- (void)closeAd;

@end
