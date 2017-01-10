
//
//  BannerInterfaceBuilderViewController.swift
//  ZucksAdNetworkSwiftSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

import UIKit
import ZucksAdNetworkSDK

class BannerInterfaceBuilderViewController: UIViewController, ZADNBannerViewDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // ZADNBannerViewの実装はMain.storyboard上で行っています
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // 広告の各イベントで処理を行いたい場合に実装してください(任意)
  // MARK: - ZADNBannerViewDelegate methods
  func bannerViewDidReceiveAd(bannerView: ZADNBannerView) {
    print("広告情報ロード完了")
  }

  func bannerViewDidTapAd(bannerView: ZADNBannerView) {
    print("広告タップ")
  }

  func bannerView(bannerView: ZADNBannerView,
    didFailAdWithErrorType errorType: ZADNBannerErrorType) {
      print("広告情報ロードエラー")
  }

}
