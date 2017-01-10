//
//  FullScreenBannerViewController.swift
//  ZucksAdNetworkSwiftSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

import UIKit
import ZucksAdNetworkSDK

class FullScreenBannerViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // 広告表示領域を設定(アプリの状態に合わせて値を変更してください)
    let statusBarHeight:CGFloat = 20.0
    let navigationBarHeight = self.navigationController!.navigationBar.frame.size.height
    let headerHeight = statusBarHeight + navigationBarHeight
    let frame = CGRect(x: 0.0, y: headerHeight, width: self.view.frame.size.width,
                       height: self.view.frame.size.height - headerHeight);

    // 広告viewを初期化(設定されているframeIdはサンプル広告表示用です)
    let fullScreenBanner = ZADNFullScreenBannerView(frame: frame, frameId: "_4685895172")

    // コールバックdelegateを設定
    fullScreenBanner.delegate = self

    // 広告情報ロード開始
    fullScreenBanner.loadAd()

    // 広告viewをメインviewにバインド
    self.view.addSubview(fullScreenBanner)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

// MARK: - ZADNFullScreenBannerViewDelegate methods
// 広告の各イベントで処理を行いたい場合に実装してください(任意)
extension FullScreenBannerViewController:ZADNFullScreenBannerViewDelegate {
  func fullScreenBannerViewDidReceiveAd(_ fullScreenBannerView: ZADNFullScreenBannerView) {
    print("広告情報ロード完了")
  }

  func fullScreenBannerViewDidTapAd(_ fullScreenBannerView: ZADNFullScreenBannerView) {
    print("広告タップ")
  }

  func fullScreenBannerView(_ fullScreenBannerView: ZADNFullScreenBannerView, didFailAdWith errorType: ZADNFullScreenBannerErrorType) {
    print("広告情報ロードエラー")
  }
}
