//
//  TickerRequest.m
//  DSObjCKitDemo
//
//  Created by Dragon Sun on 2017/12/31.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "TickerRequest.h"

@implementation TickerRequest {
    NSString *_symbol;
}

- (instancetype)initWithSymbol:(NSString *)symbol {
    if (self = [super init]) {
        _symbol = symbol;
    }
    
    return self;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (NSString *)requestUrl {
    return @"ticker.do";
}

- (id)requestArgument {
    return @{
             @"symbol": _symbol
    };
}

- (id)jsonValidator {
    return @{
             @"date": [NSString class],
             @"ticker": @{
                     @"buy": [NSString class],
                     @"sell": [NSString class],
                     @"high": [NSString class],
                     @"low": [NSString class],
                     @"vol": [NSString class],
                     @"last": [NSString class]
                     }
    };
}

@end
