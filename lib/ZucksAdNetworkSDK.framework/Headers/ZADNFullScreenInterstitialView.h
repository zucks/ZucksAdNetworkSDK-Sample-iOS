//
//  ZADNFullScreenInterstitialView.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import "ZADNPlatform.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ZADNFullScreenInterstitialViewDelegate;

typedef NS_ENUM(NSInteger, ZADNFullScreenInterstitialLoadErrorType) {
  ZADNFullScreenInterstitialLoadErrorTypeOffline = 1,  // オフライン
  ZADNFullScreenInterstitialLoadErrorTypeFrameIdUndefined,  // frameIDエラー
  ZADNFullScreenInterstitialLoadErrorTypeAdOutOfStock,  // 在庫切れ
  ZADNFullScreenInterstitialLoadErrorTypeOtherError  // その他エラー
};

typedef NS_ENUM(NSInteger, ZADNFullScreenInterstitialShowErrorType) {
  ZADNFullScreenInterstitialShowErrorTypeOffline = 1,  // オフライン
  ZADNFullScreenInterstitialShowErrorTypeNoAdData,  // 広告情報未取得
  ZADNFullScreenInterstitialShowErrorTypeLoading,  // 広告情報ロード中
  ZADNFullScreenInterstitialShowErrorTypeAlreadyShowing,  // 広告表示中
  ZADNFullScreenInterstitialShowErrorTypeOtherError  // その他エラー
};

@interface ZADNFullScreenInterstitialView : UIView

@property(nullable, copy, nonatomic) NSString *frameId;
@property(nullable, weak, nonatomic) id<ZADNFullScreenInterstitialViewDelegate> delegate;
@property(nonatomic) ZADNPlatform *zucksPlatform;

+ (instancetype)sharedInstance;
- (void)loadAd;
- (void)show;
- (void)dismiss;

- (id)initWithFrame:(CGRect)frame
    __attribute__((unavailable("initWithFrame is not available")));

@end

@protocol ZADNFullScreenInterstitialViewDelegate<NSObject>
@optional

- (void)fullScreenInterstitialViewDidReceiveAd;
- (void)fullScreenInterstitialViewDidLoadFailAdWithErrorType:
        (ZADNFullScreenInterstitialLoadErrorType)errorType;
- (void)fullScreenInterstitialViewDidShowAd;
- (void)fullScreenInterstitialViewDidShowFailAdWithErrorType:
        (ZADNFullScreenInterstitialShowErrorType)errorType;
- (void)fullScreenInterstitialViewCancelDisplayRate;
- (void)fullScreenInterstitialViewDidTapAd;
- (void)fullScreenInterstitialViewDidDismissAd;

@end
NS_ASSUME_NONNULL_END
