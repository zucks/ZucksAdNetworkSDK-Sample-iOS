//
//  ZASFullScreenInterstitialViewController.m
//  ZucksAdNetworkSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

#import "ZASFullScreenInterstitialViewController.h"
@import ZucksAdNetworkSDK;

@interface ZASFullScreenInterstitialViewController ()<
ZADNFullScreenInterstitialViewDelegate>

@end

@implementation ZASFullScreenInterstitialViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // インタースティシャル広告のframeID設定(設定されているframeIdはサンプル広告表示用です)
  [ZADNFullScreenInterstitialView sharedInstance].frameId = @"_2b78d82a34";
  // コールバック通知先設定
  [ZADNFullScreenInterstitialView sharedInstance].delegate = self;
  // 広告情報ロード開始
  [[ZADNFullScreenInterstitialView sharedInstance] loadAd];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

// statusbarを非表示にする
- (BOOL)prefersStatusBarHidden {
  return YES;
}

- (IBAction)showButtonDidPush:(id)sender {
  [[ZADNFullScreenInterstitialView sharedInstance] show];
}

#pragma mark - ZADNFullScreenInterstitialViewDelegate methods
- (void)fullScreenInterstitialViewDidReceiveAd {
  NSLog(@"広告情報ロード完了");
}
- (void)fullScreenInterstitialViewDidLoadFailAdWithErrorType:
(ZADNFullScreenInterstitialLoadErrorType)errorType {
  NSLog(@"広告情報ロードエラー");
}
- (void)fullScreenInterstitialViewDidShowAd {
  NSLog(@"広告表示");
}
- (void)fullScreenInterstitialViewDidTapAd {
  NSLog(@"広告タップ");
}
- (void)fullScreenInterstitialViewDidDismissAd {
  NSLog(@"広告クローズ");
  [[ZADNFullScreenInterstitialView sharedInstance] loadAd];
}
- (void)fullScreenInterstitialViewCancelDisplayRate {
  NSLog(@"表示率キャンセル");
}
- (void)fullScreenInterstitialViewDidShowFailAdWithErrorType:
(ZADNFullScreenInterstitialShowErrorType)errorType {
  NSLog(@"広告表示エラー");
  [[ZADNFullScreenInterstitialView sharedInstance] loadAd];
}

@end
