//
//  ZADNBannerView.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import <UIKit/UIKit.h>
#import "ZADNPlatform.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ZADNBannerViewDelegate;

typedef NS_ENUM(NSInteger, ZADNBannerErrorType) {
    ZADNBannerErrorTypeOffline = 1,       // オフライン
    ZADNBannerErrorTypeFrameIdUndefined,  // frameIDエラー
    ZADNBannerErrorTypeSizeError,         // サイズエラー
    ZADNBannerErrorTypeOtherError         // その他エラー
};

@interface ZADNBannerView : UIView

@property(nullable, copy, nonatomic) IBInspectable NSString *frameId;
@property(nullable, weak, nonatomic)
    IBOutlet id<ZADNBannerViewDelegate> delegate;
@property(nonatomic) ZADNPlatform *zucksPlatform;

+ (CGSize)adjustedBannerSize:(CGSize)baseSize;

- (instancetype)initWithFrame:(CGRect)frame
                      frameId:(NSString *)frameId
                   sizeAdjust:(BOOL)sizeAdjust;
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
NS_ASSUME_NONNULL_END
