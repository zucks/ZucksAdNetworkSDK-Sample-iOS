//
//  ZADNRewardedAd.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2020 Zucks, Inc.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZADNRewardedAd;

@protocol ZADNRewardedAdDelegate<NSObject>

@required
- (void)rewardedAdShouldReward:(ZADNRewardedAd *)rewardedAd;

@optional
- (void)rewardedAdDidLoad:(ZADNRewardedAd *)rewardedAd;
- (void)rewardedAd:(ZADNRewardedAd *)rewardedAd didFailToLoadWithError:(NSError *)error;
- (void)rewardedAdWillAppear:(ZADNRewardedAd *)rewardedAd;
- (void)rewardedAdDidAppear:(ZADNRewardedAd *)rewardedAd;
- (void)rewardedAdWillDisappear:(ZADNRewardedAd *)rewardedAd;
- (void)rewardedAdDidDisappear:(ZADNRewardedAd *)rewardedAd;
- (void)rewardedAd:(ZADNRewardedAd *)rewardedAd didFailToPlayWithError:(NSError *)error;

@end

@interface ZADNRewardedAd : NSObject

@property(nonatomic, readonly) NSString *frameId;
@property(nonatomic, weak, nullable) id<ZADNRewardedAdDelegate> delegate;

- (instancetype)initWithFrameId:(NSString *)frameId;
- (void)loadAd;
- (BOOL)isAdAvailable;
- (void)presentAdFromViewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
