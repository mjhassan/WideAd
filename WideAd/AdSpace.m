//
//  AdSpace.m
//  WideAdTest
//
//  Created by Jahid on 8/16/17.
//  Copyright © 2017 Jahid. All rights reserved.
//

#import "AdSpace.h"
#import "HTTPService.h"
#import "Ad.h"

@interface AdSpace () <UIWebViewDelegate> {
    UIWebView *_webview;
}
@end

@implementation AdSpace
@synthesize delegate;

- (void)runAd {
    
    [UIApplication.sharedApplication setNetworkActivityIndicatorVisible:YES];
    
    [HTTPService fetchData:@"http://test72.widespace.com/sdk_masum/ad.json"
            withCompletion:^(NSDictionary *result)
    {
        Ad* ad = [Ad new];
        [ad create:result];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self createWebView:ad];
            [UIApplication.sharedApplication setNetworkActivityIndicatorVisible:YES];
        });
    }];
}

- (void)closeAd {
    if (delegate != nil) {
        [delegate willDismissAd];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self destroyWebView];
        
        if (delegate != nil) {
            [delegate didDismissAd];
        }
    });
}

- (void)createWebView:(Ad*) ad {
    _webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, ad.size.width, ad.size.height)];
    [_webview loadHTMLString:ad.code baseURL:nil];
    _webview.delegate = self;
    [self addSubview:_webview];
    
    _webview.center = self.center;
    
    _webview.autoresizingMask = UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
}

- (void)destroyWebView {
    [_webview stopLoading];
    [_webview setDelegate:nil];
    [_webview removeFromSuperview];
    _webview = nil;
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [[NSURLCache sharedURLCache] setDiskCapacity:0];
    [[NSURLCache sharedURLCache] setMemoryCapacity:0];
}

// UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    if (delegate != nil) {
        [delegate willPresentAd];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (delegate != nil) {
        [delegate didPresentAd];
    }
}

@end
