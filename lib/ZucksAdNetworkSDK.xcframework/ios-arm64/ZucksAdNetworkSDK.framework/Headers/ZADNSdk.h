//
//  ZADNSdk.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import <Foundation/Foundation.h>

@interface ZADNSdk : NSObject

+ (instancetype)sharedInstance;
+ (void)setDebug:(BOOL)isDebug;
+ (BOOL)isDebug;

- (instancetype)init __attribute__((unavailable("init is not available")));

@end
