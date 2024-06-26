//
//  BannerSizeAdjustViewController.swift
//  ZucksAdNetworkSwiftSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

import UIKit
import ZucksAdNetworkSDK

class BannerSizeAdjustViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // 画面下部にバナーを配置する例(表示位置や枠のサイズに応じて、値を変更してください)
    // 拡大後のバナーサイズを取得
    let bannerSize = ZADNBannerView.adjustedBannerSize(CGSize(width: 320, height: 50))
    let x = (self.view.frame.size.width - bannerSize.width) / 2.0
    let y = self.view.frame.size.height - bannerSize.height
    let frame = CGRect(x: x, y: y, width: bannerSize.width, height: bannerSize.height)

    // 広告viewを初期化(設定されているframeIdはサンプル広告表示用です)
    let bannerView = ZADNBannerView.init(frame: frame, frameId: "_1d8ba78682", sizeAdjust: true)
    // 広告情報ロード開始
    bannerView.loadAd()
    // 広告viewをメインviewにバインド
    self.view.addSubview(bannerView)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
