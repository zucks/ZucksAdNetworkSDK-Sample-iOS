//
//  InterstitialViewController.swift
//  ZucksAdNetworkSwiftSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

import UIKit
import ZucksAdNetworkSDK

class InterstitialViewController: UIViewController, ZADNInterstitialViewDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // frameID設定(設定されているframeIdはサンプル広告表示用です)
    ZADNInterstitialView.sharedInstance().frameId = "_3e64b0843b"
    // コールバック通知先設定
    ZADNInterstitialView.sharedInstance().delegate = self;
    // 広告情報ロード開始
    ZADNInterstitialView.sharedInstance().loadAd()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func showButtonDidPush(sender: AnyObject) {
    // 広告表示
    ZADNInterstitialView.sharedInstance().show()
  }

  // MARK: - ZADNInterstitialViewDelegate methods
  func interstitialViewDidReceiveAd() {
    print("広告情報ロード完了")
  }

  func interstitialViewDidLoadFailAdWithErrorType(errorType: ZADNInterstitialLoadErrorType) {
    print("広告情報ロードエラー")
  }

  func interstitialViewDidShowAd() {
    print("広告表示")
  }

  func interstitialViewDidShowFailAdWithErrorType(errorType: ZADNInterstitialShowErrorType) {
    print("広告表示エラー")
    // 広告情報ロード開始(再度広告表示を行いたい場合)
    ZADNInterstitialView.sharedInstance().loadAd()
  }

  func interstitialViewCancelDisplayRate() {
    print("表示率キャンセル")
  }

  func interstitialViewDidTapAd() {
    print("広告タップ")
  }

  func interstitialViewDidDismissAd() {
    print("広告クローズ")
    // 広告情報ロード開始(再度広告表示を行いたい場合)
    ZADNInterstitialView.sharedInstance().loadAd()
  }

}
