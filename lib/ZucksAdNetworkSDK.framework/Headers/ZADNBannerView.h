//
//  ZADNBannerView.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import <UIKit/UIKit.h>

@protocol ZADNBannerViewDelegate;

typedef NS_ENUM(NSInteger, ZADNBannerErrorType) {
    ZADNBannerErrorTypeOffline = 1,       // オフライン
    ZADNBannerErrorTypeFrameIdUndefined,  // frameIDエラー
    ZADNBannerErrorTypeSizeError,         // サイズエラー
    ZADNBannerErrorTypeOtherError         // その他エラー
};

@interface ZADNBannerView : UIView

@property(copy, nonatomic) NSString *frameId;
@property(weak, nonatomic) IBOutlet id<ZADNBannerViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame frameId:(NSString *)frameId;
- (void)loadAd;

- (id)init __attribute__((unavailable("init is not available")));
- (id)initWithFrame:(CGRect)frame
    __attribute__((unavailable("init is not available")));

@end

@protocol ZADNBannerViewDelegate<NSObject>
@optional

- (void)bannerViewDidReceiveAd:(ZADNBannerView *)bannerView;
- (void)bannerView:(ZADNBannerView *)bannerView
    didFailAdWithErrorType:(ZADNBannerErrorType)errorType;
- (void)bannerViewDidTapAd:(ZADNBannerView *)bannerView;

@end