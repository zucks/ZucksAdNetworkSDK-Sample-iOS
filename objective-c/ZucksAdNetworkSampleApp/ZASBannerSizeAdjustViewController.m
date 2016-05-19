//
//  ZASBannerSizeAdjustViewController.m
//  ZucksAdNetworkSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

#import "ZASBannerSizeAdjustViewController.h"
@import ZucksAdNetworkSDK;

@interface ZASBannerSizeAdjustViewController ()

@end

@implementation ZASBannerSizeAdjustViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // 画面下部にバナーを配置(表示位置や枠のサイズに応じて、値を変更してください)
  // 拡大後のバナーサイズを取得
  CGSize bannerSize =
      [ZADNBannerView adjustedBannerSize:CGSizeMake(320.0, 50.0)];
  CGFloat x = (self.view.frame.size.width - bannerSize.width) / 2.0;
  CGFloat y = self.view.frame.size.height - bannerSize.height;
  CGRect frame = CGRectMake(x, y, bannerSize.width, bannerSize.height);

  // 広告viewを初期化(設定されているframeIdはサンプル広告表示用です)
  ZADNBannerView *bannerView =
      [[ZADNBannerView alloc] initWithFrame:frame
                                    frameId:@"_1d8ba78682"
                                 sizeAdjust:YES];
  // 広告情報ロード開始
  [bannerView loadAd];
  // 広告viewをメインviewにバインド
  [self.view addSubview:bannerView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
