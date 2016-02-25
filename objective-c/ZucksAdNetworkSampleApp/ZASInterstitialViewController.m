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
  // 広告情報ロード開始
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
  NSLog(@"広告情報ロード完了");
}

- (void)interstitialViewDidLoadFailAdWithErrorType:
            (ZADNInterstitialLoadErrorType)errorType {
  NSLog(@"広告情報ロードエラー");
}

- (void)interstitialViewDidShowAd {
  NSLog(@"広告表示");
}

- (void)interstitialViewDidShowFailAdWithErrorType:
            (ZADNInterstitialShowErrorType)errorType {
  NSLog(@"広告表示エラー");
  // 広告情報ロード開始(再度広告表示を行いたい場合)
  [[ZADNInterstitialView sharedInstance] loadAd];
}

- (void)interstitialViewCancelDisplayRate {
  NSLog(@"表示率キャンセル");
}

- (void)interstitialViewDidTapAd {
  NSLog(@"広告タップ");
}

- (void)interstitialViewDidDismissAd {
  NSLog(@"広告クローズ");
  // 広告情報ロード開始(再度広告表示を行いたい場合)
  [[ZADNInterstitialView sharedInstance] loadAd];
}

@end
