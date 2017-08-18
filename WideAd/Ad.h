//
//  Ad.h
//  WideAdTest-Objc
//
//  Created by Jahid on 8/18/17.
//  Copyright © 2017 Jahid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Ad : NSObject

@property (nonatomic) CGSize size;
@property (nonatomic, strong) NSString* code;

- (void)create:(NSDictionary*)json;

@end
