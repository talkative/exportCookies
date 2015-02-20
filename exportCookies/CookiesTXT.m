//
//  CookiesTXT.m
//  exportCookies
//
//  Created by Mio Nilsson on 2011-10-05.
//  Copyright (c) 2011 Talkative. All rights reserved.
//

#import "CookiesTXT.h"

@implementation CookiesTXT

@synthesize cookieArray;

- (void) print {
    for (NSHTTPCookie *cookie in self.cookieArray) {
        NSMutableArray *entry = [NSMutableArray arrayWithCapacity:8];
        [entry addObject:[cookie domain]];
        [entry addObject:@"TRUE"];
        [entry addObject:[cookie path]];
        [entry addObject:@"FALSE"];
        [entry addObject:[NSString stringWithFormat:@"%.0f", [[cookie expiresDate] timeIntervalSince1970]]];
        [entry addObject:[cookie name]];
        [entry addObject:[cookie value]];
        NSString *str = [[entry componentsJoinedByString:@"\t"] stringByAppendingString:@"\n"];
        printf("%s", [str UTF8String]);
    }
}

@end
