//
//  ZADNNativeAd.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ZADNNativeAdDelegate;

@interface ZADNNativeAd : NSObject

@property(nullable, weak, nonatomic) IBOutlet id<ZADNNativeAdDelegate> delegate;
@property(nullable, nonatomic, readonly) NSURL *imageUrl;
@property(nonatomic, readonly) CGSize imageSize;
@property(nullable, nonatomic, readonly) NSString *title;
@property(nullable, nonatomic, readonly) NSString *bodyText;
@property(nullable, nonatomic, readonly) NSString *productName;
@property(nullable, nonatomic, readonly) NSString *advertiserName;
@property(nullable, nonatomic, readonly) NSString *linkButtonText;

- (void)apply:(UIView *)adView;

- (id)init __attribute__((unavailable("init is not available")));

@end

@protocol ZADNNativeAdDelegate<NSObject>
@optional

- (void)nativeAdDidTapAd:(ZADNNativeAd *)nativeAd;

@end
NS_ASSUME_NONNULL_END
