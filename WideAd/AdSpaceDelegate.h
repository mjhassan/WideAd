//
//  AdSpaceDelegate.h
//  WideAdTest
//
//  Created by Jahid on 8/16/17.
//  Copyright © 2017 Jahid. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AdSpaceDelegate

- (void)willPresentAd;
- (void)didPresentAd;
- (void)willDismissAd;
- (void)didDismissAd;

@end
