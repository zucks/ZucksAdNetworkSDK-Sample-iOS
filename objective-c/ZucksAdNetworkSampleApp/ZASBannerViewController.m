//
//  ZASBannerViewController.m
//  ZucksAdNetworkSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

#import "ZASBannerViewController.h"
@import ZucksAdNetworkSDK;

@interface ZASBannerViewController ()<ZADNBannerViewDelegate>
@end

@implementation ZASBannerViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // 画面下部にバナーを配置
  CGSize bannerSize = CGSizeMake(320.0, 50.0);
  CGFloat x = (self.view.frame.size.width - bannerSize.width) / 2.0;
  CGFloat y = self.view.frame.size.height - bannerSize.height;
  CGRect frame = CGRectMake(x, y, bannerSize.width, bannerSize.height);

  // 広告viewを初期化(設定されているframeIdはサンプル広告表示用です)
  ZADNBannerView *bannerView =
      [[ZADNBannerView alloc] initWithFrame:frame frameId:@"_1d8ba78682"];
  // コールバックdelegateを設定
  bannerView.delegate = self;
  // 広告情報ロード開始
  [bannerView loadAd];
  // 広告viewをメインviewにバインド
  [self.view addSubview:bannerView];
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
