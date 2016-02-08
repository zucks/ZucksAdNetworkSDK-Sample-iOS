//
//  ZASInterstitialViewController.m
//  ZucksAdNetworkSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

#import "ZASInterstitialViewController.h"
@import ZucksAdNetworkSDK;

@interface ZASInterstitialViewController ()<ZADNInterstitialViewDelegate>

@property(weak, nonatomic) IBOutlet UIButton *showButton;

@end

@implementation ZASInterstitialViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // インタースティシャル広告のframeID設定(設定されているframeIdはサンプル広告表示用です)
  [ZADNInterstitialView sharedInstance].frameId = @"_3e64b0843b";
  // コールバック通知先設定
  [ZADNInterstitialView sharedInstance].delegate = self;
  // 広告情報受信開始
  [[ZADNInterstitialView sharedInstance] loadAd];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (IBAction)showButtonDidPush:(id)sender {
  // 広告表示
  [[ZADNInterstitialView sharedInstance] show];
}

// 広告の各イベントで処理を行いたい場合に実装してください(任意)
#pragma mark ZADNInterstitialViewDelegate methods
- (void)interstitialViewDidReceiveAd {
  // 広告情報受信完了時
  NSLog(@"広告情報受信完了");
}

- (void)interstitialViewDidDismissAd {
  // 広告クローズ時
  NSLog(@"広告クローズ");
  // 広告読み込み開始(再度広告表示を行いたい場合)
  [[ZADNInterstitialView sharedInstance] loadAd];
}

- (void)interstitialViewDidLoadFailAdWithErrorType:
            (ZADNInterstitialLoadErrorType)errorType {
  // 広告情報受信エラー時
  NSLog(@"広告情報受信エラー エラータイプ=%d", (int)errorType);
}

- (void)interstitialViewDidShowFailAdWithErrorType:
            (ZADNInterstitialShowErrorType)errorType {
  // 広告表示エラー時
  NSLog(@"広告表示エラー エラータイプ=%d", (int)errorType);
  // 広告読み込み開始(再度広告表示を行いたい場合)
  [[ZADNInterstitialView sharedInstance] loadAd];
}

- (void)interstitialViewDidTapAd {
  // 広告タップ時
  NSLog(@"広告タップ");
}

- (void)interstitialViewDidShowAd {
  // 広告表示時
  NSLog(@"広告表示");
}

- (void)interstitialViewCancelDisplayRate {
  // 表示率キャンセル時
  NSLog(@"表示率キャンセル");
}

@end
