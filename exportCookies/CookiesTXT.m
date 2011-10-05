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

- (NSString *) entryFromArray:(NSArray *)arr {
    return [arr componentsJoinedByString:@"\t"];
}

- (void) appendEntry:(NSString *)entry toTxt:(NSString **)txt {
    *txt = [*txt stringByAppendingString:[entry stringByAppendingString:@"\n"]];
}

- (void) print {
    NSString *txt = @"";
    for (NSHTTPCookie *cookie in self.cookieArray) {
        NSMutableArray *entry = [NSMutableArray arrayWithCapacity:8];
        [entry addObject:[cookie domain]];
        [entry addObject:@"TRUE"];
        [entry addObject:[cookie path]];
        [entry addObject:@"FALSE"];
        [entry addObject:[NSString stringWithFormat:@"%.0f", [[cookie expiresDate] timeIntervalSince1970]]];
        [entry addObject:[cookie name]];
        [entry addObject:[cookie value]];
        [self appendEntry:[self entryFromArray:entry] toTxt:&txt];
    }
    if (txt) {
        printf("%s", [txt UTF8String]);
    }
}

@end
