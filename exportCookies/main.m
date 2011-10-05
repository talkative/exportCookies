//
//  main.m
//  exportCookies
//
//  Created by Mio Nilsson on 2011-10-05.
//  Copyright (c) 2011 Talkative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CookiesTXT.h"

int main (int argc, const char * argv[]) {
    @autoreleasepool {
        NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        CookiesTXT *cookiesTxt = [[CookiesTXT alloc] init];
        cookiesTxt.cookieArray = [cookieStorage cookies];
        [cookiesTxt print];
    }
    return 0;
}

