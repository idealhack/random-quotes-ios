//
//  Quote.m
//  RandomQuotes
//
//  Created by idealhack on 2/20/14.
//  Copyright (c) 2014 idealhack. All rights reserved.
//

#import "Quote.h"
#import "AFHTTPRequestOperationManager.h"

static NSString * const RandomQuotesAPIBaseURLString = @"http://random-quotes.herokuapp.com/";

@implementation Quote

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }

    self.body = [attributes valueForKeyPath:@"body"];
    self.author = [attributes valueForKeyPath:@"author"];
    self.source = [attributes valueForKeyPath:@"source"];

    return self;
}

- (void)getQuote:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
{
    SHOW_NETWORK_INDICATOR

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:RandomQuotesAPIBaseURLString
      parameters:nil
         success:success
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             HIDE_NETWORK_INDICATOR
             NSLog(@"Error: %@", error);
    }];
}

@end
