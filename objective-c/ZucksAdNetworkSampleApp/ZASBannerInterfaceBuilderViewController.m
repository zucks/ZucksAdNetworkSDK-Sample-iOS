//
//  ZASBannerInterfaceBuilderViewController.h
//  ZucksAdNetworkSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

#import "ZASBannerInterfaceBuilderViewController.h"
@import ZucksAdNetworkSDK;

@interface ZASBannerInterfaceBuilderViewController ()<ZADNBannerViewDelegate>
@end

@implementation ZASBannerInterfaceBuilderViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // ZADNBannerViewの実装はMain.storyboard上で行っています
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

// 広告の各イベントで処理を行いたい場合に実装してください(任意)
#pragma mark ZADNBannerViewDelegate methods
- (void)bannerViewDidReceiveAd:(ZADNBannerView *)bannerView {
  // 広告情報ロード完了時
  NSLog(@"広告情報ロード完了");
}

- (void)bannerView:(ZADNBannerView *)bannerView
    didFailAdWithErrorType:(ZADNBannerErrorType)errorType {
  // 広告情報ロードエラー時
  NSLog(@"広告情報ロードエラー");
}

- (void)bannerViewDidTapAd:(ZADNBannerView *)bannerView {
  // 広告タップ時
  NSLog(@"広告タップ");
}

@end
