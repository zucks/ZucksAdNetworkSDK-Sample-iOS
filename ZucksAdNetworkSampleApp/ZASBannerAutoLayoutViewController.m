//
//  ZASBannerAutoLayoutViewController.m
//  ZucksAdNetworkSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

#import "ZASBannerAutoLayoutViewController.h"
@import ZucksAdNetworkSDK;

@interface ZASBannerAutoLayoutViewController ()<ZADNBannerViewDelegate>
@end

@implementation ZASBannerAutoLayoutViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

// 広告の各イベントで処理を行いたい場合に実装してください(任意)
#pragma mark ZADNBannerViewDelegate methods
- (void)bannerViewDidReceiveAd:(ZADNBannerView *)bannerView {
  // 広告情報受信完了時
  NSLog(@"広告情報受信完了");
}

- (void)bannerView:(ZADNBannerView *)bannerView
    didFailAdWithErrorType:(ZADNBannerErrorType)errorType {
  // 広告情報受信エラー時
  NSLog(@"広告情報受信エラー エラータイプ=%d", (int)errorType);
}

- (void)bannerViewDidTapAd:(ZADNBannerView *)bannerView {
  // 広告タップ時
  NSLog(@"広告タップ");
}

@end
