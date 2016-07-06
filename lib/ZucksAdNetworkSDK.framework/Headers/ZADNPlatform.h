//
//  ZADNPlatform.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZADNPlatformType) {
    ZADNPlatformTypeDefault = 0, ZADNPlatformTypeAdmob, ZADNPlatformTypeUnity};

@interface ZADNPlatform : NSObject

@property enum ZADNPlatformType platformType;
@property(copy, nonatomic) NSString *platformVersion;
@property(copy, nonatomic) NSString *bridgeVersion;

- (NSString *)platformName;
- (void)reset;

@end
