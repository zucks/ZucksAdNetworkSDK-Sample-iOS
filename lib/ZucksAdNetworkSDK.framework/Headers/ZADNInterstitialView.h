//
//  ZADNInterstitialView.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import "ZADNPlatform.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ZADNInterstitialViewDelegate;

typedef NS_ENUM(NSInteger, ZADNInterstitialLoadErrorType) {
  ZADNInterstitialLoadErrorTypeOffline = 1,       // オフライン
  ZADNInterstitialLoadErrorTypeFrameIdUndefined,  // frameIDエラー
  ZADNInterstitialLoadErrorTypeOtherError         // その他エラー
};

typedef NS_ENUM(NSInteger, ZADNInterstitialShowErrorType) {
  ZADNInterstitialShowErrorTypeOffline = 1,     // オフライン
  ZADNInterstitialShowErrorTypeNoAdData,        // 広告情報未取得
  ZADNInterstitialShowErrorTypeLoading,         // 広告情報ロード中
  ZADNInterstitialShowErrorTypeAlreadyShowing,  // 広告表示中
  ZADNInterstitialShowErrorTypeOtherError       // その他エラー
};

@interface ZADNInterstitialView : UIView

@property(nullable, copy, nonatomic) NSString *frameId;
@property(nullable, weak, nonatomic) id<ZADNInterstitialViewDelegate> delegate;
@property(nonatomic) ZADNPlatform *zucksPlatform;

+ (instancetype)sharedInstance;
- (void)loadAd;
- (void)show;
- (void)dismiss;

- (id)initWithFrame:(CGRect)frame
    __attribute__((unavailable("initWithFrame is not available")));

@end

@protocol ZADNInterstitialViewDelegate<NSObject>
@optional

- (void)interstitialViewDidReceiveAd;
- (void)interstitialViewDidLoadFailAdWithErrorType:
        (ZADNInterstitialLoadErrorType)errorType;
- (void)interstitialViewDidShowAd;
- (void)interstitialViewDidShowFailAdWithErrorType:
        (ZADNInterstitialShowErrorType)errorType;
- (void)interstitialViewCancelDisplayRate;
- (void)interstitialViewDidTapAd;
- (void)interstitialViewDidDismissAd;

@end
NS_ASSUME_NONNULL_END
