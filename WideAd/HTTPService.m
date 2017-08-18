//
//  HTTPService.m
//  WideAdTest-Objc
//
//  Created by Jahid on 8/18/17.
//  Copyright © 2017 Jahid. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService

+ (void)fetchData:(NSString*)urlStr withCompletion:(void(^)(NSDictionary* result))completion {
    
    // Setup the request with URL
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    // Create the URLSession on the default configuration
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    // Convert POST string parameters to data using UTF8 Encoding
    [urlRequest setHTTPMethod:@"GET"];
    
    // Create dataTask
    [[defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        if ([jsonObject[@"status"]  isEqual: @"ok"]) {
            completion(jsonObject);
        }
        
    }] resume];
}

@end
