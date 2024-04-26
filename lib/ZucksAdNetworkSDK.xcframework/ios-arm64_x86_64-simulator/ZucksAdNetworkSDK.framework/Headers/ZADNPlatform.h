//
//  ZADNPlatform.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZADNPlatformType) {
  ZADNPlatformTypeDefault = 0,
  ZADNPlatformTypeAdmob,
  ZADNPlatformTypeUnity,
  ZADNPlatformTypeCocos2dx
};

@interface ZADNPlatform : NSObject

@property enum ZADNPlatformType zucksPlatformType;
@property(copy, nonatomic) NSString *zucksPlatformVersion;
@property(copy, nonatomic) NSString *bridgeVersion;

- (NSString *)zucksPlatformName;
- (void)reset;

@end
