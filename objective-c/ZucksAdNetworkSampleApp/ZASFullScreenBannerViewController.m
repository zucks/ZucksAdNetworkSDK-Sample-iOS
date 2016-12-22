//
//  ZASFullScreenBannerViewController.m
//  ZucksAdNetworkSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

#import "ZASFullScreenBannerViewController.h"
@import ZucksAdNetworkSDK;

@interface
ZASFullScreenBannerViewController ()<ZADNFullScreenBannerViewDelegate>

@end

@implementation ZASFullScreenBannerViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // 広告表示領域を設定(アプリの状態に合わせて値を変更してください)
  CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame]
  .size.height;
  CGFloat navigationBarHeight =
  self.navigationController.navigationBar.frame.size.height;
  CGFloat headerHeight = statusBarHeight + navigationBarHeight;
  CGRect frame = CGRectMake(0.0, headerHeight, self.view.frame.size.width,
                            self.view.frame.size.height - headerHeight);

  // 広告viewを初期化(<YOUR_FRAME_ID>の部分は管理画面より発行したFrameIDに置き換えてください)
  ZADNFullScreenBannerView *fullScreenBanner =
  [[ZADNFullScreenBannerView alloc] initWithFrame:frame
                                          frameId:@"_4685895172"];
  // コールバックdelegateを設定
  fullScreenBanner.delegate = self;

  // 広告情報のロード開始
  [fullScreenBanner loadAd];

  // 広告viewをメインviewにバインド
  [self.view addSubview:fullScreenBanner];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

// 広告の各イベントで処理を行いたい場合に実装してください(任意)
#pragma mark ZADNFullScreenBannerDelegate Methods
- (void)fullScreenBannerViewDidReceiveAd:
(ZADNFullScreenBannerView *)fullScreenBannerView {
  NSLog(@"広告情報ロード完了");
}

- (void)fullScreenBannerViewDidTapAd:
(ZADNFullScreenBannerView *)fullScreenBannerView {
  NSLog(@"広告タップ");
}

- (void)fullScreenBannerView:(ZADNFullScreenBannerView *)fullScreenBannerView
      didFailAdWithErrorType:(ZADNFullScreenBannerErrorType)errorType {
  NSLog(@"広告情報ロードエラー");
}

@end
