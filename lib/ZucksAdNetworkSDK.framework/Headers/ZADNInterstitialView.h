//
//  ZADNInterstitialView.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import <UIKit/UIKit.h>
#import "ZADNPlatform.h"

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

@property(copy, nonatomic) NSString *frameId;
@property(weak, nonatomic) id<ZADNInterstitialViewDelegate> delegate;
@property(nonatomic) ZADNPlatform *platform;

+ (instancetype)sharedInstance;
- (void)loadAd;
- (void)show;

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