//
//  Ad.m
//  WideAdTest-Objc
//
//  Created by Jahid on 8/18/17.
//  Copyright © 2017 Jahid. All rights reserved.
//

#import "Ad.h"

@implementation Ad
@synthesize size;
@synthesize code;

-(id)init{
    self = [super init];
    
    if(self){
        size = CGSizeZero;
        code = @"";
    }
    
    return self;
}

- (void)create:(NSDictionary*)json {
    if (json) {
        size = [self makeSize: json[@"size"]];
        code = json[@"code"];
    }
}

- (CGSize)makeSize:(NSDictionary*)szDic {
    CGFloat width = [szDic[@"width"] stringByReplacingOccurrencesOfString:@"px" withString:@""].floatValue;
    CGFloat height = [szDic[@"height"] stringByReplacingOccurrencesOfString:@"px" withString:@""].floatValue;
    
    return  CGSizeMake(width, height);
}

@end
