//
//  ZADNFullScreenBannerView.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import <UIKit/UIKit.h>
#import "ZADNPlatform.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ZADNFullScreenBannerViewDelegate;

typedef NS_ENUM(NSInteger, ZADNFullScreenBannerErrorType) {
    ZADNFullScreenBannerErrorTypeOffline = 1,       // オフライン
    ZADNFullScreenBannerErrorTypeFrameIdUndefined,  // frameIDエラー
    ZADNFullScreenBannerErrorTypeSizeError,         // サイズエラー
    ZADNFullScreenBannerErrorTypeAdOutOfStock,      // 在庫切れ
    ZADNFullScreenBannerErrorTypeOtherError         // その他エラー
};

@interface ZADNFullScreenBannerView : UIView

@property(nullable, copy, nonatomic) IBInspectable NSString *frameId;
@property(nullable, weak, nonatomic)
    IBOutlet id<ZADNFullScreenBannerViewDelegate> delegate;
@property(nonatomic) ZADNPlatform *zucksPlatform;

- (instancetype)initWithFrame:(CGRect)frame frameId:(NSString *)frameId;
- (void)loadAd;

- (id)init __attribute__((unavailable("init is not available")));
- (id)initWithFrame:(CGRect)frame
    __attribute__((unavailable("init is not available")));

@end

@protocol ZADNFullScreenBannerViewDelegate<NSObject>
@optional

- (void)fullScreenBannerViewDidReceiveAd:
        (ZADNFullScreenBannerView *)fullScreenBannerView;
- (void)fullScreenBannerView:(ZADNFullScreenBannerView *)fullScreenBannerView
      didFailAdWithErrorType:(ZADNFullScreenBannerErrorType)errorType;
- (void)fullScreenBannerViewDidTapAd:
        (ZADNFullScreenBannerView *)fullScreenBannerView;

@end
NS_ASSUME_NONNULL_END
