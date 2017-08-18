//
//  HTTPService.h
//  WideAdTest-Objc
//
//  Created by Jahid on 8/18/17.
//  Copyright © 2017 Jahid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPService : NSObject
+ (void)fetchData:(NSString*)urlStr withCompletion:(void(^)(NSDictionary* result))completion;
@end
