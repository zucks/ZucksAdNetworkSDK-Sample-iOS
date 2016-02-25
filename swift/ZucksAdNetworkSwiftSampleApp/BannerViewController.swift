//
//  BannerViewController.swift
//  ZucksAdNetworkSwiftSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

import UIKit
import ZucksAdNetworkSDK

class BannerViewController: UIViewController, ZADNBannerViewDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()

    // 画面下部にバナーを配置する例(表示位置や枠のサイズに応じて、値を変更してください)
    let bannerSize = CGSizeMake(320.0, 50.0)
    let x = (self.view.frame.size.width - bannerSize.width) / 2.0
    let y = self.view.frame.size.height - bannerSize.height
    let frame = CGRectMake(x, y, bannerSize.width, bannerSize.height)

    // 広告viewを初期化(設定されているframeIdはサンプル広告表示用です)
    let bannerView = ZADNBannerView.init(frame: frame, frameId: "_1d8ba78682")
    // コールバックdelegateを設定
    bannerView.delegate = self;
    // 広告情報ロード開始
    bannerView.loadAd()
    // 広告viewをメインviewにバインド
    self.view.addSubview(bannerView)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // 広告の各イベントで処理を行いたい場合に実装してください(任意)
  // MARK: - ZADNBannerViewDelegate methods
  func bannerViewDidReceiveAd(bannerView: ZADNBannerView!) {
    print("広告情報ロード完了")
  }

  func bannerViewDidTapAd(bannerView: ZADNBannerView!) {
    print("広告タップ")
  }

  func bannerView(bannerView: ZADNBannerView!,
    didFailAdWithErrorType errorType: ZADNBannerErrorType) {
      print("広告情報ロードエラー")
  }


}

