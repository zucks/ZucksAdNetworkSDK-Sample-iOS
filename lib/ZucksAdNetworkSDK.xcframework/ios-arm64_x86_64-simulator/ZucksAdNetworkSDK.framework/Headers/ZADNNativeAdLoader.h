//
//  ZADNNativeAdLoader.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import "ZADNPlatform.h"
#import "ZADNNativeAd.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZADNNativeAdErrorType) {
  ZADNNativeAdErrorTypeOffline = 1,       // オフライン
  ZADNNativeAdErrorTypeFrameIdUndefined,  // frameIDエラー
  ZADNNativeAdErrorTypeAdOutOfStock,      // 在庫切れ
  ZADNNativeAdErrorTypeOtherError         // その他エラー
};

typedef void (^ZADNNativeAdLoaderCompletionBlock)(
    ZADNNativeAd *_Nullable nativeAd, NSError *_Nullable error);

@interface ZADNNativeAdLoader : NSObject

@property(nullable, copy, nonatomic) IBInspectable NSString *frameId;
@property(nonatomic) ZADNPlatform *zucksPlatform;

- (instancetype)initWithFrameId:(NSString *)frameId;
- (void)loadAdWithCompletionHandler:(ZADNNativeAdLoaderCompletionBlock)block;

- (id)init __attribute__((unavailable("init is not available")));

@end
NS_ASSUME_NONNULL_END
