//
//  FullScreenInterstitialViewController.swift
//  ZucksAdNetworkSwiftSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

import UIKit
import ZucksAdNetworkSDK

class FullScreenInterstitialViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // frameID設定(設定されているframeIdはサンプル広告表示用です)
    ZADNFullScreenInterstitialView.sharedInstance().frameId = "_2b78d82a34"
    // コールバック通知先設定
    ZADNFullScreenInterstitialView.sharedInstance().delegate = self;
    // 広告情報ロード開始
    ZADNFullScreenInterstitialView.sharedInstance().loadAd()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // statusbarを非表示にする
  override func prefersStatusBarHidden() -> Bool {
    return true
  }

  @IBAction func showButtonDidPush(sender: AnyObject) {
    ZADNFullScreenInterstitialView.sharedInstance().show()
  }
}

// 広告の各イベントで処理を行いたい場合に実装してください(任意)
// MARK: - ZADNFullScreenInterstitialViewDelegate methods
extension FullScreenInterstitialViewController:ZADNFullScreenInterstitialViewDelegate {
  func fullScreenInterstitialViewDidReceiveAd() {
    print("広告情報ロード完了")
  }

  func fullScreenInterstitialViewDidLoadFailAdWith(
    errorType: ZADNFullScreenInterstitialLoadErrorType) {
    print("広告情報ロードエラー")
  }

  func fullScreenInterstitialViewDidShowAd() {
    print("広告表示")
  }

  func fullScreenInterstitialViewDidShowFailAdWith(
    errorType: ZADNFullScreenInterstitialShowErrorType) {
    print("広告表示エラー")
    // 広告情報ロード開始(再度広告表示を行いたい場合)
    ZADNFullScreenInterstitialView.sharedInstance().loadAd()
  }

  func fullScreenInterstitialViewCancelDisplayRate() {
    print("表示率キャンセル")
  }

  func fullScreenInterstitialViewDidTapAd() {
    print("広告タップ")
  }

  func fullScreenInterstitialViewDidDismissAd() {
    print("広告クローズ")
    // 広告情報ロード開始(再度広告表示を行いたい場合)
    ZADNFullScreenInterstitialView.sharedInstance().loadAd()
  }
}
